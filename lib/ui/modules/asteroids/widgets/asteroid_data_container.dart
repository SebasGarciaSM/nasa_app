import 'package:flutter/material.dart';
import 'package:nasa_app/domain/entities/asteroid_entity.dart';
import 'package:nasa_app/l10n/app_localizations.dart';
import 'package:nasa_app/ui/theme/app_colors.dart';

class AsteroidDataContainer extends StatelessWidget {
  const AsteroidDataContainer({
    super.key,
    required this.asteroid,
  });

  final AsteroidEntity asteroid;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.black20,
            blurRadius: 4.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        clipBehavior: Clip.antiAlias,
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: AppColors.transparent,
          ),
          child: ExpansionTile(
            childrenPadding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            title: Row(
              children: [
                Text(
                  asteroid.name,
                  style: textTheme.titleMedium,
                ),
                SizedBox(width: 10.0),
                (asteroid.isHazardous)
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.redDark,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.warning_amber_rounded,
                              color: AppColors.white,
                            ),
                            SizedBox(width: 6.0),
                            Text(
                              l10n.hazardous,
                              style: textTheme.titleSmall?.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
            expandedAlignment: Alignment.centerLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.magnitude(asteroid.magnitude),
                style: textTheme.labelLarge,
              ),
              Text(
                l10n.approachDate(asteroid.approachDate),
                style: textTheme.labelLarge,
              ),
              Text(
                l10n.velocityKph(asteroid.velocityKph),
                style: textTheme.labelLarge,
              ),
              Text(
                l10n.missDistanceKm(asteroid.missDistanceKm),
                style: textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
