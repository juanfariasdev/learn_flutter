import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/home/widgets/app_bar_widget.dart';
import 'package:learn_flutter/pages/home/widgets/level_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Rolagem horizontal
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
    );
  }
}
