import 'package:e_commerce_app/auth/data/data_source_contract/sign_in_data_source_contract.dart';
import 'package:e_commerce_app/auth/data/models/auth_response.dart';
import 'package:e_commerce_app/auth/data/remote/api_services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignInDataSourceContract)
class SignInApiImplementation extends SignInDataSourceContract {
  ApiServices apiServices;
  @factoryMethod
  SignInApiImplementation({required this.apiServices});
  @override
  Future<AuthResponse> signIn({required String email, required String password}) {
    return apiServices.login(email: email, password: password);
  }
}
