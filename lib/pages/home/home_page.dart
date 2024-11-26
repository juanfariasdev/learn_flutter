import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';
import 'package:learn_flutter/pages/home/widgets/app_bar_widget.dart';
import 'package:learn_flutter/pages/home/widgets/level_button_widget.dart';
import 'package:learn_flutter/pages/home/widgets/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

List<Map<String, dynamic>> learningPath = [
  {
    'label': 'Fundamentos de Programação',
    'icon': Icons.code,
    'progress': 0,
    'totalProgress': 1,
  },
  {
    'label': 'Configuração do Ambiente de Desenvolvimento',
    'icon': Icons.settings,
    'progress': 0,
    'totalProgress': 1,
  },
  {
    'label': 'Introdução ao Dart',
    'icon': Icons.language,
    'progress': 0,
    'totalProgress': 2,
  },
  {
    'label': 'Estrutura da Linguagem',
    'icon': Icons.abc,
    'progress': 1,
    'totalProgress': 2,
  },
  {
    'label': 'Widgets Básicos',
    'icon': Icons.widgets,
    'progress': 2,
    'totalProgress': 5,
  },
  {
    'label': 'Layouts e Containers',
    'icon': Icons.view_column,
    'progress': 3,
    'totalProgress': 5,
  },
  {
    'label': 'Gerenciamento de Estado',
    'icon': Icons.stacked_bar_chart,
    'progress': 2,
    'totalProgress': 4,
  },
  {
    'label': 'Navegação e Rotas',
    'icon': Icons.navigation,
    'progress': 2,
    'totalProgress': 3,
  },
  {
    'label': 'Interações e Gestos',
    'icon': Icons.touch_app,
    'progress': 3,
    'totalProgress': 4,
  },
  {
    'label': 'Armazenamento Local',
    'icon': Icons.storage,
    'progress': 1,
    'totalProgress': 3,
  },
  {
    'label': 'Firebase e Integração de Backend',
    'icon': Icons.cloud,
    'progress': 0,
    'totalProgress': 3,
  },
  {
    'label': 'Animações e Transições',
    'icon': Icons.animation,
    'progress': 2,
    'totalProgress': 4,
  },
  {
    'label': 'Testes e Debugging',
    'icon': Icons.bug_report,
    'progress': 1,
    'totalProgress': 3,
  },
  {
    'label': 'Publicação do App',
    'icon': Icons.publish,
    'progress': 1,
    'totalProgress': 2,
  },
  {
    'label': 'Boas Práticas de Código e Arquitetura',
    'icon': Icons.build,
    'progress': 0,
    'totalProgress': 2,
  },
  {
    'label': 'Otimização e Desempenho',
    'icon': Icons.speed,
    'progress': 0,
    'totalProgress': 2,
  },
  {
    'label': 'Acessibilidade no Flutter',
    'icon': Icons.accessible,
    'progress': 0,
    'totalProgress': 2,
  },
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 5,
                  children: [
                    LevelButtonWidget(level: Level.facil),
                    LevelButtonWidget(level: Level.medio),
                    LevelButtonWidget(level: Level.dificil),
                    LevelButtonWidget(level: Level.perito),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppConfig.mobilePadding),
              child: Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: learningPath.map((item) {
                    return QuizCardWidget(
                      label: item['label'],
                      icon: item['icon'],
                      progress: item['progress'],
                      totalProgress: item['totalProgress'],
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
