 part of profilepageview.dart;
 
 Container _buildPermissionStatus(BuildContext context, AllowingModel model) {
    return Container(
                                      width: context.width,
                                      height: context.height / 10,
                                      margin: const EdgeInsets.only(
                                          right: 10, top: 10, bottom: 0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${DateFormat('MM/dd').format(model.startTime!)} - ${DateFormat('MM/dd').format(model.endTime!)}'),
                                                Text(
                                                  model.isok!
                                                      ? "İzin Verildi"
                                                      : "Bekleniyor",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              model.isok!
                                                  ? ProfilePageStrings.inAsset
                                                  : ProfilePageStrings.waiting,
                                              height: context.height / 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
  }
