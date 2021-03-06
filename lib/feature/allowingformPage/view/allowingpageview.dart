library allowingpageview.dart;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:personaltracking/feature/allowingformPage/model/allowingModel.dart';
import 'package:personaltracking/feature/allowingformPage/viewmodel/cubit/allowing_cubit.dart';

import '../../../core/appColor/color_theme.dart';
import '../../../core/widgets/custom_button.dart';
import '../../profilepage/view/profilepageview.dart';
import '../service/allowingService.dart';

part 'parts/buildReasonButton.dart';
part 'parts/buildSelectDateRangeButton.dart';
part 'parts/buildSendButton.dart';
part 'parts/buildShowDateRange..dart';

class AllowingPageView extends StatelessWidget {
  const AllowingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllowingCubit(),
      child: WillPopScope(
         onWillPop:(){
        Navigator.pushNamedAndRemoveUntil(context, "/profilePage", (route) => false);
        return Future.value(false);
      },
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: BlocConsumer<AllowingCubit, AllowingState>(
            listener: (context, state) {},
            builder: (context, state) {
              return SingleChildScrollView(
                child: Container(
                  height: context.height,
                  padding: EdgeInsets.only(bottom: context.height / 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: context.read<AllowingCubit>().formKey,
                        child: Padding(
                          padding: context.horizontalPaddingLow,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: ()=>context.read<AllowingCubit>().addRange(context),
                                child: _buildSelectDateRangeButton(context),
                              ),
                             // if (context.read<AllowingCubit>().dateRange != null)
                               if(state is AllowingLoading)
                                _buildShowDateRangeContainer(context),
                              _buildReasonText(context)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: context.height * 0.02),
                      _buildSendButton(context),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "??zin Formu",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => ProfilePage()),
                (route) => false),
          ),
          centerTitle: true,
        );
  }
}
