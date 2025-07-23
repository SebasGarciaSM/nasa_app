import 'package:flutter/material.dart';
import 'package:nasa_app/domain/entities/mars_photo_entity.dart';
import 'package:nasa_app/l10n/app_localizations.dart';

class MarsPhotoCard extends StatelessWidget {
  const MarsPhotoCard({
    super.key,
    required this.marsPhoto,
    required this.marsPhotoHero,
    required this.onTap,
  });

  final MarsPhotoEntity marsPhoto;
  final Hero marsPhotoHero;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Card(
      elevation: 6.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            marsPhotoHero,
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.cameraName(marsPhoto.cameraName),
                    style: textTheme.bodyMedium,
                  ),
                  Text(
                    l10n.earthDate(marsPhoto.earthDate),
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
