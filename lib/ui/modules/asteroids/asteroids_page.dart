import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_app/core/state_status.dart';
import 'package:nasa_app/l10n/app_localizations.dart';
import 'package:nasa_app/ui/modules/asteroids/viewmodels/asteroids_view_model.dart';
import 'package:nasa_app/ui/modules/asteroids/widgets/asteroid_data_container.dart';
import 'package:nasa_app/ui/modules/asteroids/widgets/date_picker_field.dart';
import 'package:nasa_app/ui/theme/app_colors.dart';
import 'package:nasa_app/ui/widgets/error_lottie.dart';
import 'package:nasa_app/ui/widgets/loading_lottie.dart';

class AsteroidsPage extends StatefulWidget {
  const AsteroidsPage({super.key});

  @override
  State<AsteroidsPage> createState() => _AsteroidsPageState();
}

class _AsteroidsPageState extends State<AsteroidsPage> {
  Future<void> _selectDate(
    BuildContext context,
    String helpText,
    void Function(DateTime) onDateSelected,
  ) async {
    final DateTime today = DateTime.now();
    final DateTime sevenDaysAgo = today.subtract(const Duration(days: 7));

    final picked = await showDatePicker(
      context: context,
      helpText: helpText,
      initialDate: DateTime.now(),
      firstDate: sevenDaysAgo,
      lastDate: today,
    );

    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final vm = context.watch<AsteroidsViewModel>();
    final textTheme = Theme.of(context).textTheme;

    Widget buildInitial() => const SizedBox();

    Widget buildLoading() => const Center(child: LoadingLottie());

    Widget buildError() => ErrorLottie(
      errorMessage: vm.error,
      onTap: vm.loadAsteroids,
    );

    Widget buildContent() {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              l10n.asteroidsFound(vm.asteroids!.length),
              style: textTheme.headlineSmall,
            ),
          ),
          Divider(height: 1.0),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              shrinkWrap: true,
              itemCount: vm.asteroids!.length,
              separatorBuilder: (context, index) => SizedBox(height: 12.0),
              itemBuilder: (context, index) {
                final asteroid = vm.asteroids![index];
                return AsteroidDataContainer(asteroid: asteroid);
              },
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: AppColors.transparent,
        title: Text(l10n.neows),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: DatePickerField(
                            label: l10n.startDate,
                            value: vm.formattedStart,
                            onTap: () => _selectDate(
                              context,
                              l10n.selectStartDate,
                              vm.setStartDate,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: DatePickerField(
                            label: l10n.endDate,
                            value: vm.formattedEnd,
                            onTap: () => _selectDate(
                              context,
                              l10n.selectEndDate,
                              vm.setEndDate,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    FilledButton(
                      onPressed: vm.loadAsteroids,
                      child: Text(l10n.confirm),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
