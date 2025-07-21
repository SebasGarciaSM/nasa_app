import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_app/core/services/navigation_service.dart';
import 'package:nasa_app/data/repositories_impl/apod_repository_impl.dart';
import 'package:nasa_app/data/repositories_impl/asteroids_repository_impl.dart';
import 'package:nasa_app/data/repositories_impl/epic_repository_impl.dart';
import 'package:nasa_app/domain/repositories/apod_repository.dart';
import 'package:nasa_app/domain/repositories/asteroids_repository.dart';
import 'package:nasa_app/domain/repositories/epic_repository.dart';
import 'package:nasa_app/domain/use_cases/fetch_apod_use_case.dart';
import 'package:nasa_app/domain/use_cases/fetch_asteroids_use_case.dart';
import 'package:nasa_app/domain/use_cases/fetch_epic_use_case.dart';
import 'package:nasa_app/main/app_routes.dart';
import 'package:nasa_app/ui/modules/apod/apod_page.dart';
import 'package:nasa_app/ui/modules/apod/viewmodels/apod_view_model.dart';
import 'package:nasa_app/ui/modules/asteroids/asteroids_page.dart';
import 'package:nasa_app/ui/modules/asteroids/viewmodels/asteroids_view_model.dart';
import 'package:nasa_app/ui/modules/epic/epic_page.dart';
import 'package:nasa_app/ui/modules/epic/viewmodels/epic_view_model.dart';
import 'package:nasa_app/ui/modules/home/home_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addSingleton(NavigationService.new);

    // APOD
    i.addLazySingleton<ApodRepository>(ApodRepositoryImpl.new);
    i.addLazySingleton(() => FetchApodUseCase(i()));
    i.addLazySingleton(() => ApodViewModel(i()));

    //Asteroids
    i.addLazySingleton<AsteroidsRepository>(AsteroidsRepositoryImpl.new);
    i.addLazySingleton(() => FetchAsteroidsUseCase(i()));
    i.addLazySingleton(() => AsteroidsViewModel(i()));

    //EPIC
    i.addLazySingleton<EpicRepository>(EpicRepositoryImpl.new);
    i.addLazySingleton(() => FetchEpicUseCase(i()));
    i.addLazySingleton(() => EpicViewModel(i()));
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(AppRoutes.home, child: (_) => HomePage());
    r.child(AppRoutes.apod, child: (_) => ApodPage());
    r.child(AppRoutes.asteroids, child: (_) => AsteroidsPage());
    r.child(AppRoutes.epic, child: (_) => EpicPage());
  }
}
