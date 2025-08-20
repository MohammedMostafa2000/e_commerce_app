import 'package:e_commerce_app/auth/data/data_source_contract/signup_data_source_contract.dart';
import 'package:e_commerce_app/auth/data/models/auth_response.dart';
import 'package:e_commerce_app/auth/data/remote/api_services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpDataSourceContract)
class SignUpApiImplementation extends SignUpDataSourceContract {
  ApiServices apiServices;
  @factoryMethod
  SignUpApiImplementation({required this.apiServices});
  @override
  Future<AuthResponse> signUp(
      {required String name,
      required String email,
      required String password,
      required String rePassword,
      required String phone}) {
    return apiServices.register(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
  }
}
