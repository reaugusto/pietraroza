
DO $$
DECLARE
  var_cat_id uuid := gen_random_uuid();
BEGIN
  INSERT INTO public.materials_categories (id, slug, label, order_index)
  VALUES (var_cat_id, 'granitos', 'Granito Natural', 1);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Amarelo Florença', 'Granito amarelo com veios suaves. Ideal para bancadas, pisos e revestimentos residenciais.', 'assets/img/granitos/GRANITO-AMARELO-FLORENCA.jpg', 1);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Amarelo Fiorito', 'Granito dourado com grãos finos. Excelente para bancadas de cozinha e áreas externas.', 'assets/img/granitos/GRANITO-AMARELO-FIORITO.jpg', 2);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Amarelo Colonial', 'Granito de tom amarelo clássico. Perfeito para pisos e revestimentos de grande formato.', 'assets/img/granitos/GRANITO-AMARELO-COLONiL.jpg', 3);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Amarelo Icaraí', 'Granito amarelo brasileiro. Indicado para bancadas, soleiras e pisos residenciais.', 'assets/img/granitos/GRANITO-AMARELO-ICARAI.jpg', 4);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Amarelo Maracujá', 'Granito com tonalidade alaranjada. Ótimo para áreas externas e churrasqueiras.', 'assets/img/granitos/GRANITO-AMARELO-MARACUJA.jpg', 5);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Amarelo Ornamental', 'Granito decorativo de base amarela. Ideal para pisos e revestimentos internos.', 'assets/img/granitos/GRANITO-AMARELO-ORNAMENTAL.jpg', 6);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Amarelo Ouro Deserto', 'Granito com tons dourados intensos. Perfeito para ambientes rústicos e sofisticados.', 'assets/img/granitos/GRANITO-AMARELO-OURO-DESERTO.jpg', 7);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Amarelo Ouro', 'Granito dourado premium. Excelente para bancadas e pisos de alto tráfego.', 'assets/img/granitos/GRANITO-AMARELO-OURO.jpg', 8);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Amarelo Santa Cecília', 'Um dos granitos mais populares do Brasil. Versátil para bancadas e pisos.', 'assets/img/granitos/GRANITO-AMARELO-SANTA-CECILi.jpg', 9);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Ás de Paus', 'Granito com padrão único e movimentado. Ideal para projetos diferenciados.', 'assets/img/granitos/GRANITO-AS-DE-PAUS.jpg', 10);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Azul Bahia', 'Granito azul exótico brasileiro. Perfeito para lavabos, bancadas e peças exclusivas.', 'assets/img/granitos/GRANITO-AZUL-BAHi.jpg', 11);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Azul Norueguês', 'Granito azul importado. Indicado para projetos de alto padrão e detalhes sofisticados.', 'assets/img/granitos/GRANITO-AZUL-NORUEGUES.jpg', 12);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Blue Night', 'Granito escuro com reflexos azulados. Ideal para ambientes contemporâneos.', 'assets/img/granitos/GRANITO-BLUE-NIGHT.jpg', 13);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Branco Arabesco', 'Granito branco com veios suaves. Excelente para pisos e bancadas clean.', 'assets/img/granitos/GRANITO-BRANCO-ARABESCO.jpg', 14);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Branco Ceará', 'Granito branco nacional de custo acessível. Perfeito para pisos residenciais.', 'assets/img/granitos/GRANITO-BRANCO-CeRA.jpg', 15);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Branco Dallas', 'Granito branco com movimento delicado. Ideal para ambientes claros e modernos.', 'assets/img/granitos/GRANITO-BRANCO-DALLAS.jpg', 16);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Branco Dunas', 'Granito branco com textura ondulada. Ótimo para revestimentos e pisos.', 'assets/img/granitos/GRANITO-BRANCO-DUNAS.jpg', 17);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Branco Fortaleza', 'Granito branco resistente. Excelente para áreas externas e pisos de alto tráfego.', 'assets/img/granitos/GRANITO-BRANCO-FORTALEZA.jpg', 18);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Branco Itaúnas', 'Granito branco com grãos finos. Ideal para bancadas e revestimentos internos.', 'assets/img/granitos/GRANITO-BRANCO-ITAUNAS2.jpg', 19);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Branco Marfim', 'Granito de tom branco creme. Perfeito para ambientes sofisticados e acolhedores.', 'assets/img/granitos/GRANITO-BRANCO-MARFIM.jpg', 20);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Branco Piracema', 'Granito branco com veios discretos. Indicado para pisos e escadas.', 'assets/img/granitos/GRANITO-BRANCO-PIRACEMA.jpg', 21);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Branco Polar', 'Granito branco cristalino. Ideal para projetos minimalistas e contemporâneos.', 'assets/img/granitos/GRANITO-BRANCO-POLAR.jpg', 22);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Branco Siena', 'Granito branco premium. Excelente para bancadas e revestimentos de parede.', 'assets/img/granitos/GRANITO-BRANCO-SIENA.jpg', 23);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Café Imperial', 'Granito marrom sofisticado. Perfeito para bancadas de cozinha e ambientes clássicos.', 'assets/img/granitos/GRANITO-CAFE-IMPERiL.jpg', 24);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Cinza Andorinha', 'Granito cinza uniforme. Ideal para pisos comerciais e residenciais.', 'assets/img/granitos/GRANITO-CINZA-ANDORINHA-1.jpg', 25);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Cinza Castelo', 'Granito cinza com textura refinada. Ótimo para fachadas e pisos de grande formato.', 'assets/img/granitos/GRANITO-CINZA-CASTELO.jpg', 26);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Cinza Corumbá', 'Granito cinza de granulação média. Indicado para pisos e bancadas.', 'assets/img/granitos/GRANITO-CINZA-CORUMBA.jpg', 27);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Cinza Corumbazinho', 'Granito cinza de grão fino. Ideal para detalhes e acabamentos.', 'assets/img/granitos/GRANITO-CINZA-CORUMBAZINHO.jpg', 28);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Cinza Itabira', 'Granito cinza escuro refinado. Perfeito para projetos contemporâneos.', 'assets/img/granitos/GRANITO-CINZA-ITABIRA.jpg', 29);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Cinza Mauá', 'Granito cinza clássico. Excelente para pisos de alto tráfego e fachadas.', 'assets/img/granitos/GRANITO-CINZA-MAu.jpg', 30);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Cinza Ocre Itabira', 'Granito com tons cinza e ocre. Ideal para ambientes rústicos e modernos.', 'assets/img/granitos/GRANITO-CINZA-OCRE-ITABIRA.jpg', 31);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Marrom Tabaco', 'Granito marrom quente. Perfeito para ambientes acolhedores e bancadas gourmet.', 'assets/img/granitos/GRANITO-MARROM-TABACO.jpg', 32);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Matrix', 'Granito exótico com padrão movimentado único. Ideal para peças decorativas e destaque.', 'assets/img/granitos/GRANITO-MATRIX.jpg', 33);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Meteorus', 'Granito exótico com veios contrastantes. Perfeito para bancadas e painéis.', 'assets/img/granitos/GRANITO-METEORUS-1.jpg', 34);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Negresco', 'Granito escuro refinado. Indicado para bancadas de lavabo e detalhes de luxo.', 'assets/img/granitos/GRANITO-NEGRESCO.jpg', 35);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Preto Absoluto', 'Granito negro puro sem veios. Clássico para bancadas, pisos e projetos minimalistas.', 'assets/img/granitos/GRANITO-PRETO-ABSOLUTO.jpg', 36);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Preto Indiano', 'Granito negro importado. Excelente para bancadas e revestimentos de alto padrão.', 'assets/img/granitos/GRANITO-PRETO-INDiNO.jpg', 37);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Preto São Gabriel', 'Granito negro com reflexos prateados. Ideal para pisos e bancadas contemporâneas.', 'assets/img/granitos/GRANITO-PRETO-SAO-GABRIEL.jpg', 38);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Preto Via Láctea', 'Granito negro com pontos brancos. Perfeito para bancadas de cozinha gourmet.', 'assets/img/granitos/GRANITO-PRETO-Vi-LACTe.jpg', 39);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Red Verona', 'Granito vermelho intenso. Indicado para detalhes, faixas decorativas e mobiliário.', 'assets/img/granitos/GRANITO-RED-VERONA.jpg', 40);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Rosa Raissa', 'Granito rosa suave. Ideal para pisos e revestimentos de ambientes femininos.', 'assets/img/granitos/GRANITO-ROSA-RAISSA-1.jpg', 41);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Verde Candeias', 'Granito verde brasileiro. Ótimo para áreas externas e bancadas de churrasqueira.', 'assets/img/granitos/GRANITO-VERDE-CANDEiS.jpg', 42);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Verde Labrador', 'Granito verde escuro com reflexos. Ideal para bancadas e revestimentos sofisticados.', 'assets/img/granitos/GRANITO-VERDE-LABRADOR.jpg', 43);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Verde Pérola', 'Granito verde claro perolado. Perfeito para pisos e bancadas de banheiro.', 'assets/img/granitos/GRANITO-VERDE-PEROLA.jpg', 44);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Verde São Francisco', 'Granito verde movimentado. Indicado para pisos de grande formato e fachadas.', 'assets/img/granitos/GRANITO-VERDE-SAO-FRANCISCO.jpg', 45);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Verde Ubatuba', 'Granito verde escuro clássico. Excelente para bancadas e pisos de alto tráfego.', 'assets/img/granitos/GRANITO-VERDE-UBATUBA.jpg', 46);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Vermelho Brasília', 'Granito vermelho vibrante. Ideal para detalhes e projetos com personalidade.', 'assets/img/granitos/GRANITO-VERMELHO-BRASILi.jpg', 47);
