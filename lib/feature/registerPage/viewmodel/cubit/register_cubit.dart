import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


import '../../../profilepage/view/profilepageview.dart';
import '../../service/register_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  bool isLoading = false;
  bool isRegisterFail = false;
  GlobalKey<FormState> formKey = GlobalKey();
  RegisterService registerService = RegisterService();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController workNameController = TextEditingController();
  bool ismen=false;
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode workNameFocus=FocusNode();
  String error="";

  void register(BuildContext context) async{
    if (formKey.currentState!.validate()) {
      changeLoading();
      if (nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
       error= await registerService
            .signUp(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          workName: workNameController.text,
          ismen:ismen
        )
            .catchError((e) {
          emit(RegisterFailure(error: e.toString()));
        });
      }
      if (isRegisterFail == false) {
        registerSuccess(context);
      } else {
        changeLoading();
      }
    }
  }

  void changeLoading() {
    isLoading = !isLoading;
    emit(RegisterLoading(isLoading: isLoading));
  }

  void changeGender(bool ismen){
    this.ismen=ismen;
    emit(RegisterInitial());
  }

  void changeError() {
    isRegisterFail = true;
    emit(RegisterFailure(error: 'Kayıt işlemi başarısız'));
  }

  void registerSuccess(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/profilePage', (route) => false);
  }
}




/*
 .then((value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePageView()),
          (route) => false,
        );
      }).catchError((error) {
        print(error);
      });*/