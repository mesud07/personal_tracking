 part of register_view.dart;
 InkWell _buildHaveYouAcount(BuildContext context) {
    return InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/loginPage', (route) => false);
                    },
                    child: Text(
                      'Hesabın var mı? Giriş ',
                      style: context.textTheme.bodyMedium,
                    ),
                  );
  }