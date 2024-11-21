import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';
import 'package:learn_flutter/pages/home/widgets/chart_widget.dart';

class ScoreCardWidget extends StatelessWidget {
  const ScoreCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(flex: 2, child: ChartWidget()),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bom resultado",
                        style: AppTextStyles.heading,
                      ),
                      Text("Seu conhecimento está sendo aprimorado",
                          style: AppTextStyles.body),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
