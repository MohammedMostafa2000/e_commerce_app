import 'package:e_commerce_app/auth/data/models/auth_response.dart';
import 'package:e_commerce_app/auth/domain/repository_contract/sign_in_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUsecase {
  SignInRepositoryContract signInRepositoryContract;
  @factoryMethod
  SignInUsecase({required this.signInRepositoryContract});
  Future<AuthResponse> invoke({
    required String email,
    required String password,
  }) {
    return signInRepositoryContract.signIn(email: email, password: password);
  }
}
