library profilepageview.dart;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:personaltracking/core/constants/string/profilePateStrings.dart';
import 'package:personaltracking/core/widgets/custom_button.dart';
import 'package:personaltracking/feature/allowingformPage/view/allowingpageview.dart';
import 'package:personaltracking/feature/profilepage/viewmodel/cubit/profile_cubit.dart';
import 'package:personaltracking/feature/scannerpage/view/scannerpage.dart';
import '../../allowingformPage/model/allowingModel.dart';

part 'parts/buildAvatarImage.dart';
part 'parts/buildNameText.dart';
part 'parts/buildOvertimeContainer.dart';
part 'parts/buildPermissionContainer.dart';
part 'parts/buildPermissionStatus.dart';
part 'parts/buildQRBotton.dart';
part 'parts/buildTabbarContent.dart';
part 'parts/buildWorkNameText.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: context.read<ProfileCubit>().isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      height: context.height,
                      //color: Color(0xffEF8052),

                      child: SingleChildScrollView(
                        child: Column(children: [
                          Container(
                            //height: context.height * 1.1 / 2,
                            width: double.infinity,
                            padding:
                                const EdgeInsets.only(bottom: 20, left: 15),
                            decoration: topContainerDecoration(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: context.height / 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildAvatarImage(context),
                                    _buildQRCodeButton(context),
                                  ],
                                ),
                               
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [
                                         _buildNameText(context),
                                if (context
                                        .read<ProfileCubit>()
                                        .user
                                        ?.workName !=
                                    null)
                                        _buildWorkNameText(context),
                                        
                                      ],
                                    ),
                                  ),
                                _buildPermissionContainer(context),
                              ],
                            ),
                          ),

                          //Orta buton

                          _buildTabbarMenu(_tabController),

                          _buildTabbarView(context, _tabController),
                        ]),
                      ),
                    ));
        },
      ),
    );
  }

  BoxDecoration topContainerDecoration() {
    return const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xff013B75),
                                  Color(0xff013B75)
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                          );
  }
}
