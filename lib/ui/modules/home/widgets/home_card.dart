import 'package:flutter/material.dart';
import 'package:nasa_app/ui/models/home_card_config.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.homeCardConfig,
  });

  final HomeCardConfig homeCardConfig;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode
        ? homeCardConfig.darkColor
        : homeCardConfig.lightColor;

    final foregroundColor = !isDarkMode
        ? homeCardConfig.darkColor
        : homeCardConfig.lightColor;

    return Card(
      elevation: 2.0,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: homeCardConfig.onTap,
        splashColor: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    homeCardConfig.icon,
                    color: foregroundColor,
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Flexible(
                child: Text(homeCardConfig.title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
