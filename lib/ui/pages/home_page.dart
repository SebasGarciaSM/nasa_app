import 'package:flutter/material.dart';
import 'package:nasa_app/l10n/app_localizations.dart';
import 'package:nasa_app/ui/models/home_card_config.dart';
import 'package:nasa_app/ui/theme/app_colors.dart';
import 'package:nasa_app/ui/widgets/home_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    final List<HomeCardConfig> cards = [
      HomeCardConfig(
        icon: Icons.image,
        title: l10n.apod,
        lightColor: AppColors.apodLight,
        darkColor: AppColors.apodDark,
      ),
      HomeCardConfig(
        icon: Icons.landscape,
        title: l10n.marsRoversPhotos,
        lightColor: AppColors.marsLight,
        darkColor: AppColors.marsDark,
      ),
      HomeCardConfig(
        icon: Icons.blur_on,
        title: l10n.neows,
        lightColor: AppColors.asteroidsLight,
        darkColor: AppColors.asteroidsDark,
      ),
      HomeCardConfig(
        icon: Icons.public,
        title: l10n.epic,
        lightColor: AppColors.epicLight,
        darkColor: AppColors.epicDark,
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
            backgroundColor: Theme.of(context).primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                l10n.appTitle,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
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
                  final card = cards[index];
                  return HomeCard(
                    title: card.title,
                    icon: Icon(
                      card.icon,
                      color: !isDarkMode ? card.darkColor : card.lightColor,
                    ),
                    iconBackgroundColor: isDarkMode
                        ? card.darkColor
                        : card.lightColor,
                    onTap: () {},
                  );
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