END $$;


DO $$
DECLARE
  var_cat_id uuid := gen_random_uuid();
BEGIN
  INSERT INTO public.materials_categories (id, slug, label, order_index)
  VALUES (var_cat_id, 'onix', 'Ônix', 2);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Alabastro', 'Ônix translúcido clássico. Ideal para retroiluminação, bancadas de bar e peças decorativas.', 'assets/img/onix/ONIX-ALABASTRO.png', 1);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Bianco Oro', 'Ônix branco com veios dourados. Perfeito para lavabos de luxo e painéis iluminados.', 'assets/img/onix/ONIX-BiNCO-ORO.png', 2);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Cappuccino', 'Ônix em tons cappuccino quentes. Ideal para revestimentos de parede e mobiliário.', 'assets/img/onix/ONIX-CAPPICCINO.png', 3);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Cielo del Sahara', 'Ônix exótico com tons azuis e dourados. Perfeito para painéis retroiluminados.', 'assets/img/onix/ONIX-CIELO-DEL-SAHARA-GiLLO-BLUE.png', 4);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Cristallo', 'Ônix cristalino translúcido. Ideal para divisórias iluminadas e peças escultóricas.', 'assets/img/onix/ONIX-CRISTALLO.png', 5);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Esmeralda', 'Ônix verde esmeralda intenso. Perfeito para lavabos exclusivos e detalhes de bar.', 'assets/img/onix/ONIX-ESMERALDA.png', 6);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Fantástico', 'Ônix com padrão único e exuberante. Ideal para painéis de destaque e obras de arte.', 'assets/img/onix/ONIX-FANTASTICO.png', 7);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Fantasy', 'Ônix com veios coloridos expressivos. Perfeito para backlight e bancadas de bar.', 'assets/img/onix/ONIX-FANTASY.png', 8);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Giallo', 'Ônix amarelo translúcido. Ideal para ambientes com iluminação indireta e peças de luxo.', 'assets/img/onix/ONIX-GiLLO.png', 9);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Kilimanjaro', 'Ônix exótico inspirado no monte africano. Perfeito para projetos grandiosos.', 'assets/img/onix/ONIX-KILIMANJARO.png', 10);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Lady', 'Ônix delicado com tons suaves. Ideal para banheiros de luxo e lavabos.', 'assets/img/onix/ONIX-LADY.png', 11);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Light Green', 'Ônix verde claro translúcido. Excelente para divisórias e painéis iluminados.', 'assets/img/onix/ONIX-LIGHT-GREEN.png', 12);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Mel', 'Ônix em tons de mel dourado. Perfeito para bancadas de bar e peças decorativas.', 'assets/img/onix/ONIX-MEL.png', 13);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Pearl Gold', 'Ônix perolado dourado. Ideal para lavabos de luxo e detalhes em mobiliário.', 'assets/img/onix/ONIX-PeRL-GOLD.png', 14);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Silver', 'Ônix prateado translúcido. Perfeito para projetos contemporâneos com backlight.', 'assets/img/onix/ONIX-SILVER.png', 15);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Spider', 'Ônix com veios em teia. Ideal para painéis de destaque e revestimentos exclusivos.', 'assets/img/onix/ONIX-SPIDER.png', 16);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Tavarua', 'Ônix exótico com tonalidades quentes. Perfeito para bancadas e painéis iluminados.', 'assets/img/onix/ONIX-TAVARu.png', 17);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Tiger', 'Ônix com padrão tigre. Ideal para projetos ousados e peças de alto impacto.', 'assets/img/onix/ONIX-TIGER.png', 18);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Verde', 'Ônix verde clássico. Excelente para lavabos, bancadas e retroiluminação.', 'assets/img/onix/ONIX-VERDE-1.jpg', 19);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Verde Extra', 'Versão premium do ônix verde. Perfeito para projetos de destaque iluminados.', 'assets/img/onix/ONIX-VERDE-EXTRA.png', 20);
