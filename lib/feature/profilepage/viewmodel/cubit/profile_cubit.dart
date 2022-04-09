import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:personaltracking/feature/profilepage/model/usermodel.dart';
import 'package:personaltracking/feature/profilepage/service/profile_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()){
      init();
  }
  ProfileService _profileService = ProfileService();
  UserModel? user;
  List? reversedList;
   bool isLoading = false;

  init()async{
  changeLoading();
  await getData();
   emit(ProfileComplete(user));
    changeLoading();
  }

  getData()async{
   user =await _profileService.getUser();
  }
  

    void changeLoading() {
    isLoading = !isLoading;
  }
}
