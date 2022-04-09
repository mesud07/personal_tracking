library register_view.dart;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kartal/kartal.dart';
import 'package:personaltracking/feature/loginPage/view/login_view.dart';
import 'package:personaltracking/feature/profilepage/view/profilepageview.dart';
import 'package:personaltracking/feature/profilepage/viewmodel/cubit/profile_cubit.dart';

import '../../../core/widgets/customTextFormField.dart';
import '../../../core/widgets/custom_button.dart';
import '../viewmodel/cubit/register_cubit.dart';
part 'parts/buildHaveYouAccount.dart';
part 'parts/buildRegisterButton.dart';
part 'parts/buildRegisterForm.dart';
part 'parts/buildSelectGender.dart';
class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                height: context.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildRegisterForm(context),
                    registerButton(context),
                    SizedBox(height: context.height * 0.05),
                    _buildHaveYouAcount(context),
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


