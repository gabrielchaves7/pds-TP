// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      name: json['name'] as String,
      location: json['location'] as String,
      minSalary: (json['minSalary'] as num).toDouble(),
      maxSalary: (json['maxSalary'] as num).toDouble(),
      contactPhone: json['contactPhone'] as String,
      email: json['email'] as String,
      description: json['description'] as String,
      companyId: json['companyId'] as int?,
      companyName: json['companyName'] as String?,
      experience:
          $enumDecode(_$RequiredExperienceFilterEnumMap, json['experience']),
      imageUrl: json['imageUrl'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'name': instance.name,
      'companyName': instance.companyName,
      'companyId': instance.companyId,
      'location': instance.location,
      'minSalary': instance.minSalary,
      'maxSalary': instance.maxSalary,
      'contactPhone': instance.contactPhone,
      'email': instance.email,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'experience': _$RequiredExperienceFilterEnumMap[instance.experience]!,
      'date': instance.date?.toIso8601String(),
    };

const _$RequiredExperienceFilterEnumMap = {
  RequiredExperienceFilter.ALL: 'ALL',
  RequiredExperienceFilter.entryLevel: 'entryLevel',
  RequiredExperienceFilter.midSeniorLevel: 'midSeniorLevel',
};
