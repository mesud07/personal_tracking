  part of profilepageview.dart;
  Container _buildTabbarView(BuildContext context, TabController _tabController) {
    return Container(
                          //mar: const EdgeInsets.only(left: 10),
                          height: context.height / 2,
                          width: context.width,

                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              ListView.builder(
                                  padding: EdgeInsets.only(
                                    left: 8,
                                    bottom: 10
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: context
                                      .read<ProfileCubit>()
                                      .reversedOverTimeList?.length,
                                  itemBuilder: (context, index) {
                                    return buildOvertimeContainer(context, index);
                                  }),

                              ListView.builder(
                                 padding:const EdgeInsets.only(
                                    left: 8,
                                    bottom: 10
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: context
                                      .read<ProfileCubit>()
                                      .reversedAllowingList?.length,
                                  itemBuilder: (_, index) {
                                    AllowingModel model = context
                                        .read<ProfileCubit>()
                                        .reversedAllowingList?[index];
                                    return _buildPermissionStatus(context, model);
                                  }),
                            ],
                          ),
                        );
  }

  Container _buildTabbarMenu(TabController _tabController) {
    return Container(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TabBar(
                              controller: _tabController,
                              labelColor: Color(0xff013B75),
                              tabs: [
                                Tab(
                                  text: ProfilePageStrings.overtimeTrackingText,
                                ),
                                Tab(text: ProfilePageStrings.permissionStatus),
                              ],
                            ),
                          ),
                        );
  }