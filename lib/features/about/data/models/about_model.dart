import 'package:fruit_hub/features/about/domain/entites/about_entity.dart';

class AboutModel {
  final String aboutText;

  AboutModel({required this.aboutText});

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(aboutText: json['aboutText']);
  }

  factory AboutModel.fromEntity(AboutEntity aboutEntity) {
    return AboutModel(aboutText: aboutEntity.aboutText);
  }

  Map<String, dynamic> tojson() => {'aboutText': aboutText};

  AboutEntity toEntity() => AboutEntity(aboutText: aboutText);
}
