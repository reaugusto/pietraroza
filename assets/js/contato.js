import { supabase } from './supabase-client.js';

document.addEventListener('DOMContentLoaded', () => {
    const contactForm = document.getElementById('contact-form');
    const formMessage = document.getElementById('form-message');
    const submitBtn = contactForm.querySelector('button[type="submit"]');

    if (contactForm) {
        contactForm.addEventListener('submit', async (e) => {
            e.preventDefault();
            
            // Get values
            const name = document.getElementById('nome').value.trim();
            const email = document.getElementById('email').value.trim();
            const project_type = document.getElementById('tipo').value.trim();
            const message = document.getElementById('mensagem').value.trim();
            
            // Validate
            if (!name || !email || !message) {
                showMessage('Por favor, preencha todos os campos obrigatórios.', 'error');
                return;
            }

            // UI Feedback
            const originalBtnText = submitBtn.textContent;
            submitBtn.textContent = 'Enviando...';
            submitBtn.disabled = true;
            
            try {
                // Determine telephone if needed (not in form currently, keeping null)
                const { error } = await supabase.from('leads').insert([{
                    name,
                    email,
                    project_type: project_type || 'Não especificado',
                    message,
                    status: 'novo'
                }]);

                if (error) throw error;
                
                // Tenta disparar o e-mail via SMTP Edge Function
                try {
                    await supabase.functions.invoke('send-lead-email', {
                        body: { name, email, phone: 'Não informado', message }
                    });
                } catch (e) {
                    console.error('Erro ao chamar a func de email:', e);
                }

                showMessage('Mensagem enviada com sucesso! Entraremos em contato em breve.', 'success');
                contactForm.reset();
            } catch (err) {
                console.error('Erro ao enviar contato:', err);
                showMessage('Ocorreu um erro ao enviar sua mensagem. Tente novamente mais tarde.', 'error');
            } finally {
                submitBtn.textContent = originalBtnText;
                submitBtn.disabled = false;
            }
        });
    }

    function showMessage(msg, type) {
        if (!formMessage) return;
        formMessage.textContent = msg;
        formMessage.style.display = 'block';
        if (type === 'error') {
            formMessage.style.color = '#e74c3c';
        } else {
            formMessage.style.color = '#2ecc71';
        }
        
        // Hide after 5 seconds
        setTimeout(() => {
            formMessage.style.display = 'none';
        }, 5000);
    }
});
