import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_app/l10n/app_localizations.dart';
import 'package:nasa_app/ui/theme/app_colors.dart';
import 'package:nasa_app/ui/theme/lottie_assets.dart';

class ErrorLottie extends StatelessWidget {
  const ErrorLottie({
    super.key,
    required this.errorMessage,
    this.onTap,
  });

  final String? errorMessage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Lottie.asset(
              LottieAssets.spaceCat,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      errorMessage ?? l10n.error,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 12.0),
                    FilledButton(
                      onPressed: onTap,
                      child: Text(l10n.retry),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
