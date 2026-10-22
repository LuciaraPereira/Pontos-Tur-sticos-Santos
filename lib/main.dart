
// Luciara Silva Pereira

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pontos Turísticos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: Catalogo(),
    );
  }
}

class Catalogo extends StatefulWidget {
  Catalogo({super.key});

  @override
  State<Catalogo> createState() => _CatalogoState();
}

class _CatalogoState extends State<Catalogo> {
  List<String> nomes = [
    'Museu do Café',
    'Museu Pelé',
    'Pinacoteca Benedicto Calixto',
    'Basílica Menor de Santo Antônio do Embaré',
    'Monte Serrat',
    'Aquário Municipal de Santos',
    'Museu de Pesca',
    'Igreja do Convento Nossa Senhora do Carmo',
  ];

  List<String> cidades = [
    'Santos',
    'Santos',
    'Santos',
    'Santos',
    'Santos',
    'Santos',
    'Santos',
    'Santos',
  ];

  List<String> imagens = [
    'https://revistanove.com.br/wp-content/uploads/2020/03/museu-do-cafe-santos-1089x730.jpg',
    'https://saopauloantiga.com.br/wp-content/uploads/2022/07/museupele.jpg',
    'https://www.santos.sp.gov.br/static/files_www/styles/newspagemodal/public/field/image/carlos_nogueira_1322_0.jpg?itok=1PTVFLc1',
    'https://s2-g1.glbimg.com/R1VLiL8bb1rExaTdhkJXjRCv6Nk=/0x0:1200x800/1000x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2024/A/V/QNgYGsTAyMTF5UDw1Skg/design-sem-nome-42-.png',
    'https://www.santos.sp.gov.br/static/files_www/styles/portal-quadrado/public/field/image/portal/carlos_nogueira_0722.jpg?itok=kbM0xpVq',
    'https://www.santos.sp.gov.br/static/files_www/styles/full/public/field/image/5_cn.jpeg?itok=DMt_xYnp',
    'https://saopauloparacriancas.com.br/wp-content/uploads/2019/07/sp_para_criancas_museu-da-pesca-santos_cred-instituto-pesca-sp4.jpg',
    'https://www.diocesedesantos.org.br/images/paroquias/CONVENTO-N-SRA-DO-CARMO.jpg',
  ];

  List<String> descricoes = [
    'Antiga Bolsa Oficial do Café, preserva a história econômica e arquitetônica do setor com salas suntuosas e cafeteria especializada no Centro Histórico.',
    'Espaço no Valongo dedicado à trajetória, troféus e itens pessoais do Rei do Futebol.',
    'Palacete Art Nouveau na praia do Boqueirão que expõe obras do pintor e abriga belos jardins e um café.',
    'Imponente igreja de arquitetura neogótica localizada na orla do bairro Embaré.',
    'Mirante no coração da cidade com vista panorâmica de 360°, santuário no topo e acesso por escadaria ou bondinho.',
    'O aquário mais antigo do Brasil, na Ponta da Praia, ideal para famílias com dezenas de espécies marinhas e tanques temáticos.',
    'Localizado na Ponta da Praia, famoso por exibir o esqueleto completo de uma imensa baleia e animais marinhos preservados.',
    'Templo do século XVI no Centro Histórico, tombado, com rica arquitetura colonial e altares barrocos.',
  ];

  List<bool> favoritos = [
    false, false, false, false, false, false, false, false
  ];

  List<bool> visitados = [
    false, false, false, false, false, false, false,  false
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pontos Turísticos de Santos - SP'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        for (int i = 0; i < nomes.length; i += 2)
          _linhaPontos(i),
      ],
    );
  }


_linhaPontos(int i) {
  double largura = MediaQuery.of(context).size.width;

  if (largura < 600) {
    return Column(
      children: [
        _cartaoPonto(i),
        if (i + 1 < nomes.length)
          _cartaoPonto(i + 1),
      ],
    );
  }

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: _cartaoPonto(i),
      ),
      SizedBox(width: 10),
      if (i + 1 < nomes.length)
        Expanded(
          child: _cartaoPonto(i + 1),
        )
      else
        Expanded(child: Container()),
    ],
  );
}


 _cartaoPonto(int i) {
  return Container(
    height: 200,
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 10),
    padding: EdgeInsets.all(6),
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color.fromARGB(255, 2, 72, 129),
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          nomes[i],
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 2),
        Text(
          cidades[i],
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(height: 4),
        Expanded(
          child: Image.network(
            imagens[i],
            width: double.infinity,
            fit: BoxFit.contain,
            webHtmlElementStrategy:
                WebHtmlElementStrategy.fallback,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Text(
                  'Imagem indisponível',
                  style: TextStyle(fontSize: 10),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 4),
        Text(
          descricoes[i],
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 9),
        ),
        SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: favoritos[i],
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize:
                      MaterialTapTargetSize.shrinkWrap,
                  onChanged: (valor) {
                    setState(() {
                      favoritos[i] = valor!;
                    });
                  },
                ),
                Text(
                  'Favorito',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: visitados[i],
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize:
                      MaterialTapTargetSize.shrinkWrap,
                  onChanged: (valor) {
                    setState(() {
                      visitados[i] = valor!;
                    });
                  },
                ),
                Text(
                  'Visitado',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
}
