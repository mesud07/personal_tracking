  part of profilepageview.dart;
  Text _buildNameText(BuildContext context) {
    return Text(
                                "${context.read<ProfileCubit>().user?.name}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(color: Color(0xffEF8052)),
                              );
  }