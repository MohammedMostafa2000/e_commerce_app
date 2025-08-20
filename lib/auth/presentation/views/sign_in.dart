import 'package:e_commerce_app/auth/data/data_source_implementation/sign_in_api_implementation.dart';
import 'package:e_commerce_app/auth/data/local/shared_prefs_handler.dart';
import 'package:e_commerce_app/auth/data/remote/api_services.dart';
import 'package:e_commerce_app/auth/data/repository_implementation/sign_in_repository_implementation.dart';
import 'package:e_commerce_app/auth/domain/usecases/sign_in_usecase.dart';
import 'package:e_commerce_app/auth/presentation/viewModels/sign_in_cubit.dart';
import 'package:e_commerce_app/auth/presentation/viewModels/sign_in_state.dart';
import 'package:e_commerce_app/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/auth/presentation/widgets/custom_text_form_field_with_title.dart';
import 'package:e_commerce_app/core/assets_manager.dart';
import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/core/dialog_utils.dart';
import 'package:e_commerce_app/core/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isPasswordSecure = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late SignInCubit signInCubit;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    signInCubit = getIt<SignInCubit>();

    // SignInCubit(
    //   signInUsecase: SignInUsecase(
    //     signInRepositoryContract: SignInRepositoryImplementation(
    //       signInDataSourceContract: SignInApiImplementation(
    //         apiServices: ApiServices(),
    //       ),
    //     ),
    //   ),
    // );
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: signInCubit,
      child: Scaffold(
        backgroundColor: ColorsManager.lightBlue,
        body: SafeArea(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: BlocListener<SignInCubit, SignInState>(
                listener: (context, state) {
                  if (state is SignInLoadingState) {
                    DialogUtils.showLoadingDialog(context: context);
                  } else if (state is SignInSuccessState) {
                    DialogUtils.hideDialog(context: context);
                    DialogUtils.showDialogMessage(
                      context: context,
                      message: state.authResponse.message ?? '',
                      onPressed: () {
                        Navigator.pop(context);
                        if (state.authResponse.message == 'success') {
                          SharedPrefsHandler.storeToken(token: state.authResponse.token!);
                          // SharedPrefsHandler.getToken().then((savedToken) {
                          //   log("Saved Token: $savedToken");
                          // });
                          Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
                        }
                      },
                    );
                  } else if (state is SignInErrorState) {
                    DialogUtils.hideDialog(context: context);
                    DialogUtils.showDialogMessage(
                      context: context,
                      message: state.errorMessage,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    );
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      ImagesManager.routeBrandLogo,
                      height: 72.h,
                      width: 238.w,
                    ),
                    SizedBox(height: 86.h),
                    CustomTextFormFieldWithTitle(
                      controller: emailController,
                      obscureText: false,
                      title: 'E-mail address',
                      textInputType: TextInputType.emailAddress,
                      hintText: 'enter your email address',
                    ),
                    SizedBox(height: 40.h),
                    CustomTextFormFieldWithTitle(
                      controller: passwordController,
                      obscureText: isPasswordSecure,
                      title: 'Password',
                      hintText: 'enter your password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordSecure = !isPasswordSecure;
                          });
                        },
                        icon: Icon(
                          isPasswordSecure ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        buildTextButton(
                          context: context,
                          title: 'Forgot password',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 56.h),
                    CustomElevatedButton(
                      title: 'Login',
                      onPressed: () {
                        signInCubit.login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account? ',
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        buildTextButton(
                          context: context,
                          title: 'Create Account',
                          onPressed: () {
                            Navigator.pushNamed(context, RoutesManager.signUp);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextButton buildTextButton({
    required BuildContext context,
    required String title,
    required void Function()? onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}
