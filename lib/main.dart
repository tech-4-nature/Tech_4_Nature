import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech 4 Nature',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Tech 4 Nature')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/entrada.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          const Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class News {
  final String title;
  final String description;
  final String content;
  final String imageUrl;
  News({required this.title, required this.description, required this.content, required this.imageUrl});
}

void _confirmExit(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmação'),
        content: const Text('Deseja mesmo sair?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o pop-up
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              exit(0); // Fecha o aplicativo
            },
            child: const Text('Sair'),
          ),
        ],
      );
    },
  );
}

Widget buildAppDrawer(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.25, // Responsive size
                height: screenWidth * 0.25, // Responsive size
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logoCompleto.png',
                    fit: BoxFit.contain, // Ensure the image fits within the container
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Tech 4 Nature',
                style: TextStyle(
                  fontSize: screenWidth * 0.05, // Responsive font size
                  color: Colors.white,
                ),
                textAlign: TextAlign.center, // Center align the text
              ),
            ],
          ),
        ),
        ListTile(
          leading: SizedBox(
            width: 40, // Adjust the width to fit properly
            child: const Icon(Icons.article),
          ),
          title: const Text('Conteúdos'),
          onTap: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
        ListTile(
          leading: SizedBox(
            width: 40, // Adjust the width to fit properly
            child: const Icon(Icons.info),
          ),
          title: const Text('Créditos'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreditsPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: SizedBox(
            width: 40, // Adjust the width to fit properly
            child: const Icon(Icons.exit_to_app),
          ),
          title: const Text('Sair'),
          onTap: () {
            _confirmExit(context);
          },
        ),
      ],
    ),
  );
}

class _MyHomePageState extends State<MyHomePage> {
  final List<News> newsList = [
    News(
      title: 'Agenda 2030',
      description: 'Conheça os objetivos e metas globais para um mundo sustentável.',
      content: 'A Agenda 2030 é um plano de ação global adotado por todos os Estados-membros das Nações Unidas em 2015. Ela estabelece 17 Objetivos de Desenvolvimento Sustentável (ODS) para erradicar a pobreza, proteger o meio ambiente e garantir paz e prosperidade para todos até 2030. Cada objetivo possui metas específicas que abrangem áreas como saúde, educação, igualdade de gênero, água limpa, energia, trabalho decente, inovação, redução das desigualdades, cidades sustentáveis, consumo responsável, combate às mudanças climáticas, entre outros.',
      imageUrl: 'assets/images/agenda2030.png',
    ),
    News(
      title: 'Educação Ambiental Crítica',
      description: 'A importância de uma abordagem crítica na educação ambiental.',
      content: 'A Educação Ambiental Crítica propõe uma reflexão profunda sobre as causas dos problemas ambientais, indo além da simples transmissão de informações. Ela incentiva o pensamento crítico, a participação social e a transformação das práticas cotidianas, promovendo a justiça social e ambiental. O objetivo é formar cidadãos conscientes, capazes de questionar e agir para transformar a realidade.',
      imageUrl: 'assets/images/educacaoAmbientalCritica.png',
    ),
    News(
      title: 'Concepções do Meio Ambiente',
      description: 'Entenda as diferentes formas de perceber o meio ambiente.',
      content: 'O meio ambiente pode ser compreendido sob diferentes concepções: naturalista (focada nos elementos naturais), antropocêntrica (prioriza o ser humano), globalizante (integra sociedade e natureza) e crítica (questiona as relações de poder e desigualdade). Compreender essas visões é fundamental para promover ações mais eficazes e justas em prol da sustentabilidade.',
      imageUrl: 'assets/images/concepcoesMeioAmbiente.png',
    ),
    News(
      title: 'Responsabilidade Socio Ambiental',
      description: 'O papel de cada um na construção de um futuro sustentável.',
      content: 'A responsabilidade socioambiental envolve o compromisso de indivíduos, empresas e governos com práticas que respeitem o meio ambiente e promovam o bem-estar social. Isso inclui desde pequenas ações cotidianas até políticas públicas e estratégias empresariais voltadas para a sustentabilidade, ética e justiça social.',
      imageUrl: 'assets/images/responsaSocioAmbiental.png',
    ),
  ];

  List<News> filteredNewsList = [];

  @override
  void initState() {
    super.initState();
    filteredNewsList = newsList; // Inicialmente, mostra todas as notícias
  }

  void _filterNews(String query) {
    setState(() {
      filteredNewsList = newsList
          .where((news) => news.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _openNewsDetail(News news) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsDetailPage(news: news),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: _filterNews,
                decoration: InputDecoration(
                  hintText: 'Pesquisar...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 16),
            ClipOval(
              child: Image.asset(
                'assets/images/logoSimples.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/logoCompleto.png',
                        fit: BoxFit.contain, // Ensure the image fits within the container
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: SizedBox(
                width: 40, // Adjust the width to fit properly
                child: const Icon(Icons.article),
              ),
              title: const Text('Conteúdos'),
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
            ListTile(
              leading: SizedBox(
                width: 40, // Adjust the width to fit properly
                child: const Icon(Icons.info),
              ),
              title: const Text('Créditos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreditsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: SizedBox(
                width: 40, // Adjust the width to fit properly
                child: const Icon(Icons.exit_to_app),
              ),
              title: const Text('Sair'),
              onTap: () {
                _confirmExit(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fundoNoticias3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: filteredNewsList.length,
          itemBuilder: (context, index) {
            final news = filteredNewsList[index];
            return GestureDetector(
              onTap: () => _openNewsDetail(news),
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          news.imageUrl,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              news.title,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              news.description,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final News news;
  const NewsDetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      drawer: buildAppDrawer(context),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fundoNoticias3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(screenWidth * 0.06), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth * 0.03), // Responsive border radius
                child: Image.asset(
                  news.imageUrl,
                  width: double.infinity,
                  height: screenWidth * 0.6, // Responsive height
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    height: screenWidth * 0.6, // Responsive height
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, size: 60),
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.06), // Responsive spacing
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(screenWidth * 0.03), // Responsive border radius
                ),
                child: Text(
                  news.content,
                  style: TextStyle(fontSize: screenWidth * 0.05), // Responsive font size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créditos'),
      ),
      drawer: buildAppDrawer(context),
      body: Center(
        child: Image.asset(
          'assets/images/creditos.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
