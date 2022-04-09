import 'package:personaltracking/feature/allowingformPage/model/allowingModel.dart';

class UserModel {
  String? name;
  String? email;
  int? inoutNumber;
  String? workName;
  bool? ismen;
  List<dynamic>? allowingList;
  List<dynamic>? mesaiTakibi;
 
  UserModel({
    required this.name,
    required this.email,
    required this.inoutNumber,
    required this.workName,
    required this.ismen,
    required this.allowingList,
    required this.mesaiTakibi,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    inoutNumber = json["inoutnumber"];
    workName = json['workName'];
    ismen=json['ismen'];
    allowingList=List.generate(json['allowingList']?.length??0, (index) => AllowingModel.fromJson(json['allowingList'][index]));
    mesaiTakibi = List.generate(json['mesaiTakibi']?.length ?? 0, (index) => MesaiModel.fromJson(json['mesaiTakibi'][index]));
   
}


}
class MesaiModel{
  DateTime? time;
  String? type;
  MesaiModel({required this.time,required this.type});

  MesaiModel.fromJson(Map<String, dynamic> json) {
    time = json["time"].toDate();
    type = json["type"];
   
}
}