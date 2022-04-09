import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:personaltracking/feature/allowingformPage/service/allowingService.dart';

part 'allowing_state.dart';

class AllowingCubit extends Cubit<AllowingState> {
  AllowingCubit() : super(AllowingInitial());


 
  GlobalKey<FormState> formKey=GlobalKey();

    DateTime? startTime;
    DateTimeRange? dateRange;
    TextEditingController reason=TextEditingController();
    FocusNode? reasonFocusNode = FocusNode();
    bool isok=false;

  synchronizeDate(DateTimeRange time){

    dateRange = time;
    emit(AllowingComplete());
  }
    

}
