import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'NASA App'**
  String get appTitle;

  /// No description provided for @apod.
  ///
  /// In en, this message translates to:
  /// **'APOD (Astronomy Picture of the Day)'**
  String get apod;

  /// No description provided for @marsRoversPhotos.
  ///
  /// In en, this message translates to:
  /// **'Mars Rover Photos'**
  String get marsRoversPhotos;

  /// No description provided for @neows.
  ///
  /// In en, this message translates to:
  /// **'NeoWs (Asteroids)'**
  String get neows;

  /// No description provided for @epic.
  ///
  /// In en, this message translates to:
  /// **'EPIC (Earth Imagery)'**
  String get epic;

  /// No description provided for @donki.
  ///
  /// In en, this message translates to:
  /// **'DONKI (Solar Activity)'**
  String get donki;

  /// No description provided for @techTransfer.
  ///
  /// In en, this message translates to:
  /// **'TechTransfer'**
  String get techTransfer;

  /// No description provided for @imageAndVideoLibrary.
  ///
  /// In en, this message translates to:
  /// **'Image and Video Library'**
  String get imageAndVideoLibrary;

  /// No description provided for @exoplanetArchive.
  ///
  /// In en, this message translates to:
  /// **'Exoplanet Archive'**
  String get exoplanetArchive;

  /// No description provided for @earthAssets.
  ///
  /// In en, this message translates to:
  /// **'Earth Assets'**
  String get earthAssets;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// No description provided for @selectStartDate.
  ///
  /// In en, this message translates to:
  /// **'Select Start Date'**
  String get selectStartDate;

  /// No description provided for @selectEndDate.
  ///
  /// In en, this message translates to:
  /// **'Select End Date'**
  String get selectEndDate;

  /// Number of asteroids found
  ///
  /// In en, this message translates to:
  /// **'{asteroids} asteroids found'**
  String asteroidsFound(int asteroids);

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @hazardous.
  ///
  /// In en, this message translates to:
  /// **'Hazardous'**
  String get hazardous;

  /// Magnitude of the asteroid
  ///
  /// In en, this message translates to:
  /// **'Magnitude: {magnitude}'**
  String magnitude(double magnitude);

  /// Approach Date of the asteroid
  ///
  /// In en, this message translates to:
  /// **'Approach Date: {approachDate}'**
  String approachDate(String approachDate);

  /// Velocity of the asteroid in KpH
  ///
  /// In en, this message translates to:
  /// **'Velocity (KpH): {velocityKph}'**
  String velocityKph(String velocityKph);

  /// Miss Distance of the asteroid in Km
  ///
  /// In en, this message translates to:
  /// **'Miss Distance (Km): {missDistanceKm}'**
  String missDistanceKm(String missDistanceKm);

  /// Shows latitude of earth image
  ///
  /// In en, this message translates to:
  /// **'Latitude: {latitude}'**
  String latitude(double latitude);

  /// Shows longitude of earth image
  ///
  /// In en, this message translates to:
  /// **'Longitude: {longitude}'**
  String longitude(double longitude);

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @pleaseTryAgainWithAnotherDate.
  ///
  /// In en, this message translates to:
  /// **'Please try again with another date'**
  String get pleaseTryAgainWithAnotherDate;

  /// Describes the name of the camera with which the photo was taken
  ///
  /// In en, this message translates to:
  /// **'Camera: {cameraName}'**
  String cameraName(String cameraName);

  /// Describes the date the photo was taken
  ///
  /// In en, this message translates to:
  /// **'Date: {earthDate}'**
  String earthDate(String earthDate);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
