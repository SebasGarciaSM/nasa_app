import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_app/l10n/app_localizations.dart';
import 'package:nasa_app/ui/theme/lottie_assets.dart';

class NoDataFoundLottie extends StatelessWidget {
  const NoDataFoundLottie({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

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
            l10n.noResultsFound,
            style: textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            l10n.pleaseTryAgainWithAnotherDate,
            style: textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
