import re

with open('material-category.html', 'r', encoding='utf-8') as f:
    html = f.read()

pattern = r'data-name="([^"]+)"\s+data-origin="([^"]+)"\s+data-img="([^"]+)"\s+data-desc="([^"]+)"'
matches = re.findall(pattern, html)
print(f'Encontrados {len(matches)} mármores')

sql = '''
DO $$
DECLARE
  var_cat_id uuid := gen_random_uuid();
BEGIN
  INSERT INTO public.materials_categories (id, slug, label, order_index)
  VALUES (var_cat_id, 'marmores', 'Mármores', 0);
'''
for i, (name, origin, img, desc) in enumerate(matches):
    sql += f"""
  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, '{name}', '{desc}', '{img}', {i+1});
"""
sql += 'END $$;'
with open('seed_marmores.sql', 'w', encoding='utf-8') as f:
    f.write(sql)
