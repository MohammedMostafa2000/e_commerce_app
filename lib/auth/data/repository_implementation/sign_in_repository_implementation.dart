import 'package:e_commerce_app/auth/data/data_source_contract/sign_in_data_source_contract.dart';
import 'package:e_commerce_app/auth/data/models/auth_response.dart';
import 'package:e_commerce_app/auth/domain/repository_contract/sign_in_repository_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignInRepositoryContract)
class SignInRepositoryImplementation extends SignInRepositoryContract {
  SignInDataSourceContract signInDataSourceContract;
  @factoryMethod
  SignInRepositoryImplementation({required this.signInDataSourceContract});
  @override
  Future<AuthResponse> signIn({required String email, required String password}) {
    return signInDataSourceContract.signIn(email: email, password: password);
  }
}
