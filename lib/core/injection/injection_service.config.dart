// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:travel_nepal/core/services/jwt_token_decoder_service.dart'
    as _i5;
import 'package:travel_nepal/core/services/local_storage.dart' as _i3;
import 'package:travel_nepal/core/services/toast_services.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.LocalStorageService>(() => _i3.LocalStorageService());
    gh.lazySingleton<_i4.ToastService>(() => _i4.ToastService());
    gh.lazySingleton<_i5.JwtTokenDecoderService>(
        () => _i5.JwtTokenDecoderService(gh<_i3.LocalStorageService>()));
    return this;
  }
}
