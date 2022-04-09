part of allowingpageview.dart;
  CustomButton _buildSendButton(BuildContext context) {
    return CustomButton(
                      text: 'Formu Gönder',
                      isLoading: false,
                      func: () {
                        if (context
                                .read<AllowingCubit>()
                                .formKey
                                .currentState!
                                .validate() &&
                            context.read<AllowingCubit>().dateRange != null) {
                          AllowingService().setToPermission(
                              context,
                              AllowingModel(
                                  startTime: context
                                      .read<AllowingCubit>()
                                      .dateRange!
                                      .start,
                                  endTime: context
                                      .read<AllowingCubit>()
                                      .dateRange!
                                      .end,
                                  reason: context
                                      .read<AllowingCubit>()
                                      .reason
                                      .text,
                                  isok: false));
                          //ShowLoaderDialog(context, "text");

                        } else {
                          final snackBar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                  'Lütfen tarih aralığı girdiğinizden emin olunuz'),
                            ),
                          );

                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar);
                        }
                      });
  }
