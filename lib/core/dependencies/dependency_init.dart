import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../utils/pref_util.dart';
import 'dependency_init.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  usesNullSafety: true,
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)

Future<GetIt> configureDependencies() async{
  // await SharedPrefs.instance.init();
  // getIt.registerSingleton<SharedPrefs>(SharedPrefs.instance);
  return $initGetIt(getIt);
}