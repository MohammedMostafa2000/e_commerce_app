import 'package:e_commerce_app/auth/data/data_source_contract/signup_data_source_contract.dart';
import 'package:e_commerce_app/auth/data/models/auth_response.dart';
import 'package:e_commerce_app/auth/domain/repository_contract/sign_up_repository_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpRepositoryContract)
class SignUpRepositoryImplementation extends SignUpRepositoryContract {
  SignUpDataSourceContract signUpDataSourceContract;
  @factoryMethod
  SignUpRepositoryImplementation({required this.signUpDataSourceContract});
  @override
  Future<AuthResponse> signUp(
      {required String name,
      required String email,
      required String password,
      required String rePassword,
      required String phone}) {
    return signUpDataSourceContract.signUp(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
  }
}
