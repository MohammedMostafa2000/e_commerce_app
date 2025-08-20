import 'package:dio/dio.dart';
import 'package:e_commerce_app/auth/domain/usecases/sign_in_usecase.dart';
import 'package:e_commerce_app/auth/presentation/viewModels/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInUsecase signInUsecase;
  @factoryMethod
  SignInCubit({required this.signInUsecase}) : super(SignInInitialState());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(SignInLoadingState());
    try {
      var result = await signInUsecase.invoke(
        email: email,
        password: password,
      );
      if (result.statusMsg == 'fail') {
        emit(SignInErrorState(errorMessage: result.message ?? ''));
      } else {
        emit(SignInSuccessState(authResponse: result));
      }
    } on DioException catch (e) {
      emit(SignInErrorState(errorMessage: e.toString()));
    }
  }
}
