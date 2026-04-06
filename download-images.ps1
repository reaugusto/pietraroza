# Download de imagens do site original Pietra Roza
$ErrorActionPreference = "SilentlyContinue"
$base = "c:\Users\Renato Sousa\Desktop\PJ\pietra roza\v2-light\assets\img"

# Criar diretórios
@("$base\marmores","$base\granitos","$base\onix","$base\quartzitos","$base\travertinos","$base\fabricados","$base\portfolio","$base\site") | ForEach-Object { New-Item -ItemType Directory -Force -Path $_ | Out-Null }

$wc = New-Object System.Net.WebClient
$wc.Headers.Add("User-Agent","Mozilla/5.0")

function dl($url, $dest) {
  $file = Split-Path $url -Leaf
  $path = Join-Path $dest $file
  if (!(Test-Path $path)) {
    try { $wc.DownloadFile($url, $path); Write-Host "OK: $file" } catch { Write-Host "ERRO: $file" }
  } else { Write-Host "SKIP: $file" }
}

Write-Host "=== MARMORES ==="
$marmores = @(
  "MARMORE-ARABESCATO.jpg","MARMORE-BLACK-AND-GOLD.jpg","MARMORE-BLUE-SKY.jpg",
  "MARMORE-BOTTICINO-CLASSICO-EXTRA.jpg","MARMORE-BOTTICINO-CLASSICO.jpg",
  "MARMORE-BRANCO-ARISTON.jpg","MARMORE-BRANCO-CARRARINHA.jpg","MARMORE-BRANCO-CHAMPAGNE.jpg",
  "MARMORE-BRANCO-COMUM.jpg","MARMORE-BRANCO-NACIONAL-COMUM.jpg",
  "MARMORE-BRANCO-PARANA-MICHELANGELO.jpg","MARMORE-BRANCO-PIGUES-A1.jpg",
  "MARMORE-BRANCO-PIGUES-A2.jpg","MARMORE-BRANCO-PINTA-VERDE.jpg","MARMORE-BRANCO-RAJADO.jpg",
  "MARMORE-BRANCO-SIVEC-EXTRA.jpg","MARMORE-BRANCO-SIVEC-PA.jpg","MARMORE-BRANCO-SIVEC-PB.jpg",
  "MARMORE-BRANCO-SIVEC.jpg","MARMORE-BRANCO-THASSOS.jpg","MARMORE-BRECCi-ONICiTA.jpg",
  "MARMORE-BRONZE-ARMANI.jpg","MARMORE-CALACATTA-GOLD-EXTRA.jpg","MARMORE-CALACATTA-MACHi-ORO.jpg",
  "MARMORE-CALACATTA-ORO.jpg","MARMORE-CARRARA-GIOi.jpg","MARMORE-CREMA-MARFIL-STANDARD.jpg",
  "MARMORE-CREMA-MARFIL.jpg","MARMORE-CREMA-VALENCi.jpg","MARMORE-FOREST-BROWN.jpg",
  "MARMORE-FOREST-GREEN.jpg","MARMORE-GOLDEN-SPIDER.jpg","MARMORE-GREEN-SPIDER.jpg",
  "MARMORE-GRIS-ARMANI.jpg","MARMORE-MARROM-IMPERADOR-DARK.jpg","MARMORE-MARROM-IMPERADOR-LIGHT.jpg",
  "MARMORE-MARROM-IMPERiL-IMPERADOR.jpg","MARMORE-NERO-MARQUINA.jpg","MARMORE-NERO-PORTORO.jpg",
  "MARMORE-PERLINO-BiNCO.jpg","MARMORE-ROSSO-ALICANTE.jpg","MARMORE-ROSSO-CORALITO.jpg",
  "MARMORE-ROSSO-LEPANTO.jpg","MARMORE-ROSSO-LEVANTO.jpg","MARMORE-ROSSO-VERONA.jpg",
  "MARMORE-STATuRIETO.jpg","MARMORE-VERDE-ALPI.jpg","MARMORE-VERDE-GuTEMALA.jpg",
  "MARMORE-WHITE-CRYSTAL.jpg"
)
$marmores | ForEach-Object { dl "https://pietraroza.com.br/wp-content/uploads/$_" "$base\marmores" }

