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
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "İzin Formu",
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
        ),
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
                              onTap: () async {
                                final initialDateRange = DateTimeRange(
                                    start: DateTime.now(),
                                    end: DateTime.now().add(Duration(days: 1)));

                                final newDateRange = await showDateRangePicker(
                                  context: context,
                                  firstDate: DateTime(DateTime.now().year - 5),
                                  lastDate: DateTime(DateTime.now().year + 5),
                                  initialDateRange:
                                      context.read<AllowingCubit>().dateRange ??
                                          initialDateRange,
                                );
                                if (newDateRange == null) return;
                                context
                                    .read<AllowingCubit>()
                                    .synchronizeDate(newDateRange);
                              },
                              child: _buildSelectDateRangeButton(context),
                            ),
                            if (context.read<AllowingCubit>().dateRange != null)
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
    );
  }
}
