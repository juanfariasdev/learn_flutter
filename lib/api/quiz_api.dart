import 'package:flutter/material.dart';
import 'package:learn_flutter/models/question_model.dart';
import 'package:learn_flutter/models/quiz_model.dart';
import 'package:learn_flutter/models/topic_model.dart';
import 'package:learn_flutter/pages/home/widgets/level_button_widget.dart';

List<QuizModel> learningPath = [
  QuizModel(
    label: 'Fundamentos de Programação',
    icon: Icons.code,
    progress: 0,
    totalProgress: 1,
    level: Level.facil,
    topics: [
      TopicModel(
        title: 'Variáveis e Tipos de Dados',
        challenges: [
          QuestionModel(
            title: 'O que é uma variável?',
            description: 'Aprenda o conceito de variáveis e tipos de dados.',
            answers: [],
          ),
          QuestionModel(
            title: 'Operadores Matemáticos',
            description: 'Entenda como usar operadores como +, -, *, e /.',
            answers: [],
          ),
        ],
      ),
      TopicModel(
        title: 'Estruturas de Controle',
        challenges: [
          QuestionModel(
            title: 'Condicionais',
            description: 'Aprenda a usar if, else e switch.',
            answers: [],
          ),
          QuestionModel(
            title: 'Loops',
            description: 'Descubra como usar for, while e do-while.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
  QuizModel(
    label: 'Configuração do Ambiente de Desenvolvimento',
    icon: Icons.settings,
    progress: 0,
    totalProgress: 1,
    level: Level.medio,
    topics: [
      TopicModel(
        title: 'Instalação e Configuração',
        challenges: [
          QuestionModel(
            title: 'Instalação do Flutter',
            description: 'Saiba como instalar o Flutter no seu computador.',
            answers: [],
          ),
          QuestionModel(
            title: 'Configuração de IDEs',
            description: 'Aprenda a configurar o VSCode e o Android Studio.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
  QuizModel(
    label: 'Introdução ao Dart',
    icon: Icons.language,
    progress: 0,
    totalProgress: 2,
    level: Level.facil,
    topics: [
      TopicModel(
        title: 'Conceitos Básicos',
        challenges: [
          QuestionModel(
            title: 'Primeiro Programa',
            description: 'Escreva seu primeiro programa em Dart.',
            answers: [],
          ),
          QuestionModel(
            title: 'Tipos de Dados',
            description: 'Explore os principais tipos de dados em Dart.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
  QuizModel(
    label: 'Estrutura da Linguagem',
    icon: Icons.abc,
    progress: 1,
    totalProgress: 2,
    level: Level.medio,
    topics: [
      TopicModel(
        title: 'Funções e Métodos',
        challenges: [
          QuestionModel(
            title: 'Declarando Funções',
            description: 'Aprenda a criar e usar funções em Dart.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
  QuizModel(
    label: 'Widgets Básicos',
    icon: Icons.widgets,
    progress: 2,
    totalProgress: 5,
    level: Level.facil,
    topics: [
      TopicModel(
        title: 'Widgets Fundamentais',
        challenges: [
          QuestionModel(
            title: 'O que são Widgets?',
            description: 'Entenda a base de toda interface no Flutter.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
  QuizModel(
    label: 'Layouts e Containers',
    icon: Icons.view_column,
    progress: 3,
    totalProgress: 5,
    level: Level.medio,
    topics: [
      TopicModel(
        title: 'Layout Responsivo',
        challenges: [
          QuestionModel(
            title: 'Row e Column',
            description: 'Aprenda a alinhar widgets em linhas e colunas.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
  QuizModel(
    label: 'Gerenciamento de Estado',
    icon: Icons.stacked_bar_chart,
    progress: 2,
    totalProgress: 4,
    level: Level.medio,
    topics: [
      TopicModel(
        title: 'Estados Simples',
        challenges: [
          QuestionModel(
            title: 'Stateful Widgets',
            description: 'Trabalhe com widgets dinâmicos.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
  QuizModel(
    label: 'Navegação e Rotas',
    icon: Icons.navigation,
    progress: 2,
    totalProgress: 3,
    level: Level.medio,
    topics: [
      TopicModel(
        title: 'Rotas Básicas',
        challenges: [
          QuestionModel(
            title: 'Navegação Simples',
            description: 'Navegue entre telas com Navigator.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
  QuizModel(
    label: 'Interações e Gestos',
    icon: Icons.touch_app,
    progress: 3,
    totalProgress: 4,
    level: Level.medio,
    topics: [
      TopicModel(
        title: 'Gestos e Eventos',
        challenges: [
          QuestionModel(
            title: 'Interações Simples',
            description: 'Trabalhe com gestos como toque e arrastar.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
  QuizModel(
    label: 'Armazenamento Local',
    icon: Icons.storage,
    progress: 1,
    totalProgress: 3,
    level: Level.facil,
    topics: [
      TopicModel(
        title: 'Salvando Dados',
        challenges: [
          QuestionModel(
            title: 'SharedPreferences',
            description: 'Armazene dados de forma persistente no app.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
  QuizModel(
    label: 'Firebase e Integração de Backend',
    icon: Icons.cloud,
    progress: 0,
    totalProgress: 3,
    level: Level.medio,
    topics: [
      TopicModel(
        title: 'Conexão com o Firebase',
        challenges: [
          QuestionModel(
            title: 'Configuração Inicial',
            description: 'Aprenda a configurar o Firebase no Flutter.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
  QuizModel(
    label: 'Animações e Transições',
    icon: Icons.animation,
    progress: 2,
    totalProgress: 4,
    level: Level.dificil,
    topics: [
      TopicModel(
        title: 'Animações Simples',
        challenges: [
          QuestionModel(
            title: 'Animações com AnimatedContainer',
            description: 'Crie animações básicas usando widgets nativos.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
  QuizModel(
    label: 'Testes e Debugging',
    icon: Icons.bug_report,
    progress: 1,
    totalProgress: 3,
    level: Level.dificil,
    topics: [
      TopicModel(
        title: 'Depuração de Código',
        challenges: [
          QuestionModel(
            title: 'Debugging com Breakpoints',
            description: 'Identifique problemas no código com eficiência.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
  QuizModel(
    label: 'Publicação do App',
    icon: Icons.publish,
    progress: 1,
    totalProgress: 2,
    level: Level.dificil,
    topics: [
      TopicModel(
        title: 'Publicação na Play Store',
        challenges: [
          QuestionModel(
            title: 'Configuração para Publicação',
            description: 'Prepare o app para ser publicado.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
  QuizModel(
    label: 'Boas Práticas de Código e Arquitetura',
    icon: Icons.build,
    progress: 0,
    totalProgress: 2,
    level: Level.perito,
    topics: [
      TopicModel(
        title: 'Padrões de Projeto',
        challenges: [
          QuestionModel(
            title: 'Arquitetura Limpa',
            description: 'Organize seu código para facilitar manutenção.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
  QuizModel(
    label: 'Otimização e Desempenho',
    icon: Icons.speed,
    progress: 0,
    totalProgress: 2,
    level: Level.dificil,
    topics: [
      TopicModel(
        title: 'Melhorando Performance',
        challenges: [
          QuestionModel(
            title: 'Widgets Eficientes',
            description: 'Aprenda a otimizar o desempenho de widgets.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
  QuizModel(
    label: 'Acessibilidade no Flutter',
    icon: Icons.accessible,
    progress: 0,
    totalProgress: 2,
    level: Level.perito,
    topics: [
      TopicModel(
        title: 'Incluindo Acessibilidade',
        challenges: [
          QuestionModel(
            title: 'Widgets Acessíveis',
            description: 'Crie interfaces inclusivas para todos.',
            answers: [],
          ),
        ],
      ),
    ],
  ),
];