END $$;


DO $$
DECLARE
  var_cat_id uuid := gen_random_uuid();
BEGIN
  INSERT INTO public.materials_categories (id, slug, label, order_index)
  VALUES (var_cat_id, 'quartzitos', 'Quartzito Natural', 3);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Adamantium', 'Quartzito ultra resistente. Ideal para bancadas de cozinha de alta performance.', 'assets/img/quartzitos/QuRTZITO-ADAMANTIUM.png', 1);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Agatha', 'Quartzito com desenhos delicados. Perfeito para revestimentos e bancadas.', 'assets/img/quartzitos/QuRTZITO-AGATHA.png', 2);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Alexandra Blue', 'Quartzito azulado exótico. Ideal para lavabos e painéis de destaque.', 'assets/img/quartzitos/QuRTZITO-ALEXANDRA-BLUE.png', 3);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Amarelo Macaúbas', 'Quartzito amarelo vibrante. Perfeito para bancadas e detalhes decorativos.', 'assets/img/quartzitos/QuRTZITO-AMARELO-MACAUBAS.png', 4);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Amazon', 'Quartzito inspirado na floresta amazônica. Ideal para projetos naturais.', 'assets/img/quartzitos/QuRTZITO-AMAZON.jpg', 5);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Aurora Crema', 'Quartzito creme suave. Excelente para pisos e bancadas elegantes.', 'assets/img/quartzitos/QuRTZITO-AURORA-CREMA.png', 6);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Azul Macaúbas', 'Quartzito azul brasileiro premium. Perfeito para peças exclusivas.', 'assets/img/quartzitos/QuRTZITO-AZUL-MACAUBAS.png', 7);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Azulli', 'Quartzito azulado refinado. Ideal para projetos de alto padrão.', 'assets/img/quartzitos/QuRTZITO-AZULLI.png', 8);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Bianco Laura', 'Quartzito branco delicado. Perfeito para banheiros e bancadas clean.', 'assets/img/quartzitos/QuRTZITO-BiNCO-LAURA.png', 9);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Bianco Superiore', 'Quartzito branco premium. Ideal para pisos e revestimentos sofisticados.', 'assets/img/quartzitos/QuRTZITO-BiNCO-SUPERIORE.png', 10);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Black Tempest', 'Quartzito negro intenso. Perfeito para bancadas e projetos dramáticos.', 'assets/img/quartzitos/QuRTZITO-BLACK-TEMPEST.png', 11);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Blue Roma', 'Quartzito azul com nuances romanas. Ideal para painéis e lavabos.', 'assets/img/quartzitos/QuRTZITO-BLUE-ROMA.png', 12);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Blue Sky', 'Quartzito azul celeste. Excelente para bancadas e detalhes decorativos.', 'assets/img/quartzitos/QuRTZITO-BLUE-SKY.png', 13);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Branco Macaúbas', 'Quartzito branco clássico. Ideal para pisos e bancadas de banheiro.', 'assets/img/quartzitos/QuRTZITO-BRANCO-MACAUBAS.png', 14);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Brilliant Black', 'Quartzito negro brilhante. Perfeito para bancadas contemporâneas.', 'assets/img/quartzitos/QuRTZITO-BRILLiNT-BLACK.png', 15);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Brilliant Grey', 'Quartzito cinza sofisticado. Ideal para pisos e revestimentos.', 'assets/img/quartzitos/QuRTZITO-BRILLiNT-GREY.png', 16);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Bronzine', 'Quartzito bronze natural. Perfeito para ambientes com tons quentes.', 'assets/img/quartzitos/QuRTZITO-BRONZINE.png', 17);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Da Vinci', 'Quartzito com padrão artístico. Ideal para peças de destaque e painéis.', 'assets/img/quartzitos/QuRTZITO-DA-VINCI.png', 18);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Dakar', 'Quartzito exótico resistente. Excelente para bancadas e pisos.', 'assets/img/quartzitos/QuRTZITO-DAKAR.png', 19);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Elbrus', 'Quartzito branco com textura alpina. Ideal para projetos minimalistas.', 'assets/img/quartzitos/QuRTZITO-ELBRUS.png', 20);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Elegant', 'Quartzito de acabamento refinado. Perfeito para ambientes sofisticados.', 'assets/img/quartzitos/QuRTZITO-ELEGANT.png', 21);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Essenza Blue', 'Quartzito azul intenso. Ideal para lavabos e detalhes exclusivos.', 'assets/img/quartzitos/QuRTZITO-ESSENZA-BLUE.png', 22);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Fusion', 'Quartzito com padrão fusionado. Excelente para painéis e bancadas.', 'assets/img/quartzitos/QuRTZITO-FUSION.png', 23);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'J''Adore', 'Quartzito premium com veios elegantes. Perfeito para projetos de luxo.', 'assets/img/quartzitos/QuRTZITO-JADORE.png', 24);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Madirian', 'Quartzito exótico de tom quente. Ideal para bancadas e mobiliário.', 'assets/img/quartzitos/QuRTZITO-MADIRiN.png', 25);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Matarazzo', 'Quartzito brasileiro premium. Excelente para pisos e revestimentos.', 'assets/img/quartzitos/QuRTZITO-MATARAZZO.png', 26);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Matira', 'Quartzito com textura natural. Ideal para projetos contemporâneos.', 'assets/img/quartzitos/QuRTZITO-MATIRA.png', 27);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Michellangelo', 'Quartzito inspirado na arte renascentista. Perfeito para peças exclusivas.', 'assets/img/quartzitos/QuRTZITO-MICHELLANGELO.png', 28);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Mont Blanc', 'Quartzito branco cristalino. Ideal para bancadas e pisos de alto padrão.', 'assets/img/quartzitos/QuRTZITO-MONT-BLANC2.png', 29);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Nuvole', 'Quartzito com padrão nuvem. Excelente para revestimentos e painéis.', 'assets/img/quartzitos/QuRTZITO-NUVOLE.png', 30);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Palomino', 'Quartzito de tom dourado suave. Perfeito para ambientes quentes.', 'assets/img/quartzitos/QuRTZITO-PALOMINO.png', 31);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Patagônia', 'Quartzito exótico inspirado na paisagem patagônica. Ideal para projetos únicos.', 'assets/img/quartzitos/QuRTZITO-PATAGONi.png', 32);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Perla Santana', 'Quartzito perolado delicado. Excelente para bancadas e pisos.', 'assets/img/quartzitos/QuRTZITO-PERLA-SANTANA.png', 33);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Riviera', 'Quartzito azulado refinado. Perfeito para lavabos e detalhes de luxo.', 'assets/img/quartzitos/QuRTZITO-RIVIERA.png', 34);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Roma Imperiale', 'Quartzito majestoso com veios dourados. Ideal para pisos nobres.', 'assets/img/quartzitos/QuRTZITO-ROMA-IMPERiLE.png', 35);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Taj Mahal', 'Quartzito premium com textura sedosa. Perfeito para bancadas e pisos de luxo.', 'assets/img/quartzitos/QuRTZITO-TAJ-MAHAL.png', 36);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Titanium', 'Quartzito ultra resistente. Ideal para bancadas de cozinha gourmet.', 'assets/img/quartzitos/QuRTZITO-TITANIUM.png', 37);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Verde Bambu', 'Quartzito verde com textura natural. Excelente para detalhes e painéis.', 'assets/img/quartzitos/QuRTZITO-VERDE-BAMBU.png', 38);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Wakanda Black', 'Quartzito negro exótico. Perfeito para projetos dramáticos e contemporâneos.', 'assets/img/quartzitos/QuRTZITO-WAKANDA-BLACK.png', 39);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Woodstone', 'Quartzito com aparência de madeira petrificada. Ideal para pisos rústicos e bancadas.', 'assets/img/quartzitos/QuRTZITO-WOODSTONE.png', 40);
