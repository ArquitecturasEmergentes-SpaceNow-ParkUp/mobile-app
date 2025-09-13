// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:park_up_app/features/auth/data/datasources/auth_local_datasource.dart'
    as _i159;
import 'package:park_up_app/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i984;
import 'package:park_up_app/features/auth/data/repositories/auth_repository_impl.dart'
    as _i772;
import 'package:park_up_app/features/auth/domain/repositories/auth_repository.dart'
    as _i242;
import 'package:park_up_app/features/auth/domain/usecases/login_usecase.dart'
    as _i397;
import 'package:park_up_app/features/auth/domain/usecases/logout_usecase.dart'
    as _i625;
import 'package:park_up_app/features/auth/domain/usecases/register_usecase.dart'
    as _i859;
import 'package:park_up_app/features/auth/presentation/bloc/auth_bloc.dart'
    as _i366;
import 'package:park_up_app/shared/data/datasources/api_client.dart' as _i206;
import 'package:park_up_app/shared/data/datasources/network_info.dart' as _i119;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i206.ApiClient>(() => _i206.ApiClient());
    gh.factory<_i984.AuthRemoteDataSource>(
      () => _i984.AuthRemoteDataSourceImpl(gh<_i206.ApiClient>()),
    );
    gh.factory<_i119.NetworkInfo>(
      () => _i119.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    gh.factory<_i159.AuthLocalDataSource>(
      () => _i159.AuthLocalDataSourceImpl(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i242.AuthRepository>(
      () => _i772.AuthRepositoryImpl(
        gh<_i984.AuthRemoteDataSource>(),
        gh<_i159.AuthLocalDataSource>(),
        gh<_i119.NetworkInfo>(),
      ),
    );
    gh.factory<_i397.LoginUseCase>(
      () => _i397.LoginUseCase(gh<_i242.AuthRepository>()),
    );
    gh.factory<_i625.LogoutUseCase>(
      () => _i625.LogoutUseCase(gh<_i242.AuthRepository>()),
    );
    gh.factory<_i859.RegisterUseCase>(
      () => _i859.RegisterUseCase(gh<_i242.AuthRepository>()),
    );
    gh.factory<_i366.AuthBloc>(
      () => _i366.AuthBloc(
        loginUseCase: gh<_i397.LoginUseCase>(),
        registerUseCase: gh<_i859.RegisterUseCase>(),
        logoutUseCase: gh<_i625.LogoutUseCase>(),
      ),
    );
    return this;
  }
}
