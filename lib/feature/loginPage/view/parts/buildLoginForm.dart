  part of login_view.dart;

  Form _buildLoginForm(BuildContext context) {
    return Form(
                    key: context.read<LoginCubit>().formKey,
                    child: Padding(
                      padding: context.horizontalPaddingLow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AuthTextField(
                            controller:
                                context.read<LoginCubit>().emailController,
                            hintText: "email",
                            isObsecure: false,
                            node: FocusNode(),
                            validator:  MultiValidator([
                                RequiredValidator(
                                    errorText: 'email is required'),
                                EmailValidator(
                                    errorText: 'please correct email')
                              ]),
                            changeObscureCallBack: () {},
                          ),
                          AuthTextField(
                            controller:
                                context.read<LoginCubit>().passwordController,
                            hintText: "Password",
                            node: FocusNode(),
                            isObsecure: true,
                            validator: MultiValidator([RequiredValidator(
                                errorText: 'password is required'),
                                MinLengthValidator(8,
                                  errorText:
                                      'password must be at least 8 digits long'),]),
                            changeObscureCallBack: () {
                              context.read<LoginCubit>().changeObsecure();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
  }
