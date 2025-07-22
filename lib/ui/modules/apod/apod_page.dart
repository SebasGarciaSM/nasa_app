import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fullscreen_image_viewer/fullscreen_image_viewer.dart';
import 'package:nasa_app/core/services/navigation_service.dart';
import 'package:nasa_app/l10n/app_localizations.dart';
import 'package:nasa_app/ui/modules/apod/viewmodels/apod_view_model.dart';
import 'package:nasa_app/ui/theme/app_colors.dart';
import 'package:nasa_app/ui/widgets/error_lottie.dart';
import 'package:nasa_app/ui/widgets/loading_lottie.dart';

class ApodPage extends StatefulWidget {
  const ApodPage({super.key});

  @override
  State<ApodPage> createState() => _ApodPageState();
}

class _ApodPageState extends State<ApodPage> {
  final nav = Modular.get<NavigationService>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ApodViewModel>().loadApod();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ApodViewModel>();

    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    Widget buildInitial() => const SliverToBoxAdapter(child: SizedBox());

    Widget buildLoading() => const SliverFillRemaining(
      child: Center(child: LoadingLottie()),
    );

    Widget buildError(String? error, VoidCallback onRetry) =>
        SliverFillRemaining(
          child: ErrorLottie(
            errorMessage: error,
            onTap: onRetry,
          ),
        );

    Widget buildContent(ApodViewModel vm) {
      final apod = Hero(
        tag: 'apodHero',
        child: Image.network(
          vm.apod!.imageUrl,
          fit: BoxFit.cover,
        ),
      );

      return SliverToBoxAdapter(
        child: Column(
          children: [
            Padding(
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
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [AppColors.transparent, Colors.black87],
                          ),
                        ),
                        child: Text(
                          vm.apod!.title,
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
            Container(
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
                        child: Text(vm.apod!.date),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    vm.apod!.explanation,
                    style: textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            title: Text(l10n.apod),
            forceMaterialTransparency: true,
          ),
          switch (vm.status) {
            ApodStateStatus.initial => buildInitial(),
            ApodStateStatus.loading => buildLoading(),
            ApodStateStatus.error => buildError(vm.error, vm.loadApod),
            ApodStateStatus.completed => buildContent(vm),
          },
        ],
      ),
    );
  }
}
