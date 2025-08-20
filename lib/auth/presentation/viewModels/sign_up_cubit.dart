import 'package:dio/dio.dart';
import 'package:e_commerce_app/auth/domain/usecases/sign_up_usecase.dart';
import 'package:e_commerce_app/auth/presentation/viewModels/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  SignUpUsecase signUpUsecase;
  @factoryMethod
  SignUpCubit({required this.signUpUsecase}) : super(InitialState());

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    emit(LoadingState());
    try {
      var result = await signUpUsecase.invoke(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      );
      if (result.statusMsg == 'fail') {
        emit(ErrorState(errorMessage: result.message ?? ''));
      } else {
        emit(SuccessState(authResponse: result));
      }
    } on DioException catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
