import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';
import 'package:learn_flutter/models/user_model.dart';
import 'package:learn_flutter/pages/home/widgets/score_card_widget.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  AppBarWidget({super.key, required this.user})
      : super(
          preferredSize: const Size.fromHeight(200),
          child: SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: 155,
                  padding:
                      EdgeInsets.symmetric(horizontal: AppConfig.mobilePadding),
                  width: double.maxFinite,
                  decoration: const BoxDecoration(color: AppColors.primary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Olá, Bem-vindo 👋',
                            style: AppTextStyles.subTitle,
                          ),
                          Text(
                            user.name,
                            style: AppTextStyles.titleBold,
                          ),
                        ],
                      ),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: NetworkImage(user.photoUrl),
                            onError: (exception, stackTrace) {
                              // Aqui você pode tratar o erro, exibir um ícone de erro ou imagem padrão
                              print("Erro ao carregar imagem: $exception");
                            },
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            user.photoUrl,
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
                Align(
                  alignment: Alignment(0, 1),
                  child: ScoreCardWidget(
                    progress: user.score,
                  ),
                )
              ],
            ),
          ),
        );
}
