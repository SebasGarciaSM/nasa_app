import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fullscreen_image_viewer/fullscreen_image_viewer.dart';
import 'package:nasa_app/core/state_status.dart';
import 'package:nasa_app/core/utils/epic_image_url_builder.dart';
import 'package:nasa_app/l10n/app_localizations.dart';
import 'package:nasa_app/ui/modules/epic/viewmodels/epic_view_model.dart';
import 'package:nasa_app/ui/theme/app_colors.dart';
import 'package:nasa_app/ui/widgets/loading_lottie.dart';

class EpicPage extends StatefulWidget {
  const EpicPage({super.key});

  @override
  State<EpicPage> createState() => _EpicPageState();
}

class _EpicPageState extends State<EpicPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EpicViewModel>().loadEpics();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<EpicViewModel>();
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    Widget buildInitial() => const SizedBox();

    Widget buildLoading() => const Center(
      child: LoadingLottie(),
    );

    Widget buildError() => Center(
      child: Text('Error'),
    );

    Widget buildContent() {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: vm.epics.length,
        itemBuilder: (_, index) {
          final epic = vm.epics[index];

          final imageUrl = EpicImageUrlBuilder.buildImageUrl(
            epic.date,
            epic.image,
          );

          final epicImage = Hero(
            tag: epic.identifier,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const SizedBox(
                  height: 200.0,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          );

          return Card(
            elevation: 6.0,
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: InkWell(
              onTap: () {
                FullscreenImageViewer.open(
                  context: this.context,
                  child: epicImage,
                );
              },
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: AppColors.black10,
                    child: epicImage,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          vm.formattedDateWithTimezone(epic.date),
                          style: textTheme.labelSmall,
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          epic.caption,
                          style: textTheme.bodySmall,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          l10n.latitude(epic.latitude),
                          style: textTheme.bodySmall,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          l10n.latitude(epic.longitude),
                          style: textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(l10n.epic),
      ),
      body: switch (vm.status) {
        StateStatus.initial => buildInitial(),
        StateStatus.loading => buildLoading(),
        StateStatus.completed => buildContent(),
        StateStatus.error => buildError(),
      },
    );
  }
}
