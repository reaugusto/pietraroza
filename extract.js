const fs = require('fs');

const html = fs.readFileSync('material-category.html', 'utf8');
const pattern = /data-name="([^"]+)"\s+data-origin="([^"]+)"\s+data-img="([^"]+)"\s+data-desc="([^"]+)"/g;

const matches = [];
let match;
while ((match = pattern.exec(html)) !== null) {
    matches.push(match);
}

console.log(`Encontrados ${matches.length} mármores`);

let sql = `
DO $$
DECLARE
  var_cat_id uuid := gen_random_uuid();
BEGIN
  INSERT INTO public.materials_categories (id, slug, label, order_index)
  VALUES (var_cat_id, 'marmores', 'Mármores', 0);
`;

matches.forEach((m, i) => {
    const name = m[1].replace(/'/g, "''");
    const origin = m[2].replace(/'/g, "''");
    const img = m[3].replace(/'/g, "''");
    const desc = m[4].replace(/'/g, "''");
    
    sql += `
  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, '${name}', '${desc}', '${img}', ${i+1});
`;
});

sql += 'END $$;';
fs.writeFileSync('seed_marmores.sql', sql, 'utf8');
