import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_app/main/app_routes.dart';

class NavigationService {
  void toApod() => Modular.to.pushNamed(AppRoutes.apod);
}
