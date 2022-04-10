part of profilepageview.dart;

 Container buildOvertimeContainer(BuildContext context, int index) {
    return Container(
      width: context.width,
      height: context.height / 10,
      margin: const EdgeInsets.only(right: 10, top: 10, bottom: 0),
      decoration: _buildDecoration(),
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
                Padding(
                  padding: const EdgeInsets.only(bottom:5.0),
                  child: Text(
                      "${DateFormat('dd/MM').format(context.read<ProfileCubit>().reversedOverTimeList?[index].time)}"),
                ),
                Text(
                  "${context.read<ProfileCubit>().reversedOverTimeList?[index].type} yapıldı".toUpperCase(),
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                  "${DateFormat('HH:MM').format(context.read<ProfileCubit>().reversedOverTimeList?[index].time)}"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  context.read<ProfileCubit>().reversedOverTimeList?[index].type ==
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

 BoxDecoration _buildDecoration() {
   return BoxDecoration(
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
    );
 }