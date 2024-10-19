// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'common/data/interfaces/i_connection_service.dart' as _i5;
import 'core/network/connection_service.dart' as _i6;
import 'core/network/network_service.dart' as _i7;
import 'core/services/message_service.dart' as _i3;
import 'core/utils/helper/error_handler.dart' as _i4;
import 'features/login/data/repositories/login_repository.dart' as _i8;
import 'features/login/domain/repositories/login_repository_impl.dart' as _i9;
import 'features/login/presentation/cubit/login_cubit.dart' as _i10;

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
  gh.singleton<_i3.MessageService>(() => _i3.MessageService());
  gh.singleton<_i4.ErrorHandler>(() => _i4.ErrorHandler());
  gh.singleton<_i5.IConnectionService>(() => _i6.ConnectionService());
  gh.singleton<_i7.NetworkService>(() =>
      _i7.NetworkService(connectionService: gh<_i5.IConnectionService>()));
  gh.factory<_i8.LoginRepository>(
      () => _i9.LoginRepositoryImpl(networkService: gh<_i7.NetworkService>()));
  gh.factory<_i10.LoginCubit>(
      () => _i10.LoginCubit(loginRepository: gh<_i8.LoginRepository>()));
  return getIt;
}
