abstract class TokenState {}

class TokenInitialState extends TokenState {}

class TokenLoadingState extends TokenState {}

class TokenSuccessState extends TokenState {
  final String token;
  TokenSuccessState({required this.token});
}

class TokenErrorState extends TokenState {
  final String errorMessage;
  TokenErrorState({required this.errorMessage});
}
