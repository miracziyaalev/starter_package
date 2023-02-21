import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'resources_model.g.dart';

String _fetchCustom(String data) {
  return "aa";
}

@JsonSerializable()
class ResourcesModel {
  List<Data>? data;

  ResourcesModel({this.data});

  factory ResourcesModel.fromJson(Map<String, dynamic> json) {
    return _$ResourcesModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResourcesModelToJson(this);
  }
}

// gelen veriyi direkt parse ettirebiliyorsun. fieldRename..
@JsonSerializable()
class Data extends Equatable{
  final int? id;
  final String? name;
  final int? year;
  // @JsonKey(name: 'renk')
  final String? color;
  //@JsonKey(fromJson: _fetchCustom)
  final String? pantoneValue;
  final StatusCode? status;

  Data({this.id, this.name, this.year, this.color, this.status, this.pantoneValue});

  int get colorValue {
    var newColor = color?.replaceFirst("#", "0xff") ?? '';
    return int.parse(newColor);
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
  

  // id, name ve year ayniysa benim icin esittir. 
  @override
  // TODO: implement props
  List<Object?> get props => [id, name, year];
}

enum StatusCode {
  @JsonValue(200)
  succes,
  @JsonValue(500)
  weird
}