END $$;


DO $$
DECLARE
  var_cat_id uuid := gen_random_uuid();
BEGIN
  INSERT INTO public.materials_categories (id, slug, label, order_index)
  VALUES (var_cat_id, 'travertinos', 'Travertino Natural', 4);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Nacional', 'Travertino brasileiro de tom claro. Ideal para pisos e revestimentos residenciais.', 'assets/img/travertinos/TRAVERTINO-NACIONAL.png', 1);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Navona Bruto', 'Travertino italiano com textura rústica. Perfeito para ambientes externos e fachadas.', 'assets/img/travertinos/TRAVERTINO-NAVONA-BRUTO.png', 2);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Navona Polido', 'Travertino Navona com acabamento polido. Ideal para pisos e revestimentos internos.', 'assets/img/travertinos/TRAVERTINO-NAVONA-POLIDO.png', 3);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Navona Resinado', 'Travertino com poros preenchidos. Excelente para bancadas e pisos de alto tráfego.', 'assets/img/travertinos/TRAVERTINO-NAVONA-RESINADO.png', 4);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Romano Bruto', 'Travertino romano com textura bruta. Perfeito para fachadas e áreas externas.', 'assets/img/travertinos/TRAVERTINO-ROMANO-BRUTO.png', 5);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Romano Polido', 'Travertino romano com brilho polido. Ideal para pisos e escadas.', 'assets/img/travertinos/TRAVERTINO-ROMANO-POLIDO.png', 6);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Romano Resinado', 'Travertino romano resinado. Excelente para bancadas e pisos residenciais.', 'assets/img/travertinos/TRAVERTINO-ROMANO-RESINADO.png', 7);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Silver Polido', 'Travertino prateado polido. Ideal para projetos contemporâneos e bancadas.', 'assets/img/travertinos/TRAVERTINO-SILVER-POLIDO.png', 8);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Turco Bruto', 'Travertino turco com textura rústica. Perfeito para revestimentos de piscina e fachadas.', 'assets/img/travertinos/TRAVERTINO-TURCO-BRUTO-1.jpg', 9);
