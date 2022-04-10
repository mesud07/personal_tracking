part of login_view.dart;

 InkWell _buildGoRegisterButton(BuildContext context) {
    return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/registerPage');
                    },
                    child: Text(
                      'Hesabın yok mu? Kayıt ol ',
                      style: context.textTheme.bodyMedium,
                    ),
                  );
  }