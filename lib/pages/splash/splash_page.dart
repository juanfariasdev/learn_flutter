import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';
import 'package:learn_flutter/pages/home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _redirectToGetStarted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 150,
          child: Image.asset(
            AppImages.logo,
          ), // Usando o LogoWidget para exibir o logotipo,
        ),
      ),
    );
  }

  Future<void> _redirectToGetStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      _navigateToGetStartedPage(); // Só navega se o State ainda estiver montado
    }
  }

  void _navigateToGetStartedPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(), // Navega para a página de slide
      ),
    );
  }
}
