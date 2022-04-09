part of login_view.dart;
  CustomButton _buildCustomButton(BuildContext context) {
    return CustomButton(
                      text: 'Giriş',
                      isLoading: false,
                      func: () {
                        if (context
                            .read<LoginCubit>()
                            .formKey
                            .currentState!
                            .validate()) {
                          //ShowLoaderDialog(context, "text");
                            final snackBar = SnackBar(
          content: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Hesap doğru giriniz'),
          ),
          
        );

                          LoginService().signInWithEmailAndPassword(
                              context: context,
                              email: context
                                  .read<LoginCubit>()
                                  .emailController
                                  .text,
                              password: context
                                  .read<LoginCubit>()
                                  .passwordController
                                  .text).onError((error, stackTrace) =>
                               ScaffoldMessenger.of(context).showSnackBar(snackBar));
                        }
                      });
  }
