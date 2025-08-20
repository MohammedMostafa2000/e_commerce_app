import 'package:e_commerce_app/auth/data/models/auth_response.dart';

abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {
  final AuthResponse authResponse;
  SignInSuccessState({required this.authResponse});
}

class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState({required this.errorMessage});
}
