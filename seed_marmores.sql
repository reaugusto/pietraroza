
DO $$
DECLARE
  var_cat_id uuid := gen_random_uuid();
BEGIN
  INSERT INTO public.materials_categories (id, slug, label, order_index)
  VALUES (var_cat_id, 'marmores', 'Mármores', 0);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Arabescato', 'Mármore italiano com veios cinza e dourados sobre fundo branco. Ideal para bancadas de cozinha, revestimentos de banheiros e peças de mobiliário exclusivas.', 'assets/img/marmores/MARMORE-ARABESCATO.jpg', 1);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Black and Gold', 'Mármore negro com veios dourados intensos. Perfeito para lavabos, lareiras, tampos de mesa e detalhes que demandam sofisticação máxima.', 'assets/img/marmores/MARMORE-BLACK-AND-GOLD.jpg', 2);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Blue Sky', 'Mármore exótico brasileiro com tonalidades azuladas. Indicado para painéis de destaque, bancadas e revestimentos de áreas sociais.', 'assets/img/marmores/MARMORE-BLUE-SKY.jpg', 3);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Botticino Clássico Extra', 'Mármore clássico italiano de tom bege uniforme. Ideal para pisos de grande formato, halls de entrada e revestimentos de fachadas.', 'assets/img/marmores/MARMORE-BOTTICINO-CLASSICO-EXTRA.jpg', 4);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Botticino Clássico', 'Versão standard do clássico Botticino italiano. Excelente para pisos, escadas e revestimentos internos com acabamento elegante.', 'assets/img/marmores/MARMORE-BOTTICINO-CLASSICO.jpg', 5);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Branco Ariston', 'Mármore branco puro de origem grega. Recomendado para bancadas de banheiro, revestimentos claros e projetos minimalistas.', 'assets/img/marmores/MARMORE-BRANCO-ARISTON.jpg', 6);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Branco Carrarinha', 'Mármore branco nacional com leve veio acinzentado. Ótimo para pisos, bancadas e revestimentos de custo acessível.', 'assets/img/marmores/MARMORE-BRANCO-CARRARINHA.jpg', 7);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Branco Champagne', 'Mármore branco com suave tonalidade champanhe. Ideal para ambientes sofisticados, pisos e revestimentos de paredes.', 'assets/img/marmores/MARMORE-BRANCO-CHAMPAGNE.jpg', 8);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Branco Sivec Extra', 'Um dos mármores mais brancos do mundo, totalmente puro. Perfeito para esculturas, bancadas de alto padrão e projetos de luxo.', 'assets/img/marmores/MARMORE-BRANCO-SIVEC-EXTRA.jpg', 9);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Branco Thassos', 'Mármore branco cristalino da ilha de Thassos. Ideal para banheiros luxuosos, pisos e mosaicos decorativos.', 'assets/img/marmores/MARMORE-BRANCO-THASSOS.jpg', 10);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Breccia Oniciata', 'Mármore exótico italiano com padrão de fragmentos minerais. Excelente para painéis decorativos, mesas e peças statement.', 'assets/img/marmores/MARMORE-BRECCi-ONICiTA.jpg', 11);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Bronze Armani', 'Mármore italiano de tonalidade bronze sofisticada. Perfeito para lareiras, painéis de TV e ambientes com iluminação quente.', 'assets/img/marmores/MARMORE-BRONZE-ARMANI.jpg', 12);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Calacatta Gold Extra', 'O Calacatta Gold Extra é um dos mármores mais nobres do mundo. Veios dourados intensos sobre fundo branco puro. Ideal para cozinhas e bancadas de alto padrão.', 'assets/img/marmores/MARMORE-CALACATTA-GOLD-EXTRA.jpg', 13);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Calacatta Machia Oro', 'Variação do Calacatta com manchas douradas expressivas. Recomendado para ilhas de cozinha, painéis e revestimentos de impacto.', 'assets/img/marmores/MARMORE-CALACATTA-MACHi-ORO.jpg', 14);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Calacatta Oro', 'Calacatta com veios dourados elegantes. Pedra nobre para ambientes requintados, bancadas e projetos de design de interiores.', 'assets/img/marmores/MARMORE-CALACATTA-ORO.jpg', 15);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Carrara Gioia', 'Versão premium do clássico Carrara com veios mais definidos. Indicado para pisos, banheiros e ambientes clássicos.', 'assets/img/marmores/MARMORE-CARRARA-GIOi.jpg', 16);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Crema Marfil', 'Mármore bege espanhol de grande uniformidade. Excelente para pisos de áreas amplas, escadas e revestimentos residenciais.', 'assets/img/marmores/MARMORE-CREMA-MARFIL.jpg', 17);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Crema Marfil Standard', 'Versão standard do Crema Marfil, com variação de veios. Indicado para pisos residenciais e comerciais.', 'assets/img/marmores/MARMORE-CREMA-MARFIL-STANDARD.jpg', 18);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Crema Valencia', 'Mármore bege claro com nuances sutis. Ideal para projetos contemporâneos, pisos e revestimentos de ambientes claros.', 'assets/img/marmores/MARMORE-CREMA-VALENCi.jpg', 19);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Forest Brown', 'Mármore marrom com veios texturizados. Perfeito para lareiras, painéis e mobiliário em ambientes com tons quentes.', 'assets/img/marmores/MARMORE-FOREST-BROWN.jpg', 20);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Forest Green', 'Mármore verde intenso de origem indiana. Ideal para bancadas de lavabo, detalhes em mobiliário e painéis decorativos.', 'assets/img/marmores/MARMORE-FOREST-GREEN.jpg', 21);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Golden Spider', 'Mármore bege com veios dourados em teia. Excelente para pisos, revestimentos de banheiros e projetos de alto padrão.', 'assets/img/marmores/MARMORE-GOLDEN-SPIDER.jpg', 22);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Green Spider', 'Mármore verde com veios brancos em padrão teia de aranha. Ideal para lavabos, detalhes decorativos e mobiliário.', 'assets/img/marmores/MARMORE-GREEN-SPIDER.jpg', 23);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Gris Armani', 'Mármore cinza sofisticado de tom uniforme. Perfeito para projetos contemporâneos, pisos e painéis minimalistas.', 'assets/img/marmores/MARMORE-GRIS-ARMANI.jpg', 24);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Marrom Imperador Dark', 'Mármore marrom escuro espanhol com textura profunda. Ideal para pisos, lareiras e ambientes com iluminação indireta.', 'assets/img/marmores/MARMORE-MARROM-IMPERADOR-DARK.jpg', 25);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Marrom Imperador Light', 'Variação clara do Marrom Imperador. Ótimo para pisos de grande formato e revestimentos internos.', 'assets/img/marmores/MARMORE-MARROM-IMPERADOR-LIGHT.jpg', 26);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Nero Marquina', 'Mármore negro com veios brancos marcantes. Atemporal para bancadas, pisos e projetos com contraste dramático.', 'assets/img/marmores/MARMORE-NERO-MARQUINA.jpg', 27);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Nero Portoro', 'Mármore negro com veios dourados. Uma das pedras mais nobres da Itália. Indicado para lavabos de luxo e ambientes exclusivos.', 'assets/img/marmores/MARMORE-NERO-PORTORO.jpg', 28);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Perlino Bianco', 'Mármore branco perolado com suaves veios. Indicado para pisos, revestimentos de banheiros e ambientes iluminados.', 'assets/img/marmores/MARMORE-PERLINO-BiNCO.jpg', 29);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Rosso Alicante', 'Mármore vermelho espanhol vibrante. Excelente para detalhes em pisos, faixas decorativas e ambientes clássicos.', 'assets/img/marmores/MARMORE-ROSSO-ALICANTE.jpg', 30);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Rosso Verona', 'Mármore italiano rosa-avermelhado. Tradicional em projetos clássicos, pisos históricos e revestimentos de fachadas.', 'assets/img/marmores/MARMORE-ROSSO-VERONA.jpg', 31);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Statuarieto', 'Variação do Statuario com veios delicados. Ideal para esculturas, bancadas e projetos arquitetônicos de alto padrão.', 'assets/img/marmores/MARMORE-STATuRIETO.jpg', 32);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Verde Alpi', 'Mármore verde escuro dos Alpes italianos. Perfeito para bancadas, lavabos e ambientes que pedem sofisticação natural.', 'assets/img/marmores/MARMORE-VERDE-ALPI.jpg', 33);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Verde Guatemala', 'Mármore verde intenso com veios brancos. Ideal para painéis, bancadas e detalhes de mobiliário com personalidade.', 'assets/img/marmores/MARMORE-VERDE-GuTEMALA.jpg', 34);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'White Crystal', 'Mármore branco cristalino brasileiro. Excelente para pisos, revestimentos internos e projetos que pedem luminosidade.', 'assets/img/marmores/MARMORE-WHITE-CRYSTAL.jpg', 35);
END $$;