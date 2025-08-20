import 'package:e_commerce_app/auth/data/models/auth_response.dart';
import 'package:e_commerce_app/auth/domain/repository_contract/sign_up_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUsecase {
  SignUpRepositoryContract signUpRepositoryContract;
  @factoryMethod
  SignUpUsecase({required this.signUpRepositoryContract});

  Future<AuthResponse> invoke({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) {
    return signUpRepositoryContract.signUp(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
  }
}
