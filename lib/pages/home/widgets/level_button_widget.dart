import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter/core/app_colors.dart';

// Definindo o enum de níveis
enum Level { facil, medio, dificil, perito }

class LevelButtonWidget extends StatelessWidget {
  final Level level;

  // Construtor do widget recebendo o level (do tipo enum)
  LevelButtonWidget({super.key, required this.level});

  // Configurações de cores associadas aos níveis
  final Map<Level, Map<String, Color>> config = {
    Level.facil: {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil
    },
    Level.medio: {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio
    },
    Level.dificil: {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil
    },
    Level.perito: {
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito
    }
  };

  @override
  Widget build(BuildContext context) {
    // Verifica se o nível está no mapa de configurações, caso contrário, usa o "facil" como padrão
    final levelConfig = config[level] ?? config[Level.facil]!;

    // Obtém o texto do nível de forma legível
    String label = level.toString().split('.').last.capitalize();

    return Container(
      decoration: BoxDecoration(
        color: levelConfig['color'], // Cor de fundo do botão
        border: Border.fromBorderSide(
          BorderSide(color: levelConfig['borderColor']!), // Cor da borda
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            color: levelConfig['fontColor'], // Cor do texto
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

// Extensão para capitalizar a primeira letra
extension StringCapitalization on String {
  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }
}
