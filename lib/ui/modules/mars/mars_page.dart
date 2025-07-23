import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fullscreen_image_viewer/fullscreen_image_viewer.dart';
import 'package:nasa_app/core/state_status.dart';
import 'package:nasa_app/l10n/app_localizations.dart';
import 'package:nasa_app/ui/modules/asteroids/widgets/date_picker_field.dart';
import 'package:nasa_app/ui/modules/mars/viewmodels/mars_view_model.dart';
import 'package:nasa_app/ui/modules/mars/widgets/mars_photo_card.dart';
import 'package:nasa_app/ui/widgets/error_lottie.dart';
import 'package:nasa_app/ui/widgets/loading_lottie.dart';
import 'package:nasa_app/ui/widgets/no_data_found_lottie.dart';

class MarsPage extends StatefulWidget {
  const MarsPage({super.key});

  @override
  State<MarsPage> createState() => _MarsPageState();
}

class _MarsPageState extends State<MarsPage> {
  Future<void> _selectDate(
    BuildContext context,
    void Function(String) onSelected,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2012, 8, 6),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      onSelected(picked.toIso8601String().split('T').first);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MarsViewModel>();
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    Widget buildInitial() => SizedBox();

    Widget buildLoading() => Center(child: LoadingLottie());

    Widget buildError() => ErrorLottie(
      errorMessage: vm.error,
      onTap: () => vm.loadMarsPhotos(vm.formattedDate),
    );

    Widget buildContent() {
      if (vm.marsPhotos.isEmpty) {
        return NoDataFoundLottie();
      } else {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          itemCount: vm.marsPhotos.length,
          separatorBuilder: (_, index) => const SizedBox(height: 16.0),
          itemBuilder: (_, index) {
            final marsPhoto = vm.marsPhotos[index];

            final marsPhotoHero = Hero(
              tag: marsPhoto.id,
              child: Image.network(
                marsPhoto.imgSrc,
                loadingBuilder: (_, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            );

            return MarsPhotoCard(
              marsPhoto: marsPhoto,
              marsPhotoHero: marsPhotoHero,
              onTap: () {
                FullscreenImageViewer.open(
                  context: context,
                  child: marsPhotoHero,
                );
              },
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(l10n.marsRoversPhotos),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    DatePickerField(
                      label: l10n.selectDate,
                      value: vm.formattedDate,
                      onTap: () => _selectDate(context, vm.loadMarsPhotos),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(height: 1.0, thickness: 1.0),
          Expanded(
            child: switch (vm.status) {
              StateStatus.initial => buildInitial(),
              StateStatus.loading => buildLoading(),
              StateStatus.completed => buildContent(),
              StateStatus.error => buildError(),
            },
          ),
        ],
      ),
    );
  }
}
