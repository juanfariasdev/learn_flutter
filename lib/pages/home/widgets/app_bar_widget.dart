import 'package:flutter/material.dart';
import 'package:learn_flutter/core/app_colors.dart';
import 'package:learn_flutter/core/app_text_styles.dart';
import 'package:learn_flutter/pages/home/widgets/score_card_widget.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({super.key})
      : super(
          preferredSize: const Size.fromHeight(200),
          child: SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.maxFinite,
                  decoration: const BoxDecoration(color: AppColors.primary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(
                          text: 'Olá ',
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: 'Juanfarias.dev',
                              style: AppTextStyles.titleBold,
                            ),
                          ])),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: const NetworkImage(
                                "https://avatars.githubusercontent.com/u/77401614?v=4"),
                            onError: (exception, stackTrace) {
                              // Aqui você pode tratar o erro, exibir um ícone de erro ou imagem padrão
                              print("Erro ao carregar imagem: $exception");
                            },
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            "https://avatars.githubusercontent.com/u/77401614?v=4",
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress.expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                (loadingProgress
                                                        .expectedTotalBytes ??
                                                    1)
                                            : null
                                        : null,
                                  ),
                                );
                              }
                            },
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              // Aqui você pode exibir uma imagem de erro ou uma imagem padrão
                              return const Icon(
                                Icons.error,
                                color: Colors.red,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: ScoreCardWidget(),
                )
              ],
            ),
          ),
        );
}
