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
      companyName: json['companyName'] as String?,
      experience:
          $enumDecode(_$RequiredExperienceFilterEnumMap, json['experience']),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'name': instance.name,
      'companyName': instance.companyName,
      'location': instance.location,
      'minSalary': instance.minSalary,
      'maxSalary': instance.maxSalary,
      'contactPhone': instance.contactPhone,
      'email': instance.email,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'experience': _$RequiredExperienceFilterEnumMap[instance.experience]!,
    };

const _$RequiredExperienceFilterEnumMap = {
  RequiredExperienceFilter.ALL: 'ALL',
  RequiredExperienceFilter.entryLevel: 'entryLevel',
  RequiredExperienceFilter.midSeniorLevel: 'midSeniorLevel',
};
