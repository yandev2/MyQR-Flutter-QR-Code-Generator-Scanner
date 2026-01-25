import 'dart:convert';
import 'dart:typed_data';

class RecentModel {
  int? id;
  String? data;
  String? title;
  String? type;
  String? color;
  String? action;
  Uint8List? icon;

  RecentModel({this.id, this.data, this.title, this.type, this.color, this.action, this.icon});

  RecentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    title = json['title'];
    type = json['type'];
    color = json['color'];
    action = json['action'];
    icon = json['icon'] != null
        ? Uint8List.fromList(List<int>.from(jsonDecode(json['icon'])))
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['data'] = data;
    data['title'] = title;
    data['type'] = type;
    data['color'] = color;
    data['action'] = action;
    data['icon'] = icon != null ? jsonEncode(icon) : null;
    return data;
  }
}
