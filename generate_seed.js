const fs = require('fs');
const path = require('path');

// Ler o arquivo galeria-data.js
const galeriaPath = path.join(__dirname, 'assets', 'js', 'galeria-data.js');
let galeriaContent = fs.readFileSync(galeriaPath, 'utf8');

// Simplificando o eval cortando a parte do DOM
galeriaContent = galeriaContent.substring(galeriaContent.indexOf('const collections = '), galeriaContent.indexOf('// Renderizar coleções'));
eval(galeriaContent.replace('const collections =', 'global.collections =')); // define 'collections' no escopo atual

const obrasPath = path.join(__dirname, 'assets', 'js', 'obras-data.js');
let obrasContent = fs.readFileSync(obrasPath, 'utf8');
obrasContent = obrasContent.substring(obrasContent.indexOf('const obrasData = '), obrasContent.indexOf('// Renderizar projetos'));
eval(obrasContent.replace('const obrasData =', 'global.obrasData =')); // define 'obrasData'

let sql = '';

// MATERIALS
const folderMap = {
  granitos: 'granitos',
  onix: 'onix',
  quartzitos: 'quartzitos',
  travertinos: 'travertinos',
  fabricados: 'fabricados'
};

let c_index = 0;
for (const [slug, data] of Object.entries(global.collections)) {
  c_index++;
  const cat_id = `gen_random_uuid()`;
  // Add category insert but we need to reference the ID, so we will generate deterministic or use CTEs.
  // Better: DO block
  sql += `
DO $$
DECLARE
  var_cat_id uuid := gen_random_uuid();
BEGIN
  INSERT INTO public.materials_categories (id, slug, label, order_index)
  VALUES (var_cat_id, '${slug}', '${data.label.replace(/'/g, "''")}', ${c_index});
`;
  
  let m_index = 0;
  for (const item of data.items) {
    m_index++;
    const image_url = `assets/img/${folderMap[slug]}/${item.file}`;
    const name = item.name.replace(/'/g, "''");
    const desc = item.desc.replace(/'/g, "''");
    
    sql += `
  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, '${name}', '${desc}', '${image_url}', ${m_index});
`;
  }
  
  sql += `END $$;\n\n`;
}

// WORKS
let w_c_index = 0;
for (const [slug, data] of Object.entries(global.obrasData)) {
  w_c_index++;
  sql += `
DO $$
DECLARE
  var_cat_id uuid := gen_random_uuid();
BEGIN
  INSERT INTO public.works_categories (id, slug, label, order_index)
  VALUES (var_cat_id, '${slug}', '${data.label.replace(/'/g, "''")}', ${w_c_index});
`;
  
  let w_index = 0;
  for (const item of data.items) {
    w_index++;
    const image_url = `assets/img/portfolio/${item.file}`;
    const name = item.name.replace(/'/g, "''");
    const desc = item.desc.replace(/'/g, "''");
    
    sql += `
  INSERT INTO public.works (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, '${name}', '${desc}', '${image_url}', ${w_index});
`;
  }
  
  sql += `END $$;\n\n`;
}

fs.writeFileSync(path.join(__dirname, 'seed.sql'), sql);
console.log('generated seed.sql');

