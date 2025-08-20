import 'package:e_commerce_app/auth/data/data_source_implementation/sign_up_api_implementation.dart';
import 'package:e_commerce_app/auth/data/remote/api_services.dart';
import 'package:e_commerce_app/auth/data/repository_implementation/sign_up_repository_implementation.dart';
import 'package:e_commerce_app/auth/domain/usecases/sign_up_usecase.dart';
import 'package:e_commerce_app/auth/presentation/viewModels/sign_up_cubit.dart';
import 'package:e_commerce_app/auth/presentation/viewModels/sign_up_state.dart';
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

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

bool isPasswordSecure = true;
bool isRePasswordSecure = true;
late TextEditingController nameController;
late TextEditingController mobileNumberController;
late TextEditingController emailController;
late TextEditingController passwordController;
late TextEditingController rePasswordController;
late SignUpCubit signUpCubit;

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    nameController = TextEditingController();
    mobileNumberController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    signUpCubit = getIt<SignUpCubit>();

    // SignUpCubit(
    //   signUpUsecase: SignUpUsecase(
    //     signUpRepositoryContract: SignUpRepositoryImplementation(
    //       signUpDataSourceContract: SignUpApiImplementation(
    //         apiServices: ApiServices(),
    //       ),
    //     ),
    //   ),
    // );
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: signUpCubit,
      child: Scaffold(
        backgroundColor: ColorsManager.lightBlue,
        body: SafeArea(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: BlocListener<SignUpCubit, SignUpState>(
                listener: (context, state) async {
                  if (state is LoadingState) {
                    DialogUtils.showLoadingDialog(context: context);
                  } else if (state is SuccessState) {
                    DialogUtils.hideDialog(context: context);
                    DialogUtils.showDialogMessage(
                      context: context,
                      message: state.authResponse.message ?? '',
                      onPressed: () {
                        Navigator.pop(context);
                        if (state.authResponse.message == 'success') {
                          Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
                        }
                      },
                    );
                  } else if (state is ErrorState) {
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
                    SizedBox(height: 24.h),
                    CustomTextFormFieldWithTitle(
                      controller: nameController,
                      obscureText: false,
                      title: 'Full Name',
                      textInputType: TextInputType.name,
                      hintText: 'enter your full name',
                    ),
                    SizedBox(height: 24.h),
                    CustomTextFormFieldWithTitle(
                      controller: mobileNumberController,
                      obscureText: false,
                      title: 'Mobile Number',
                      textInputType: TextInputType.number,
                      hintText: 'enter your mobile no.',
                    ),
                    SizedBox(height: 24.h),
                    CustomTextFormFieldWithTitle(
                      obscureText: false,
                      title: 'E-mail address',
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      hintText: 'enter your email address',
                    ),
                    SizedBox(height: 24.h),
                    CustomTextFormFieldWithTitle(
                      obscureText: isPasswordSecure,
                      title: 'Password',
                      controller: passwordController,
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
                    SizedBox(height: 24.h),
                    CustomTextFormFieldWithTitle(
                      obscureText: isRePasswordSecure,
                      controller: rePasswordController,
                      title: 'Re Password',
                      hintText: 'enter your password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isRePasswordSecure = !isRePasswordSecure;
                            });
                          },
                          icon: Icon(
                            isRePasswordSecure ? Icons.visibility_off : Icons.visibility,
                          )),
                    ),
                    SizedBox(height: 35.h),
                    CustomElevatedButton(
                      title: 'Sign up',
                      onPressed: () {
                        signUpCubit.register(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            rePassword: rePasswordController.text,
                            phone: mobileNumberController.text);
                      },
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
}
