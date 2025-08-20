import 'package:e_commerce_app/auth/data/models/auth_response.dart';

abstract class SignUpState {}

class InitialState extends SignUpState {}

class LoadingState extends SignUpState {}

class SuccessState extends SignUpState {
  final AuthResponse authResponse;
  SuccessState({required this.authResponse});
}

class ErrorState extends SignUpState {
  final String errorMessage;
  ErrorState({required this.errorMessage});
}
