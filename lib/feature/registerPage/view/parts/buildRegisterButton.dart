 part of register_view.dart;
  Widget registerButton(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return CustomButton(
            text: 'Kayıt Ol',
            isLoading: false,
            func: () {
              context.read<RegisterCubit>().register(context);
            },
          );
        });
  }