import { supabase } from '../../supabase.js';

document.addEventListener('DOMContentLoaded', () => {
    const loginForm = document.getElementById('login-form');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    const errorMessage = document.getElementById('error-message');
    const loginBtn = document.getElementById('login-btn');

    // Manda para dashboard caso já esteja logado
    supabase.auth.getSession().then(({ data: { session } }) => {
        if (session) {
            window.location.href = 'dashboard.html';
        }
    });

    loginForm.addEventListener('submit', async (e) => {
        e.preventDefault();
        
        loginBtn.textContent = 'Entrando...';
        loginBtn.disabled = true;
        errorMessage.style.display = 'none';

        const email = emailInput.value;
        const password = passwordInput.value;

        const { data, error } = await supabase.auth.signInWithPassword({
            email,
            password
        });

        if (error) {
            errorMessage.textContent = 'Erro ao realizar login. Verifique suas credenciais.';
            errorMessage.style.display = 'block';
            loginBtn.textContent = 'Entrar';
            loginBtn.disabled = false;
        } else {
            window.location.href = 'dashboard.html';
        }
    });
});
