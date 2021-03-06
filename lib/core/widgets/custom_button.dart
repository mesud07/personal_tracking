import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personaltracking/feature/loginPage/viewmodel/cubit/login_cubit.dart';

import '../appColor/color_theme.dart';

class CustomButton extends StatefulWidget {
  late String text;

  final VoidCallback func;
  bool isloading;
  late Color color;
  CustomButton({
    Key? key,
    required this.text,
    required this.isloading,
    required this.func,
  }) : super(key: key) {
    color = AppColors().red;
  }

  CustomButton.googleSignIn({Key? key, required this.func,required this.isloading}) : super(key: key) {
    text = "Google ile Giriş";
    color = AppColors().nightblue;
  }

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    
        return GestureDetector(
          onTap: widget.func,
          child: Container(
            decoration: BoxDecoration(
                color: widget.color, borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width * 0.83,
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top) *
                0.0662,
            child: (widget.isloading)
                ?Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                      width: MediaQuery.of(context).size.height * 0.035,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ): Center(
                    child: Text(
                    widget.text,
                    style: TextStyle(color: AppColors().white, fontSize: 20),
                  ))
                
          ),
        );
     
  }
}
