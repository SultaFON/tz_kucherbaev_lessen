import 'package:get_it/get_it.dart';
import 'package:kucherbaev_sultan_tz/domain/services/navigator_service.dart';
import 'package:kucherbaev_sultan_tz/domain/services/shared_preferens_service.dart';

class GetItServis {
  final _getIt = GetIt.I;

  NavigatorService get navigatorService => _getIt.get<NavigatorService>();

  SharedPreferensService get sharedPreferensService => _getIt.get<SharedPreferensService>();
}

final getItService = GetItServis();
