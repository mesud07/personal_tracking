library login_view.dart;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/string/loginpageStrings.dart';
import '../../../core/widgets/customTextFormField.dart';
import '../../../core/widgets/custom_button.dart';
import '../service/login_service.dart';
import '../viewmodel/cubit/login_cubit.dart';

part 'parts/buildLoginImage.dart';
part 'parts/buildCustomButton.dart';
part 'parts/buildGoRegisterButton.dart';
part 'parts/buildLoginForm.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                height: context.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLoginImage(context),
                    _buildLoginForm(context),
                    SizedBox(height: context.height * 0.02),
                    _buildCustomButton(context),
                    SizedBox(height: context.height * 0.05),
                    _buildGoRegisterButton(context),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
