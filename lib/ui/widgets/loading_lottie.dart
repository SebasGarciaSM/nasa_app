import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_app/ui/theme/app_colors.dart';
import 'package:nasa_app/ui/theme/lottie_assets.dart';

class LoadingLottie extends StatefulWidget {
  const LoadingLottie({super.key});

  @override
  State<LoadingLottie> createState() => _LoadingLottieState();
}

class _LoadingLottieState extends State<LoadingLottie>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _color1;
  late Animation<Color?> _color2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _color1 = ColorTween(
      begin: AppColors.primaryLight,
      end: AppColors.primaryDark,
    ).animate(_controller);

    _color2 = ColorTween(
      begin: AppColors.purpleLight,
      end: AppColors.purpleDark,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                _color1.value ?? Colors.purple,
                _color2.value ?? Colors.black,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Lottie.asset(
            LottieAssets.loadingRocket,
            width: 200,
            height: 200,
            fit: BoxFit.fill,
            frameRate: FrameRate.composition,
            repeat: true,
            delegates: LottieDelegates(
              values: [
                ValueDelegate.color(
                  const ['**'],
                  value: isDark ? AppColors.primaryLight : AppColors.blueLight,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
