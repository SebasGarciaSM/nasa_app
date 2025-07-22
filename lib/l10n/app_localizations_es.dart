// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'App de la NASA';

  @override
  String get apod => 'APOD (Imagen Astronómica del Día)';

  @override
  String get marsRoversPhotos => 'Fotos del rover de Marte';

  @override
  String get neows => 'NeoWs (Asteroides)';

  @override
  String get epic => 'EPIC (Imágenes de la Tierra)';

  @override
  String get donki => 'DONKI (Actividad Solar)';

  @override
  String get techTransfer => 'Transferencia Tecnológica';

  @override
  String get imageAndVideoLibrary => 'Biblioteca de imágenes y videos';

  @override
  String get exoplanetArchive => 'Archivo de exoplanetas';

  @override
  String get earthAssets => 'Recursos de la Tierra';

  @override
  String get overview => 'Descripción';

  @override
  String get startDate => 'Fecha Inicial';

  @override
  String get endDate => 'Fecha Final';

  @override
  String get selectStartDate => 'Selecciona Fecha Inicial';

  @override
  String get selectEndDate => 'Selecciona Fecha Final';

  @override
  String asteroidsFound(int asteroids) {
    return '$asteroids asteroides encontrados';
  }

  @override
  String get confirm => 'Confirmar';

  @override
  String get hazardous => 'Peligroso';

  @override
  String magnitude(double magnitude) {
    return 'Magnitude: $magnitude';
  }

  @override
  String approachDate(String approachDate) {
    return 'Fecha de aproximación: $approachDate';
  }

  @override
  String velocityKph(String velocityKph) {
    return 'Velocidad (KpH): $velocityKph';
  }

  @override
  String missDistanceKm(String missDistanceKm) {
    return 'Distancia de paso (Km): $missDistanceKm';
  }

  @override
  String latitude(double latitude) {
    return 'Latitud: $latitude';
  }

  @override
  String longitude(double longitude) {
    return 'Longitud: $longitude';
  }

  @override
  String get retry => 'Reintentar';

  @override
  String get error => 'Error';

  @override
  String get selectDate => 'Selecciona Fecha';

  @override
  String get noResults => 'Sin Resultados';
}
