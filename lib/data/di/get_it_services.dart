import 'package:get_it/get_it.dart';
import 'package:kucherbaev_sultan_tz/domain/services/navigator_service.dart';
import 'package:kucherbaev_sultan_tz/domain/services/shared_preferences_service.dart';

class GetItServices {
  final _getIt = GetIt.I;

  NavigatorService get navigatorService => _getIt.get<NavigatorService>();

  SharedPreferencesService get sharedPreferencesService => _getIt.get<SharedPreferencesService>();
}

final getItService = GetItServices();
