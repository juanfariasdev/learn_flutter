import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:learn_flutter/core/app_text_styles.dart';
import 'package:learn_flutter/pages/challenge/widgets/awnser_widget.dart';
import 'package:photo_view/photo_view.dart';

class Awnser {
  final String label;
  final bool isRight;
  final bool isSelected;

  Awnser({
    required this.label,
    this.isRight = false,
    this.isSelected = false,
  });
}

class QuizWigdet extends StatefulWidget {
  final String title;
  final String description;
  final String? urlImage;
  final List<Awnser> questions;

  const QuizWigdet(
      {super.key,
      required this.title,
      required this.description,
      this.urlImage,
      required this.questions});

  @override
  _QuizWigdetState createState() => _QuizWigdetState();
}

class _QuizWigdetState extends State<QuizWigdet> {
  void _openImageWithBlur() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(0),
          backgroundColor:
              Colors.transparent, // Torna o fundo do diálogo transparente
          child: Stack(
            children: [
              // Aplicando o efeito de Blur no fundo
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 5.0, sigmaY: 5.0), // Intensidade do blur
                  child: Container(
                    color: Colors.black
                        .withOpacity(0.5), // Fundo com opacidade para o blur
                  ),
                ),
              ),
              // Exibindo a imagem com zoom
              Column(
                children: [
                  // Botão "X" para fechar o diálogo
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop(); // Fecha o diálogo
                      },
                    ),
                  ),
                  // Exibindo a imagem com zoom
                  Expanded(
                    child: PhotoView(
                      backgroundDecoration: BoxDecoration(
                        color: Colors
                            .transparent, // Removendo o fundo do PhotoView
                      ),
                      imageProvider: NetworkImage(widget.urlImage!),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: AppTextStyles.heading),
          Text(widget.description, style: AppTextStyles.body),
          SizedBox(height: 10),
          if (widget.urlImage != null && widget.urlImage!.isNotEmpty)
            GestureDetector(
              onTap:
                  _openImageWithBlur, // Ao clicar, abre a imagem com blur no fundo
              child: Image.network(
                widget.urlImage!,
                width: double.infinity, // A imagem agora ocupa toda a largura
                fit: BoxFit.cover, // Ajusta a imagem para cobrir toda a largura
              ),
            ),
          SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 4,
            children: widget.questions.map((item) {
              return AwnserWidget(
                isRight: item.isRight,
                isSelected: item.isSelected,
                label: item.label,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
