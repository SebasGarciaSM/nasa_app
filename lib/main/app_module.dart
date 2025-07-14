import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_app/ui/pages/home_page.dart';
import 'package:nasa_app/ui/pages/second_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/', child: (_) => HomePage());
    r.child('/secondPage', child: (_) => SecondPage());
  }
}
