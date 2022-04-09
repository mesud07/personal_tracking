part of allowingpageview.dart;

  Container _buildSelectDateRangeButton(BuildContext context) {
    return Container(
                              height: context.height / 10,
                              width: context.width / 2,
                              decoration: BoxDecoration(
                                  color: context
                                              .read<AllowingCubit>()
                                              .dateRange !=
                                          null
                                      ? AppColors().nightblue
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Tarih Aralığı Seçiniz",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors().white, fontSize: 15),
                                ),
                              ),
                            );
  }