Write-Host "`n=== GRANITOS ==="
$granitos = @(
  "GRANITO-VERMELHO-BRASILi.jpg","GRANITO-VERDE-UBATUBA.jpg","GRANITO-VERDE-SAO-FRANCISCO.jpg",
  "GRANITO-VERDE-PEROLA.jpg","GRANITO-VERDE-LABRADOR.jpg","GRANITO-VERDE-CANDEiS.jpg",
  "GRANITO-ROSA-RAISSA-1.jpg","GRANITO-RED-VERONA.jpg","GRANITO-PRETO-Vi-LACTe.jpg",
  "GRANITO-PRETO-SAO-GABRIEL.jpg","GRANITO-PRETO-INDiNO.jpg","GRANITO-PRETO-ABSOLUTO.jpg",
  "GRANITO-NEGRESCO.jpg","GRANITO-METEORUS-1.jpg","GRANITO-MATRIX.jpg","GRANITO-MARROM-TABACO.jpg",
  "GRANITO-CINZA-OCRE-ITABIRA.jpg","GRANITO-CINZA-MAu.jpg","GRANITO-CINZA-ITABIRA.jpg",
  "GRANITO-CINZA-CORUMBAZINHO.jpg","GRANITO-CINZA-CORUMBA.jpg","GRANITO-CINZA-ANDORINHA-1.jpg",
  "GRANITO-CINZA-CASTELO.jpg","GRANITO-CAFE-IMPERiL.jpg","GRANITO-BRANCO-SIENA.jpg",
  "GRANITO-BRANCO-POLAR.jpg","GRANITO-BRANCO-PIRACEMA.jpg","GRANITO-BRANCO-MARFIM.jpg",
  "GRANITO-BRANCO-ITAUNAS2.jpg","GRANITO-BRANCO-FORTALEZA.jpg","GRANITO-BRANCO-DUNAS.jpg",
  "GRANITO-BRANCO-DALLAS.jpg","GRANITO-BRANCO-CeRA.jpg","GRANITO-BRANCO-ARABESCO.jpg",
  "GRANITO-BLUE-NIGHT.jpg","GRANITO-AZUL-NORUEGUES.jpg","GRANITO-AZUL-BAHi.jpg",
  "GRANITO-AS-DE-PAUS.jpg","GRANITO-AMARELO-SANTA-CECILi.jpg","GRANITO-AMARELO-OURO.jpg",
  "GRANITO-AMARELO-OURO-DESERTO.jpg","GRANITO-AMARELO-ORNAMENTAL.jpg","GRANITO-AMARELO-MARACUJA.jpg",
  "GRANITO-AMARELO-ICARAI.jpg","GRANITO-AMARELO-COLONiL.jpg","GRANITO-AMARELO-FIORITO.jpg",
  "GRANITO-AMARELO-FLORENCA.jpg","produto-exemple.png"
)
$granitos | ForEach-Object { dl "https://pietraroza.com.br/wp-content/uploads/$_" "$base\granitos" }

Write-Host "`n=== ONIX ==="
$onix = @(
  "ONIX-TAVARu.png","ONIX-CRISTALLO.png","ONIX-VERDE-1.jpg","ONIX-VERDE-EXTRA.png",
  "ONIX-TIGER.png","ONIX-SPIDER.png","ONIX-SILVER.png","ONIX-PeRL-GOLD.png","ONIX-MEL.png",
  "ONIX-LIGHT-GREEN.png","ONIX-LADY.png","ONIX-KILIMANJARO.png","ONIX-GiLLO.png",
  "ONIX-FANTASY.png","ONIX-FANTASTICO.png","ONIX-ESMERALDA.png",
  "ONIX-CIELO-DEL-SAHARA-GiLLO-BLUE.png","ONIX-CAPPICCINO.png","ONIX-BiNCO-ORO.png","ONIX-ALABASTRO.png"
)
$onix | ForEach-Object { dl "https://pietraroza.com.br/wp-content/uploads/$_" "$base\onix" }

