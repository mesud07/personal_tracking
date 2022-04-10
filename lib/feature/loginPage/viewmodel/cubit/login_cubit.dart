import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/string/loginpageStrings.dart';
import '../../service/login_service.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {


  LoginCubit() : super(LoginInitial());

  
  LoginService? loginService;
  // bool isLoginFail = false;
  bool isLoading = false;
  bool passObsecure=false;
   GlobalKey<FormState> formKey=GlobalKey();

   TextEditingController emailController=TextEditingController();
   TextEditingController passwordController=TextEditingController();

   
  // Future<void> login() async {
  //   if (formKey.currentState?.validate()??false) {
  //     changeLoading();
  //     try {
  //       await loginService?.signInWithEmailAndPassword(
          
  //         emailController.text,
  //         passwordController.text,
  //       );
  //       emit(LoginSuccess());
  //     } catch (e) {
  //       emit(LoginFailure(error: e.toString()));
  //     }
  //   }else{
  //     print("null abi");
  //   }
  // }

            login(BuildContext context)async {
                        if (
                            formKey
                            .currentState!
                            .validate()) {
                              changeLoading();
                             
                        await  LoginService().signInWithEmailAndPassword(
                              context: context,
                              email: emailController.text,
                              password:passwordController.text)
                              .onError((error, stackTrace) =>
                               ScaffoldMessenger.of(context).showSnackBar(LoginPageString().snackBar));
                               changeLoading();
                               }
                        }

  void changeLoading() {
    isLoading = !isLoading;
    emit(LoginLoading(isLoading: isLoading));
  }


  void changeObsecure() {
    passObsecure = !passObsecure;
  }
}
