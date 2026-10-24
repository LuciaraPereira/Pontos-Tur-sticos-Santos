
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
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFF173B63),
      ),
       scaffoldBackgroundColor: Color(0xFFF4F7FB),
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
        backgroundColor: Color(0xFF173B63),
        foregroundColor: Colors.white,
        title: Text('Pontos Turísticos de Santos - Luciara Pereira'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        Container(
  margin: EdgeInsets.only(bottom: 16),
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Explore Santos',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFF173B63),
        ),
      ),
      SizedBox(height: 6),
      Text(
        'Descubra lugares históricos e culturais da cidade.',
        style: TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
    ],
  ),
),
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



Widget _cartaoPonto(int i) {
  return Container(
    margin: EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(
        color: Color(0xFFE1E8F0),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 5,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(14),
          ),
          child: SizedBox(
            height: 145,
            width: double.infinity,
            child: Image.network(
              imagens[i],
              fit: BoxFit.cover,
              webHtmlElementStrategy:
                  WebHtmlElementStrategy.fallback,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Color(0xFFEAF0F6),
                  child: Center(
                    child: Text(
                      'Imagem indisponível',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nomes[i],
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF173B63),
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: Color(0xFF537A9E),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '${cidades[i]}, SP',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                descricoes[i],
                style: TextStyle(
                  fontSize: 12,
                  height: 1.4,
                  color: Color(0xFF454F5B),
                ),
              ),
              SizedBox(height: 10),
              Divider(
                height: 1,
                color: Color(0xFFE8EDF2),
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: favoritos[i],
                          activeColor: Color(0xFF173B63),
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (valor) {
                            setState(() {
                              favoritos[i] = valor!;
                            });
                          },
                        ),
                        Flexible(
                          child: Text(
                            'Favorito',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: visitados[i],
                          activeColor: Color(0xFF173B63),
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (valor) {
                            setState(() {
                              visitados[i] = valor!;
                            });
                          },
                        ),
                        Flexible(
                          child: Text(
                            'Visitado',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

}