Write-Host "`n=== QUARTZITOS ==="
$quartzitos = @(
  "QuRTZITO-WOODSTONE.png","QuRTZITO-WAKANDA-BLACK.png","QuRTZITO-VERDE-BAMBU.png",
  "QuRTZITO-TITANIUM.png","QuRTZITO-TAJ-MAHAL.png","QuRTZITO-ROMA-IMPERiLE.png",
  "QuRTZITO-PERLA-SANTANA.png","QuRTZITO-RIVIERA.png","QuRTZITO-PATAGONi.png",
  "QuRTZITO-PALOMINO.png","QuRTZITO-NUVOLE.png","QuRTZITO-MONT-BLANC2.png",
  "QuRTZITO-MICHELLANGELO.png","QuRTZITO-MATIRA.png","QuRTZITO-MATARAZZO.png",
  "QuRTZITO-MADIRiN.png","QuRTZITO-JADORE.png","QuRTZITO-FUSION.png",
  "QuRTZITO-ESSENZA-BLUE.png","QuRTZITO-ELEGANT.png","QuRTZITO-ELBRUS.png",
  "QuRTZITO-DAKAR.png","QuRTZITO-DA-VINCI.png","QuRTZITO-BRILLiNT-GREY.png",
  "QuRTZITO-BRONZINE.png","QuRTZITO-BRANCO-MACAUBAS.png","QuRTZITO-BRILLiNT-BLACK.png",
  "QuRTZITO-BLUE-SKY.png","QuRTZITO-BLUE-ROMA.png","QuRTZITO-BLACK-TEMPEST.png",
  "QuRTZITO-BiNCO-SUPERIORE.png","QuRTZITO-BiNCO-LAURA.png","QuRTZITO-AZULLI.png",
  "QuRTZITO-AZUL-MACAUBAS.png","QuRTZITO-AMAZON.jpg","QuRTZITO-AURORA-CREMA.png",
  "QuRTZITO-ALEXANDRA-BLUE.png","QuRTZITO-AMARELO-MACAUBAS.png","QuRTZITO-AGATHA.png",
  "QuRTZITO-ADAMANTIUM.png"
)
$quartzitos | ForEach-Object { dl "https://pietraroza.com.br/wp-content/uploads/$_" "$base\quartzitos" }

Write-Host "`n=== TRAVERTINOS ==="
$travertinos = @(
  "TRAVERTINO-TURCO-BRUTO-1.jpg","TRAVERTINO-SILVER-POLIDO.png","TRAVERTINO-ROMANO-RESINADO.png",
  "TRAVERTINO-ROMANO-POLIDO.png","TRAVERTINO-ROMANO-BRUTO.png","TRAVERTINO-NAVONA-RESINADO.png",
  "TRAVERTINO-NAVONA-POLIDO.png","TRAVERTINO-NAVONA-BRUTO.png","TRAVERTINO-NACIONAL.png"
)
$travertinos | ForEach-Object { dl "https://pietraroza.com.br/wp-content/uploads/$_" "$base\travertinos" }

Write-Host "`n=== FABRICADOS ==="
$fabricados = @(
  "LAMINA-ULTRACOMPACTA-PURE-WHITE.png","LAMINA-ULTRACOMPACTA-PIETRA-GREY.png",
  "LAMINA-ULTRACOMPACTA-CALACATA.png","LAMINA-ULTRACOMPACTA-CALACATA-GOLD.png",
  "COMPOSTO-QuRTZO-LIGHT-GREY.png","COMPOSTO-QuRTZO-INTENSE-WHITE.png",
  "COMPOSTO-QuRTZO-CALACATA.png","COMPOSTO-DE-MARMORE-BRANCO-PRIME.png",
  "SINTH.jpg","SILESTONE.png","NILAM.png","NEOLITH.png","LAMTEC.png","DEKTON.png",
  "CS3-REVESTIMENTOS.png","COVERLAM.png","CAESARSTONE.png"
)
$fabricados | ForEach-Object { dl "https://pietraroza.com.br/wp-content/uploads/$_" "$base\fabricados" }

Write-Host "`n=== PORTFOLIO ==="
$portfolio = @("nome-obra.jpg","nome-obra-2.jpg","Rectangle-266.jpg","nome-obra-4.jpg",
  "decoracao-thumbnail.png","projetos-thumbnail.png","Rectangle-264.jpg","Rectangle-265.jpg")
$portfolio | ForEach-Object { dl "https://pietraroza.com.br/wp-content/uploads/$_" "$base\portfolio" }

Write-Host "`n=== SITE (logos, favicons, thumbs) ==="
$site = @("logo-white.png","logo-mobile.png","fav-icon.png","fav-icon-alternativo.png",
  "produtos-thumbnail.jpg","projeto-thumbnail.jpg","product-thumbnail.jpg",
  "Maquinario.jpg","sustentabilidade-thumbnail.png","equipe-thumbnail.jpg",
  "granito.png","marmores.png","onix.png","Rectangle-281.png","Rectangle-282.png","Rectangle-279.png",
  "12345.png","123.png","1234.png")
$site | ForEach-Object { dl "https://pietraroza.com.br/wp-content/uploads/$_" "$base\site" }

Write-Host "`n=== DOWNLOAD CONCLUIDO ==="
