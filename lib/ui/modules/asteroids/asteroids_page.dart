import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_app/l10n/app_localizations.dart';
import 'package:nasa_app/ui/modules/asteroids/viewmodels/asteroids_view_model.dart';
import 'package:nasa_app/ui/modules/asteroids/widgets/date_picker_field.dart';
import 'package:nasa_app/ui/theme/app_colors.dart';

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
    final picked = await showDatePicker(
      context: context,
      helpText: helpText,
      initialDate: DateTime.now(),
      firstDate: DateTime(1995),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final vm = context.watch<AsteroidsViewModel>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.transparent,
            title: Text(l10n.neows),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Submit"),
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
