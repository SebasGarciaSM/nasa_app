import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_app/main/app_routes.dart';

class NavigationService {
  void pop() => Modular.to.pop();
  void toApod() => Modular.to.pushNamed(AppRoutes.apod);
  void toAsteroids() => Modular.to.pushNamed(AppRoutes.asteroids);
  void toEpic() => Modular.to.pushNamed(AppRoutes.epic);
  void toMars() => Modular.to.pushNamed(AppRoutes.mars);
}
