part of allowingpageview.dart;
  CustomButton _buildSendButton(BuildContext context) {
    return CustomButton(
                      text: 'Formu Gönder',
                      isloading: false,
                      func: ()=>context.read<AllowingCubit>().sendForm(context), );
  }
