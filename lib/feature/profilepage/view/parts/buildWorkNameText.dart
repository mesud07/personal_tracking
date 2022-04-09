 part of profilepageview.dart;
 Text _buildWorkNameText(BuildContext context) {
    return Text(
                                "${context.read<ProfileCubit>().user?.workName}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(color: Colors.white),
                              );
  }