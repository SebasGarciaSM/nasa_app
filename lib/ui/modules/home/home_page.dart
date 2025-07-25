import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_app/core/services/navigation_service.dart';
import 'package:nasa_app/l10n/app_localizations.dart';
import 'package:nasa_app/ui/models/home_card_config.dart';
import 'package:nasa_app/ui/theme/app_colors.dart';
import 'package:nasa_app/ui/modules/home/widgets/home_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final nav = Modular.get<NavigationService>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final List<HomeCardConfig> cards = [
      HomeCardConfig(
        icon: Icons.image,
        title: l10n.apod,
        lightColor: AppColors.apodLight,
        darkColor: AppColors.apodDark,
        onTap: nav.toApod,
      ),
      HomeCardConfig(
        icon: Icons.landscape,
        title: l10n.marsRoversPhotos,
        lightColor: AppColors.marsLight,
        darkColor: AppColors.marsDark,
        onTap: nav.toMars,
      ),
      HomeCardConfig(
        icon: Icons.blur_on,
        title: l10n.neows,
        lightColor: AppColors.asteroidsLight,
        darkColor: AppColors.asteroidsDark,
        onTap: nav.toAsteroids,
      ),
      HomeCardConfig(
        icon: Icons.public,
        title: l10n.epic,
        lightColor: AppColors.epicLight,
        darkColor: AppColors.epicDark,
        onTap: nav.toEpic,
      ),
      HomeCardConfig(
        icon: Icons.wb_sunny,
        title: l10n.donki,
        lightColor: AppColors.donkiLight,
        darkColor: AppColors.donkiDark,
      ),
      HomeCardConfig(
        icon: Icons.lightbulb,
        title: l10n.techTransfer,
        lightColor: AppColors.techLight,
        darkColor: AppColors.techDark,
      ),
      HomeCardConfig(
        icon: Icons.video_library,
        title: l10n.imageAndVideoLibrary,
        lightColor: AppColors.mediaLibLight,
        darkColor: AppColors.mediaLibDark,
      ),
      HomeCardConfig(
        icon: Icons.travel_explore,
        title: l10n.exoplanetArchive,
        lightColor: AppColors.exoplanetLight,
        darkColor: AppColors.exoplanetDark,
      ),
      HomeCardConfig(
        icon: Icons.map,
        title: l10n.earthAssets,
        lightColor: AppColors.earthAssetsLight,
        darkColor: AppColors.earthAssetsDark,
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar.medium(
            pinned: false,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(l10n.appTitle),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 3 / 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return HomeCard(homeCardConfig: cards[index]);
                },
                childCount: cards.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
