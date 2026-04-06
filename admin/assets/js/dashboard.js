import { supabase } from '../../supabase.js';

document.addEventListener('DOMContentLoaded', async () => {
    // 1. AUTH CHECK
    const { data: { session }, error } = await supabase.auth.getSession();
    if (error || !session) {
        window.location.href = 'index.html';
        return;
    }
    
    // Mostra o dashboard se estiver logado
    document.body.style.display = 'flex';

    // 2. LOGOUT handler
    document.getElementById('logout-btn').addEventListener('click', async () => {
        await supabase.auth.signOut();
        window.location.href = 'index.html';
    });

    // 3. UI STATE - Sidebar Navigation
    const navLinks = document.querySelectorAll('.nav-link');
    const panels = document.querySelectorAll('.panel');

    navLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            navLinks.forEach(l => l.classList.remove('active'));
            panels.forEach(p => p.classList.remove('active'));
            
            link.classList.add('active');
            const target = link.getAttribute('data-target');
            document.getElementById(target).classList.add('active');
        });
    });

    // Loading indicator
    const loading = document.getElementById('loading-indicator');
    const showLoading = () => loading.style.display = 'block';
    const hideLoading = () => loading.style.display = 'none';

    // Toast Helper
    const showToast = (message, type = 'success') => {
        const toast = document.createElement('div');
        toast.textContent = message;
        toast.style.position = 'fixed';
        toast.style.bottom = '20px';
        toast.style.right = '20px';
        toast.style.padding = '12px 24px';
        toast.style.borderRadius = '4px';
        toast.style.color = '#fff';
        toast.style.fontSize = '14px';
        toast.style.zIndex = '10000';
        toast.style.transition = 'all 0.3s ease';
        toast.style.boxShadow = '0 4px 6px rgba(0,0,0,0.1)';
        toast.style.backgroundColor = type === 'success' ? '#2ecc71' : '#e74c3c';
        
        document.body.appendChild(toast);
        
        setTimeout(() => {
            toast.style.opacity = '0';
            toast.style.transform = 'translateY(10px)';
            setTimeout(() => toast.remove(), 300);
        }, 3000);
    };

    // Helper: Gerar path para imagem
    const getStoragePath = (folder, file) => {
        const ext = file.name.split('.').pop();
        return `${folder}/${Date.now()}-${Math.random().toString(36).substring(7)}.${ext}`;
    };

    // Helper: Upload de imagem
    const uploadImage = async (file, folder) => {
        const path = getStoragePath(folder, file);
        const { data, error } = await supabase.storage.from('images').upload(path, file);
        if (error) throw error;
        const { data: { publicUrl } } = supabase.storage.from('images').getPublicUrl(path);
        return publicUrl;
    };

    // ================= MATERIAIS =================
    let matCategories = [];

    async function loadMaterialCategories() {
        const { data } = await supabase.from('materials_categories').select('*').order('order_index');
        matCategories = data || [];
        const select = document.getElementById('material-category');
        select.innerHTML = '<option value="">Selecione...</option>';
        matCategories.forEach(cat => {
            select.innerHTML += `<option value="${cat.id}">${cat.label}</option>`;
        });
    }

    async function loadMaterials() {
        showLoading();
        // Load with categories joined
        const { data, error } = await supabase
            .from('materials')
            .select('*, category:materials_categories(label)')
            .order('name');
        
        const tbody = document.getElementById('materials-tbody');
        tbody.innerHTML = '';
        
        if (data) {
            data.forEach(item => {
                const tr = document.createElement('tr');
                const catLabel = item.category ? item.category.label : 'Sem Categoria';
                tr.innerHTML = `
                    <td><img src="${item.image_url}" class="thumbnail" onerror="this.src='https://via.placeholder.com/50'"></td>
                    <td>${item.name}</td>
                    <td>${catLabel}</td>
                    <td class="actions">
                        <button class="btn btn-primary btn-small edit-mat" data-id="${item.id}">Editar</button>
                        <button class="btn btn-danger btn-small delete-mat" data-id="${item.id}">Deletar</button>
                    </td>
                `;
                tbody.appendChild(tr);
            });
        }
        hideLoading();
    }

    document.getElementById('material-form').addEventListener('submit', async (e) => {
        e.preventDefault();
        const btn = document.getElementById('material-save-btn');
        btn.textContent = 'Salvando...';
        btn.disabled = true;

        try {
            const id = document.getElementById('material-id').value;
            const name = document.getElementById('material-name').value;
            const catId = document.getElementById('material-category').value;
            const description = document.getElementById('material-description').value;
            const fileInput = document.getElementById('material-image');
            
            let imageUrl = document.getElementById('material-image-url').value;

            if (fileInput.files.length > 0) {
                imageUrl = await uploadImage(fileInput.files[0], 'materials');
            }

            const payload = {
                name,
                category_id: catId,
                description,
                image_url: imageUrl
            };

            if (id) {
                // Update
                if (!imageUrl && fileInput.files.length === 0) {
                    showToast('Por favor, informe uma imagem caso esta pedra não possua uma.', 'error');
                    return;
                }
                await supabase.from('materials').update(payload).eq('id', id);
                showToast('Material atualizado com sucesso!', 'success');
            } else {
                // Insert
                if (!imageUrl) {
                    showToast('Por favor, faça upload de uma imagem!', 'error');
                    return;
                }
                await supabase.from('materials').insert([payload]);
                showToast('Material cadastrado com sucesso!', 'success');
            }

            closeModal('material-modal');
            await loadMaterials();
        } catch (err) {
            console.error(err);
            showToast('Erro ao salvar material: ' + err.message, 'error');
        } finally {
            btn.textContent = 'Salvar';
            btn.disabled = false;
        }
    });

    document.getElementById('materials-tbody').addEventListener('click', async (e) => {
        if (e.target.classList.contains('delete-mat')) {
            if (confirm('Tem certeza que deseja deletar este material?')) {
                const id = e.target.getAttribute('data-id');
                try {
                    await supabase.from('materials').delete().eq('id', id);
                    showToast('Material deletado com sucesso!', 'success');
                    await loadMaterials();
                } catch(err) {
                    showToast('Erro ao deletar: ' + err.message, 'error');
                }
            }
        } else if (e.target.classList.contains('edit-mat')) {
            const id = e.target.getAttribute('data-id');
            const { data } = await supabase.from('materials').select('*').eq('id', id).single();
            if (data) {
                document.getElementById('material-modal-title').textContent = 'Editar Material';
                document.getElementById('material-id').value = data.id;
                document.getElementById('material-name').value = data.name;
                document.getElementById('material-category').value = data.category_id;
                document.getElementById('material-description').value = data.description || '';
                document.getElementById('material-image-url').value = data.image_url;
                openModal('material-modal');
            }
        }
    });


    // ================= OBRAS (WORKS) =================
    let worksCategories = [];

    async function loadWorksCategories() {
        const { data } = await supabase.from('works_categories').select('*').order('order_index');
        worksCategories = data || [];
        const select = document.getElementById('work-category');
        select.innerHTML = '<option value="">Selecione...</option>';
        worksCategories.forEach(cat => {
            select.innerHTML += `<option value="${cat.id}">${cat.label}</option>`;
        });
    }

    async function loadWorks() {
        showLoading();
        const { data, error } = await supabase
            .from('works')
            .select('*, category:works_categories(label)')
            .order('name');
        
        const tbody = document.getElementById('works-tbody');
        tbody.innerHTML = '';
        
        if (data) {
            data.forEach(item => {
                const catLabel = item.category ? item.category.label : 'Sem Categoria';
                const isFeatured = item.featured ? 'Sim' : 'Não';
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td><img src="${item.image_url}" class="thumbnail" onerror="this.src='https://via.placeholder.com/50'"></td>
                    <td>${item.name}</td>
                    <td>${catLabel}</td>
                    <td>${isFeatured}</td>
                    <td class="actions">
                        <button class="btn btn-primary btn-small edit-work" data-id="${item.id}">Editar</button>
                        <button class="btn btn-danger btn-small delete-work" data-id="${item.id}">Deletar</button>
                    </td>
                `;
                tbody.appendChild(tr);
            });
        }
        hideLoading();
    }

    document.getElementById('work-form').addEventListener('submit', async (e) => {
        e.preventDefault();
        const btn = document.getElementById('work-save-btn');
        btn.textContent = 'Salvando...';
        btn.disabled = true;

        try {
            const id = document.getElementById('work-id').value;
            const title = document.getElementById('work-title').value;
            const catId = document.getElementById('work-category').value;
            const description = document.getElementById('work-description').value;
            const featured = document.getElementById('work-featured').checked;
            const fileInput = document.getElementById('work-image');
            
            let imageUrl = document.getElementById('work-image-url').value;

            if (fileInput.files.length > 0) {
                imageUrl = await uploadImage(fileInput.files[0], 'obras');
            }

            const payload = {
                name: title,
                category_id: catId,
                description,
                featured,
                image_url: imageUrl
            };

            if (id) {
                if (!imageUrl && fileInput.files.length === 0) {
                    showToast('Envie uma imagem para a obra.', 'error');
                    return;
                }
                await supabase.from('works').update(payload).eq('id', id);
                showToast('Obra atualizada com sucesso!', 'success');
            } else {
                if (!imageUrl) {
                    showToast('O upload da imagem principal é obrigatório.', 'error');
                    return;
                }
                await supabase.from('works').insert([payload]);
                showToast('Obra cadastrada com sucesso!', 'success');
            }

            closeModal('work-modal');
            await loadWorks();
        } catch (err) {
            console.error(err);
            showToast('Erro ao salvar obra: ' + err.message, 'error');
        } finally {
            btn.textContent = 'Salvar';
            btn.disabled = false;
        }
    });

    document.getElementById('works-tbody').addEventListener('click', async (e) => {
        if (e.target.classList.contains('delete-work')) {
            if (confirm('Tem certeza que deseja deletar esta obra?')) {
                const id = e.target.getAttribute('data-id');
                try {
                    await supabase.from('works').delete().eq('id', id);
                    showToast('Obra deletada com sucesso!', 'success');
                    await loadWorks();
                } catch(err) {
                    showToast('Erro ao deletar obra.', 'error');
                }
            }
        } else if (e.target.classList.contains('edit-work')) {
            const id = e.target.getAttribute('data-id');
            const { data } = await supabase.from('works').select('*').eq('id', id).single();
            if (data) {
                document.getElementById('work-modal-title').textContent = 'Editar Obra';
                document.getElementById('work-id').value = data.id;
                document.getElementById('work-title').value = data.name;
                document.getElementById('work-category').value = data.category_id;
                document.getElementById('work-description').value = data.description || '';
                document.getElementById('work-featured').checked = data.featured;
                document.getElementById('work-image-url').value = data.image_url;
                openModal('work-modal');
            }
        }
    });

    // ================= LEADS =================
    async function loadLeads() {
        showLoading();
        const { data, error } = await supabase.from('leads').select('*').order('created_at', { ascending: false });
        
        const tbody = document.getElementById('leads-tbody');
        tbody.innerHTML = '';
        
        if (data) {
            data.forEach(item => {
                const date = new Date(item.created_at).toLocaleDateString('pt-BR');
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td>${date}</td>
                    <td>${item.name}</td>
                    <td>${item.email}</td>
                    <td>${item.phone}</td>
                    <td><span style="padding:4px 8px;border-radius:4px;background-color:${item.status==='novo'?'#fee2e2':'#dcfce7'};color:${item.status==='novo'?'#991b1b':'#166534'};font-size:12px;">${item.status.toUpperCase()}</span></td>
                    <td class="actions">
                        ${item.status === 'novo' ? `<button class="btn btn-outline btn-small act-lead" data-id="${item.id}">Marcar Respondido</button>` : ''}
                        <button class="btn btn-danger btn-small delete-lead" data-id="${item.id}">Deletar</button>
                    </td>
                `;
                tbody.appendChild(tr);
            });
        }
        hideLoading();
    }

    document.getElementById('leads-tbody').addEventListener('click', async (e) => {
        if (e.target.classList.contains('delete-lead')) {
            if (confirm('Deletar este lead?')) {
                const id = e.target.getAttribute('data-id');
                await supabase.from('leads').delete().eq('id', id);
                await loadLeads();
            }
        } else if (e.target.classList.contains('act-lead')) {
            const id = e.target.getAttribute('data-id');
            await supabase.from('leads').update({status: 'respondido'}).eq('id', id);
            await loadLeads();
        }
    });


    // ================= CATEGORIAS DE MATERIAIS =================
    async function loadMatCatsTable() {
        showLoading();
        const { data } = await supabase.from('materials_categories').select('*').order('order_index');
        const tbody = document.getElementById('mat-cat-tbody');
        tbody.innerHTML = '';
        if (data) {
            data.forEach(item => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td>${item.label}</td>
                    <td>${item.slug}</td>
                    <td>${item.order_index}</td>
                    <td class="actions">
                        <button class="btn btn-primary btn-small edit-mat-cat" data-id="${item.id}">Editar</button>
                        <button class="btn btn-danger btn-small delete-mat-cat" data-id="${item.id}">Deletar</button>
                    </td>
                `;
                tbody.appendChild(tr);
            });
        }
        hideLoading();
    }

    document.getElementById('mat-cat-form').addEventListener('submit', async (e) => {
        e.preventDefault();
        const id = document.getElementById('mat-cat-id').value;
        const payload = {
            label: document.getElementById('mat-cat-label').value,
            slug: document.getElementById('mat-cat-slug').value,
            order_index: parseInt(document.getElementById('mat-cat-order').value) || 0
        };

        try {
            if (id) {
                await supabase.from('materials_categories').update(payload).eq('id', id);
                showToast('Categoria atualizada!', 'success');
            } else {
                await supabase.from('materials_categories').insert([payload]);
                showToast('Categoria criada!', 'success');
            }
            closeModal('mat-cat-modal');
            await loadMaterialCategories(); // atualiza o select
            await loadMatCatsTable();
        } catch (err) {
            showToast('Erro: ' + err.message, 'error');
        }
    });

    document.getElementById('mat-cat-tbody').addEventListener('click', async (e) => {
        if (e.target.classList.contains('delete-mat-cat')) {
            if (confirm('Deletar esta categoria?')) {
                const id = e.target.getAttribute('data-id');
                await supabase.from('materials_categories').delete().eq('id', id);
                await loadMaterialCategories();
                await loadMatCatsTable();
                showToast('Categoria deletada!', 'success');
            }
        } else if (e.target.classList.contains('edit-mat-cat')) {
            const id = e.target.getAttribute('data-id');
            const { data } = await supabase.from('materials_categories').select('*').eq('id', id).single();
            if (data) {
                document.getElementById('mat-cat-modal-title').textContent = 'Editar Categoria';
                document.getElementById('mat-cat-id').value = data.id;
                document.getElementById('mat-cat-label').value = data.label;
                document.getElementById('mat-cat-slug').value = data.slug;
                document.getElementById('mat-cat-order').value = data.order_index;
                openModal('mat-cat-modal');
            }
        }
    });


    // ================= CATEGORIAS DE OBRAS =================
    async function loadWorkCatsTable() {
        showLoading();
        const { data } = await supabase.from('works_categories').select('*').order('order_index');
        const tbody = document.getElementById('work-cat-tbody');
        tbody.innerHTML = '';
        if (data) {
            data.forEach(item => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td>${item.label}</td>
                    <td>${item.slug}</td>
                    <td>${item.order_index}</td>
                    <td class="actions">
                        <button class="btn btn-primary btn-small edit-work-cat" data-id="${item.id}">Editar</button>
                        <button class="btn btn-danger btn-small delete-work-cat" data-id="${item.id}">Deletar</button>
                    </td>
                `;
                tbody.appendChild(tr);
            });
        }
        hideLoading();
    }

    document.getElementById('work-cat-form').addEventListener('submit', async (e) => {
        e.preventDefault();
        const id = document.getElementById('work-cat-id').value;
        const payload = {
            label: document.getElementById('work-cat-label').value,
            slug: document.getElementById('work-cat-slug').value,
            order_index: parseInt(document.getElementById('work-cat-order').value) || 0
        };

        try {
            if (id) {
                await supabase.from('works_categories').update(payload).eq('id', id);
                showToast('Categoria atualizada!', 'success');
            } else {
                await supabase.from('works_categories').insert([payload]);
                showToast('Categoria criada!', 'success');
            }
            closeModal('work-cat-modal');
            await loadWorksCategories(); // atualiza o select
            await loadWorkCatsTable();
        } catch (err) {
            showToast('Erro: ' + err.message, 'error');
        }
    });

    document.getElementById('work-cat-tbody').addEventListener('click', async (e) => {
        if (e.target.classList.contains('delete-work-cat')) {
            if (confirm('Deletar esta categoria?')) {
                const id = e.target.getAttribute('data-id');
                await supabase.from('works_categories').delete().eq('id', id);
                await loadWorksCategories();
                await loadWorkCatsTable();
                showToast('Categoria deletada!', 'success');
            }
        } else if (e.target.classList.contains('edit-work-cat')) {
            const id = e.target.getAttribute('data-id');
            const { data } = await supabase.from('works_categories').select('*').eq('id', id).single();
            if (data) {
                document.getElementById('work-cat-modal-title').textContent = 'Editar Categoria';
                document.getElementById('work-cat-id').value = data.id;
                document.getElementById('work-cat-label').value = data.label;
                document.getElementById('work-cat-slug').value = data.slug;
                document.getElementById('work-cat-order').value = data.order_index;
                openModal('work-cat-modal');
            }
        }
    });

    // ================= CONFIGURAÇÕES GERAIS E SMTP =================
    async function loadSettings() {
        const { data: siteObj } = await supabase.from('site_settings').select('*').eq('id', 1).single();
        if (siteObj) {
            document.getElementById('set-site-name').value = siteObj.site_name || '';
            document.getElementById('set-address').value = siteObj.address || '';
            document.getElementById('set-phone').value = siteObj.phone || '';
            document.getElementById('set-contact-email').value = siteObj.contact_email || '';
            document.getElementById('set-hero-title').value = siteObj.hero_title || '';
            document.getElementById('set-hero-subtitle').value = siteObj.hero_subtitle || '';
            document.getElementById('set-about-text').value = siteObj.about_text || '';
            document.getElementById('set-footer-text').value = siteObj.footer_text || '';
        }

        const { data: smtpObj } = await supabase.from('smtp_settings').select('*').eq('id', 1).single();
        if (smtpObj) {
            document.getElementById('set-smtp-host').value = smtpObj.host || '';
            document.getElementById('set-smtp-port').value = smtpObj.port || '';
            document.getElementById('set-smtp-user').value = smtpObj.username || '';
            document.getElementById('set-smtp-pass').value = smtpObj.password || '';
            document.getElementById('set-target-email').value = smtpObj.target_email || '';
        }
    }

    document.getElementById('save-settings-btn').addEventListener('click', async () => {
        const btn = document.getElementById('save-settings-btn');
        btn.textContent = 'Salvando...';
        btn.disabled = true;
        
        try {
            await supabase.from('site_settings').upsert({
                id: 1,
                site_name: document.getElementById('set-site-name').value,
                address: document.getElementById('set-address').value,
                phone: document.getElementById('set-phone').value,
                contact_email: document.getElementById('set-contact-email').value,
                hero_title: document.getElementById('set-hero-title').value,
                hero_subtitle: document.getElementById('set-hero-subtitle').value,
                about_text: document.getElementById('set-about-text').value,
                footer_text: document.getElementById('set-footer-text').value
            });

            await supabase.from('smtp_settings').upsert({
                id: 1,
                host: document.getElementById('set-smtp-host').value,
                port: parseInt(document.getElementById('set-smtp-port').value) || null,
                username: document.getElementById('set-smtp-user').value,
                password: document.getElementById('set-smtp-pass').value,
                target_email: document.getElementById('set-target-email').value
            });
            
            showToast('Configurações salvas!', 'success');
        } catch(err) {
            showToast('Erro ao salvar.', 'error');
        }
        
        btn.textContent = 'Salvar Configurações';
        btn.disabled = false;
    });

    // INIT LOAD
    loadMaterialCategories();
    loadWorksCategories();
    loadMatCatsTable();
    loadWorkCatsTable();
    loadMaterials();
    loadWorks();
    loadLeads();
    loadSettings();
});