END $$;


DO $$
DECLARE
  var_cat_id uuid := gen_random_uuid();
BEGIN
  INSERT INTO public.materials_categories (id, slug, label, order_index)
  VALUES (var_cat_id, 'fabricados', 'Material Fabricado', 5);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Caesarstone', 'Superfície de quartzo engenheirado. Ideal para bancadas de cozinha e banheiro com alta resistência.', 'assets/img/fabricados/CAESARSTONE.png', 1);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Composto Branco Prime', 'Composto de mármore branco. Excelente para pisos e revestimentos de grande formato.', 'assets/img/fabricados/COMPOSTO-DE-MARMORE-BRANCO-PRIME.png', 2);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Quartzo Calacata', 'Quartzo com visual Calacatta. Perfeito para bancadas que imitam mármore com mais resistência.', 'assets/img/fabricados/COMPOSTO-QuRTZO-CALACATA.png', 3);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Quartzo Intense White', 'Quartzo branco puro. Ideal para bancadas minimalistas e ambientes clean.', 'assets/img/fabricados/COMPOSTO-QuRTZO-INTENSE-WHITE.png', 4);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Quartzo Light Grey', 'Quartzo cinza claro. Excelente para bancadas e revestimentos contemporâneos.', 'assets/img/fabricados/COMPOSTO-QuRTZO-LIGHT-GREY.png', 5);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Coverlam', 'Porcelanato de grande formato. Ideal para fachadas, pisos e revestimentos de parede.', 'assets/img/fabricados/COVERLAM.png', 6);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'CS3 Revestimentos', 'Revestimento cerâmico premium. Perfeito para projetos residenciais e comerciais.', 'assets/img/fabricados/CS3-REVESTIMENTOS.png', 7);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Dekton', 'Superfície ultracompacta Cosentino. Ideal para bancadas, fachadas e pisos de alto desempenho.', 'assets/img/fabricados/DEKTON.png', 8);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Lâmina Calacata Gold', 'Lâmina ultracompacta com visual Calacatta dourado. Perfeita para bancadas de luxo.', 'assets/img/fabricados/LAMINA-ULTRACOMPACTA-CALACATA-GOLD.png', 9);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Lâmina Calacata', 'Lâmina ultracompacta com visual Calacatta. Ideal para bancadas e revestimentos.', 'assets/img/fabricados/LAMINA-ULTRACOMPACTA-CALACATA.png', 10);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Lâmina Pietra Grey', 'Lâmina cinza premium. Excelente para bancadas e painéis contemporâneos.', 'assets/img/fabricados/LAMINA-ULTRACOMPACTA-PIETRA-GREY.png', 11);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Lâmina Pure White', 'Lâmina branca pura. Perfeita para projetos minimalistas e ambientes claros.', 'assets/img/fabricados/LAMINA-ULTRACOMPACTA-PURE-WHITE.png', 12);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Lamtec', 'Laminado técnico de alta performance. Ideal para revestimentos e mobiliário.', 'assets/img/fabricados/LAMTEC.png', 13);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Neolith', 'Superfície sinterizada premium. Excelente para bancadas, fachadas e pisos.', 'assets/img/fabricados/NEOLITH.png', 14);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Nilam', 'Material fabricado de alta qualidade. Perfeito para projetos residenciais.', 'assets/img/fabricados/NILAM.png', 15);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Silestone', 'Superfície de quartzo Cosentino. Ideal para bancadas de cozinha e banheiro.', 'assets/img/fabricados/SILESTONE.png', 16);

  INSERT INTO public.materials (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Sinth', 'Material sinterizado moderno. Excelente para bancadas e revestimentos de alto padrão.', 'assets/img/fabricados/SINTH.jpg', 17);
END $$;


DO $$
DECLARE
  var_cat_id uuid := gen_random_uuid();
BEGIN
  INSERT INTO public.works_categories (id, slug, label, order_index)
  VALUES (var_cat_id, 'pisos', 'Pisos e Revestimentos', 1);

  INSERT INTO public.works (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Residência Alphaville', 'Projeto com pisos em mármore claro contínuo em toda a área social.', 'assets/img/portfolio/projetos-thumbnail.png', 1);

  INSERT INTO public.works (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Living Contemporâneo', 'Aplicação de granito de grande formato para sala de estar ampla.', 'assets/img/portfolio/decoracao-thumbnail.png', 2);

  INSERT INTO public.works (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Lobby Comercial', 'Piso sofisticado em pedras escuras contrastantes para área de circulação.', 'assets/img/portfolio/nome-obra-2.jpg', 3);
END $$;


DO $$
DECLARE
  var_cat_id uuid := gen_random_uuid();
BEGIN
  INSERT INTO public.works_categories (id, slug, label, order_index)
  VALUES (var_cat_id, 'lareiras', 'Lareiras', 2);

  INSERT INTO public.works (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Lareira Travertino', 'Revestimento completo de lareira em Travertino Navona.', 'assets/img/portfolio/Rectangle-266.jpg', 1);

  INSERT INTO public.works (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Lareira Suspensa', 'Detalhe em granito escuro para sala intimista.', 'assets/img/portfolio/Rectangle-264.jpg', 2);

  INSERT INTO public.works (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Lareira Neolith', 'Acabamento moderno utilizando superfície sinterizada resistente a altas temperaturas.', 'assets/img/portfolio/Rectangle-265.jpg', 3);
END $$;


DO $$
DECLARE
  var_cat_id uuid := gen_random_uuid();
BEGIN
  INSERT INTO public.works_categories (id, slug, label, order_index)
  VALUES (var_cat_id, 'escadas', 'Escadas', 3);

  INSERT INTO public.works (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Escada Flutuante', 'Degraus em mármore claro engastados na parede.', 'assets/img/portfolio/nome-obra-4.jpg', 1);

  INSERT INTO public.works (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Escada Clássica', 'Composição de mármore e ferro batido para ambientes tradicionais.', 'assets/img/portfolio/nome-obra.jpg', 2);
END $$;


DO $$
DECLARE
  var_cat_id uuid := gen_random_uuid();
BEGIN
  INSERT INTO public.works_categories (id, slug, label, order_index)
  VALUES (var_cat_id, 'cubas', 'Cubas e Lavabos', 4);

  INSERT INTO public.works (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Cuba Esculpida', 'Bancada e cuba esculpida na mesma peça de mármore translúcido.', 'assets/img/portfolio/decoracao-thumbnail.png', 1);

  INSERT INTO public.works (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Lavabo Exótico', 'Cuba de apoio em ônix verde retroiluminado.', 'assets/img/portfolio/projetos-thumbnail.png', 2);
END $$;


DO $$
DECLARE
  var_cat_id uuid := gen_random_uuid();
BEGIN
  INSERT INTO public.works_categories (id, slug, label, order_index)
  VALUES (var_cat_id, 'churrasqueiras', 'Áreas Gourmet', 5);

  INSERT INTO public.works (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Gourmet Integrado', 'Bancada e revestimento de churrasqueira em granito escovado.', 'assets/img/portfolio/nome-obra-2.jpg', 1);

  INSERT INTO public.works (category_id, name, description, image_url, order_index)
  VALUES (var_cat_id, 'Varanda Externa', 'Uso de materiais super-resistentes para área de churrasco externa.', 'assets/img/portfolio/Rectangle-266.jpg', 2);
END $$;

