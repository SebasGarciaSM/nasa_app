import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_app/ui/theme/lottie_assets.dart';

class NoDataFoundLottie extends StatelessWidget {
  const NoDataFoundLottie({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            LottieAssets.spaceBoyDeveloper,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          Text(
            'No Results Found',
            style: textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Please try again with another date.',
            style: textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
