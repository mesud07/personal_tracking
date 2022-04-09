part of allowingpageview.dart;


  Container _buildShowDateRangeContainer(BuildContext context) {
    return Container(
                              padding: context.paddingMedium,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '${DateFormat('MM/dd/yyyy').format(context.read<AllowingCubit>().dateRange!.start)}',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Icon(
                                    Icons.arrow_circle_right,
                                    color: AppColors().red,
                                    size: 40,
                                  ),
                                  Text(
                                      '${DateFormat('MM/dd/yyyy').format(context.read<AllowingCubit>().dateRange!.end)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                ],
                              ),
                            );
  }