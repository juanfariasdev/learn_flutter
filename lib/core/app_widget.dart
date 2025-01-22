import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter/core/app_routes.dart';
import 'package:learn_flutter/pages/splash/splash_page.dart';

class AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    print('Rota empilhada: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    print('Rota removida: ${route.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    print('Rota removida explicitamente: ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    print('Rota substituída: ${newRoute?.settings.name}');
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Learn Flutter",
      home: SplashPage(),
      onGenerateRoute: AppRoutes.generateRoute,
      navigatorObservers: [AppNavigatorObserver()],
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
