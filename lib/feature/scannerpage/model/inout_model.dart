
import 'dart:convert';

class InOutModel {
  String type;
  DateTime time;
 
  InOutModel({
    required this.type,
    required this.time
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'time': time,
      
    };
  }

  factory InOutModel.fromMap(Map<String, dynamic> map) {
    return InOutModel(
      type: map['type'] ?? '',
      time: map['time'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InOutModel.fromJson(String source) => InOutModel.fromMap(
        json.decode(source),
      );
}