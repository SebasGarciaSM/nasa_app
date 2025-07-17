import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fullscreen_image_viewer/fullscreen_image_viewer.dart';
import 'package:nasa_app/core/services/navigation_service.dart';
import 'package:nasa_app/l10n/app_localizations.dart';
import 'package:nasa_app/ui/theme/app_colors.dart';

class ApodPage extends StatefulWidget {
  const ApodPage({super.key});

  @override
  State<ApodPage> createState() => _ApodPageState();
}

class _ApodPageState extends State<ApodPage> {
  final nav = Modular.get<NavigationService>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final apod = Hero(
      tag: 'apodHero',
      child: Image.network(
        "https://apod.nasa.gov/apod/image/2507/HebesChasma_esa_960.jpg",
        fit: BoxFit.cover,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            title: Text(l10n.apod),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                elevation: 6.0,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    FullscreenImageViewer.open(
                      context: context,
                      child: apod,
                    );
                  },
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 250.0,
                        color: AppColors.black10,
                        child: apod,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsetsGeometry.all(16.0),
                        //color: Colors.yellow,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [AppColors.transparent, Colors.black87],
                          ),
                        ),
                        child: Text(
                          "Collapse in Hebes Chasma on Mars",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // SliverPadding(
          //   padding: const EdgeInsets.all(16),
          //   sliver: SliverGrid(
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: 10,
          //       mainAxisSpacing: 10,
          //     ),
          //     delegate: SliverChildBuilderDelegate(
          //       (context, index) => Card(
          //         child: Center(child: Text('Item $index')),
          //       ),
          //       childCount: 10,
          //     ),
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.overview,
                        style: textTheme.headlineMedium,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.black10,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(DateTime.now().toString()),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "What's happened in Hebes Chasma on Mars? Hebes Chasma is a depression just north of the enormous Valles Marineris canyon.  Since the depression is unconnected to other surface features, it is unclear where the internal material went. Inside Hebes Chasma is Hebes Mensa, a 5 kilometer high mesa that appears to have undergone an unusual partial collapse -- a collapse that might be providing clues. The featured image, taken by ESA's robotic Mars Express spacecraft currently orbiting Mars, shows great details of the chasm and the unusual horseshoe shaped indentation in the central mesa. Material from the mesa appears to have flowed onto the floor of the chasm, while a possible dark layer appears to have pooled like ink on a downslope landing.  One hypothesis holds that salty rock composes some lower layers in Hebes Chasma, with the salt dissolving in melted ice flows that drained through holes into an underground aquifer.",
                    style: textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
