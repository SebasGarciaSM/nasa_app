import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_app/core/services/navigation_service.dart';
import 'package:nasa_app/main/app_routes.dart';
import 'package:nasa_app/ui/modules/apod/apod_page.dart';
import 'package:nasa_app/ui/modules/home/home_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addSingleton(NavigationService.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(AppRoutes.home, child: (_) => HomePage());
    r.child(AppRoutes.apod, child: (_) => ApodPage());
  }
}
