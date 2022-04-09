part of allowingpageview.dart;

 Padding _buildReasonText(BuildContext context) {
    return Padding(
                            padding: EdgeInsets.only(
                                left: context.width / 25,
                                right: context.width / 25,
                                bottom: context.height / 100,
                                top: context.height / 100),
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              focusNode: context
                                  .read<AllowingCubit>()
                                  .reasonFocusNode,
                              controller:
                                  context.read<AllowingCubit>().reason,
                              validator: RequiredValidator(
                                  errorText: "Lütfen açıklama giriniz"),
                              decoration: InputDecoration(
                                fillColor: AppColors().bleachedsilk,
                                border: OutlineInputBorder(
                                  borderSide:
                                      Divider.createBorderSide(context),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors().red,
                                  ),
                                  borderRadius: context.normalBorderRadius,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      Divider.createBorderSide(context),
                                ),
                                hintText:
                                    "İzin almanızın sebebini açıklayabilir misiniz?",
                                hintStyle:
                                    Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          );
  }
