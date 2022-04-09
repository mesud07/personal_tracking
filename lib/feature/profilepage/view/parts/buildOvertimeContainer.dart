part of profilepageview.dart;

 Container buildOvertimeContainer(BuildContext context, int index) {
    return Container(
      width: context.width,
      height: context.height / 10,
      margin: const EdgeInsets.only(right: 10, top: 10, bottom: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "${DateFormat('dd/MM').format(context.read<ProfileCubit>().user?.mesaiTakibi?[index].time)}"),
                Text(
                  "${context.read<ProfileCubit>().user?.mesaiTakibi?[index].type} yapıldı",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                  "${context.read<ProfileCubit>().user?.mesaiTakibi?[index].time.hour.toString()}:${context.read<ProfileCubit>().user?.mesaiTakibi?[index].time.minute.toString()}"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  context.read<ProfileCubit>().user?.mesaiTakibi?[index].type ==
                          "giriş"
                      ? ProfilePageStrings.inAsset
                      : ProfilePageStrings.outAsset,
                  height: context.height / 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }