import 'package:get_it/get_it.dart';
import '../core/routes/app_router.dart';


final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator.registerSingleton<AppRouter>(AppRouter());
}
