import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_app/core/services/navigation_service.dart';
import 'package:nasa_app/data/repositories_impl/apod_repository_impl.dart';
import 'package:nasa_app/data/repositories_impl/asteroids_repository_impl.dart';
import 'package:nasa_app/domain/repositories/apod_repository.dart';
import 'package:nasa_app/domain/repositories/asteroids_repository.dart';
import 'package:nasa_app/domain/use_cases/fetch_apod_use_case.dart';
import 'package:nasa_app/domain/use_cases/fetch_asteroids_use_case.dart';
import 'package:nasa_app/main/app_routes.dart';
import 'package:nasa_app/ui/modules/apod/apod_page.dart';
import 'package:nasa_app/ui/modules/apod/viewmodels/apod_view_model.dart';
import 'package:nasa_app/ui/modules/asteroids/asteroids_page.dart';
import 'package:nasa_app/ui/modules/asteroids/viewmodels/asteroids_view_model.dart';
import 'package:nasa_app/ui/modules/home/home_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addSingleton(NavigationService.new);
    i.addLazySingleton<ApodRepository>(ApodRepositoryImpl.new);
    i.addLazySingleton(() => FetchApodUseCase(i()));
    i.addLazySingleton(() => ApodViewModel(i()));
    i.addLazySingleton<AsteroidsRepository>(AsteroidsRepositoryImpl.new);
    i.addLazySingleton(() => FetchAsteroidsUseCase(i()));
    i.addLazySingleton(() => AsteroidsViewModel(i()));
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(AppRoutes.home, child: (_) => HomePage());
    r.child(AppRoutes.apod, child: (_) => ApodPage());
    r.child(AppRoutes.asteroids, child: (_) => AsteroidsPage());
  }
}
