 part of profilepageview.dart;
 Container _buildWorkNameText(BuildContext context) {
    return Container(
      width: context.width/2,
      child: Text(
                                  "${context.read<ProfileCubit>().user?.workName}".toUpperCase(),
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(color: Colors.white,fontSize: 16),
                                ),
    );
  }