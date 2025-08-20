// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../auth/data/data_source_contract/sign_in_data_source_contract.dart'
    as _i490;
import '../../auth/data/data_source_contract/signup_data_source_contract.dart'
    as _i828;
import '../../auth/data/data_source_implementation/sign_in_api_implementation.dart'
    as _i476;
import '../../auth/data/data_source_implementation/sign_up_api_implementation.dart'
    as _i976;
import '../../auth/data/remote/api_services.dart' as _i962;
import '../../auth/data/repository_implementation/sign_in_repository_implementation.dart'
    as _i726;
import '../../auth/data/repository_implementation/sign_up_repository_implementation.dart'
    as _i154;
import '../../auth/domain/repository_contract/sign_in_repository_contract.dart'
    as _i173;
import '../../auth/domain/repository_contract/sign_up_repository_contract.dart'
    as _i61;
import '../../auth/domain/usecases/sign_in_usecase.dart' as _i519;
import '../../auth/domain/usecases/sign_up_usecase.dart' as _i576;
import '../../auth/presentation/viewModels/sign_in_cubit.dart' as _i402;
import '../../auth/presentation/viewModels/sign_up_cubit.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i962.ApiServices>(() => _i962.ApiServices());
    gh.factory<_i828.SignUpDataSourceContract>(() =>
        _i976.SignUpApiImplementation(apiServices: gh<_i962.ApiServices>()));
    gh.factory<_i490.SignInDataSourceContract>(() =>
        _i476.SignInApiImplementation(apiServices: gh<_i962.ApiServices>()));
    gh.factory<_i173.SignInRepositoryContract>(() =>
        _i726.SignInRepositoryImplementation(
            signInDataSourceContract: gh<_i490.SignInDataSourceContract>()));
    gh.factory<_i61.SignUpRepositoryContract>(() =>
        _i154.SignUpRepositoryImplementation(
            signUpDataSourceContract: gh<_i828.SignUpDataSourceContract>()));
    gh.factory<_i576.SignUpUsecase>(() => _i576.SignUpUsecase(
        signUpRepositoryContract: gh<_i61.SignUpRepositoryContract>()));
    gh.factory<_i519.SignInUsecase>(() => _i519.SignInUsecase(
        signInRepositoryContract: gh<_i173.SignInRepositoryContract>()));
    gh.factory<_i1047.SignUpCubit>(
        () => _i1047.SignUpCubit(signUpUsecase: gh<_i576.SignUpUsecase>()));
    gh.factory<_i402.SignInCubit>(
        () => _i402.SignInCubit(signInUsecase: gh<_i519.SignInUsecase>()));
    return this;
  }
}
