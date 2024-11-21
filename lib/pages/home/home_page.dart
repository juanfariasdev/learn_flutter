import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/home/widgets/app_bar_widget.dart';

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
      body: Container(
        child: const Center(
          child: Text("Home Page"),
        ),
      ),
    );
  }
}
