  part of profilepageview.dart;
  Container _buildNameText(BuildContext context) {
    return Container(
      width: context.width*2/3,
      child: Text(
                                  "${context.read<ProfileCubit>().user?.name}".toUpperCase(),
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(color: Color(0xffEF8052)),
                                ),
    );
  }