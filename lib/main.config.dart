// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'common/data/interfaces/i_connection_service.dart' as _i6;
import 'core/network/connection_service.dart' as _i7;
import 'core/network/network_service.dart' as _i3;
import 'core/services/message_service.dart' as _i4;
import 'core/utils/helper/error_handler.dart' as _i5;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.NetworkService>(() => _i3.NetworkService());
  gh.singleton<_i4.MessageService>(() => _i4.MessageService());
  gh.singleton<_i5.ErrorHandler>(() => _i5.ErrorHandler());
  gh.singleton<_i6.IConnectionService>(() => _i7.ConnectionService());
  return getIt;
}
