import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:personaltracking/feature/allowingformPage/service/allowingService.dart';

import '../../../../core/constants/string/allowingpageStrings.dart';
import '../../model/allowingModel.dart';

part 'allowing_state.dart';

class AllowingCubit extends Cubit<AllowingState> {
  AllowingCubit() : super(AllowingInitial());

  GlobalKey<FormState> formKey = GlobalKey();

  DateTime? startTime;
  DateTimeRange? dateRange;
  TextEditingController reason = TextEditingController();
  FocusNode? reasonFocusNode = FocusNode();
  bool isok = false;
   final initialDateRange = DateTimeRange(
        start: DateTime.now(), end: DateTime.now().add(Duration(days: 1)));

  synchronizeDate(DateTimeRange time) {
    dateRange = time;
    emit(AllowingLoading(dateRange: dateRange));
  }

  addRange(BuildContext context) async {
    

    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange,
    );
    if (newDateRange == null) return;
    synchronizeDate(newDateRange);
  }


  sendForm(BuildContext context) async{
                        if (formKey
                                .currentState!
                                .validate() &&
                            dateRange != null) {
                          AllowingService().setToPermission(
                              context,
                              AllowingModel(
                                  startTime:dateRange!
                                      .start,
                                  endTime: dateRange!
                                      .end,
                                  reason: reason
                                      .text,
                                  isok: false));
                        
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(AllowingPageString().snackBar);
                        }
                      }
}
