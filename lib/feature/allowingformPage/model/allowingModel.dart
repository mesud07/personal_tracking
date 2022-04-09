class AllowingModel{

  DateTime? startTime;
  DateTime? endTime;
  String? reason;
  bool? isok;

  AllowingModel({required this.startTime,required this.endTime,required this.reason,required this.isok});

  AllowingModel.fromJson(Map<String, dynamic> json) {
    startTime = json["startTime"].toDate();
    endTime = json["endTime"].toDate();
    reason = json["reason"];
    isok = json['isok'];
   
}

  Map<String, dynamic> toMap() {
    return {
      'startTime': startTime,
      'endTime': endTime,
      'reason': reason,
      'isok': isok
    };
  }


}