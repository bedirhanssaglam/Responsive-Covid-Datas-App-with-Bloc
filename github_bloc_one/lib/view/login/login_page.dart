import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_bloc_one/core/components/custom_app_bar.dart';
import 'package:github_bloc_one/core/components/custom_button.dart';
import 'package:github_bloc_one/core/components/custom_scaffold.dart';
import 'package:github_bloc_one/core/components/custom_text_form_field.dart';
import 'package:github_bloc_one/core/constants/app_constants.dart';
import 'package:github_bloc_one/core/extensions/empty_padding.dart';
import 'package:github_bloc_one/core/extensions/image_path.dart';
import 'package:sizer/sizer.dart';
import '../../core/components/custom_text.dart';
import 'bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/login_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc loginBloc;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc(
      LoginModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scrolling: true,
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('menuu'.toSvg, height: 3.5.h),
        ),
      ),
      body: BlocProvider(
        create: (_) => loginBloc,
        child: Column(
          children: [
            5.h.ph,
            Image.asset(
              'covid_icon_2'.toPng,
              height: 22.h,
              width: 32.w,
            ),
            1.h.ph,
            CustomText(
              text: 'Welcome to Covid Counter',
              textStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const CustomText(
              text: 'Please login with your informations.',
              textStyle: TextStyle(color: AppConstants.grey),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  7.h.ph,
                  CustomTextFormField(
                    controller: emailController,
                    hintText: 'example@gmail.com',
                    suffixIconData: Icons.mail,
                    keyboardType: TextInputType.emailAddress,
                    fillColor: AppConstants.lightOrange,
                  ),
                  2.h.ph,
                  CustomTextFormField(
                    controller: passwordController,
                    isPassword: true,
                    hintText: '********',
                    suffixIconData: Icons.lock,
                    fillColor: AppConstants.lightOrange,
                  ),
                  9.h.ph,
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return CustomButton(
                          width: 60.w,
                          height: 6.5.h,
                          child: const CustomText(text: 'LOGIN'),
                          press: () {
                            context.read<LoginBloc>().add(LoginSubmitted(
                                  emailController.text,
                                  passwordController.text,
                                  context,
                                ));
                          });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
