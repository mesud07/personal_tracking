part of login_view.dart;
  CustomButton _buildCustomButton(BuildContext context) {
    return CustomButton(
                      text: 'Giriş',
                      func: ()=>context.read<LoginCubit>().login(context),
                       isloading: context.read<LoginCubit>().isLoading,);
  }
