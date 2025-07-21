// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'NASA App';

  @override
  String get apod => 'APOD (Astronomy Picture of the Day)';

  @override
  String get marsRoversPhotos => 'Mars Rover Photos';

  @override
  String get neows => 'NeoWs (Asteroids)';

  @override
  String get epic => 'EPIC (Earth Imagery)';

  @override
  String get donki => 'DONKI (Solar Activity)';

  @override
  String get techTransfer => 'TechTransfer';

  @override
  String get imageAndVideoLibrary => 'Image and Video Library';

  @override
  String get exoplanetArchive => 'Exoplanet Archive';

  @override
  String get earthAssets => 'Earth Assets';

  @override
  String get overview => 'Overview';

  @override
  String get startDate => 'Start Date';

  @override
  String get endDate => 'End Date';

  @override
  String get selectStartDate => 'Select Start Date';

  @override
  String get selectEndDate => 'Select End Date';

  @override
  String asteroidsFound(int asteroids) {
    return '$asteroids asteroids found';
  }

  @override
  String get confirm => 'Confirm';

  @override
  String error(String errorMessage) {
    return 'Error: $errorMessage';
  }

  @override
  String get hazardous => 'Hazardous';

  @override
  String magnitude(double magnitude) {
    return 'Magnitude: $magnitude';
  }

  @override
  String approachDate(String approachDate) {
    return 'Approach Date: $approachDate';
  }

  @override
  String velocityKph(String velocityKph) {
    return 'Velocity (KpH): $velocityKph';
  }

  @override
  String missDistanceKm(String missDistanceKm) {
    return 'Miss Distance (Km): $missDistanceKm';
  }

  @override
  String latitude(double latitude) {
    return 'Latitude: $latitude';
  }

  @override
  String longitude(double longitude) {
    return 'Longitude: $longitude';
  }
}
