import 'package:e_commerce_app/auth/data/local/shared_prefs_handler.dart';
import 'package:e_commerce_app/core/token_cubit/token_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TokenCubit extends Cubit<TokenState> {
  TokenCubit() : super(TokenInitialState());
  Future<void> getToken() async {
    emit(TokenInitialState());
    try {
      final token = await SharedPrefsHandler.getToken();
      emit(TokenSuccessState(token: token));
    } catch (e) {
      emit(TokenErrorState(errorMessage: e.toString()));
    }
  }
}
