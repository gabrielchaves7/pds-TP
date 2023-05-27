// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      name: json['name'] as String,
      location: json['location'] as String,
      minSalary: (json['minSalary'] as num).toDouble(),
      maxSalary: (json['maxSalary'] as num).toDouble(),
      contactPhone: json['contactPhone'] as String,
      email: json['email'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'minSalary': instance.minSalary,
      'maxSalary': instance.maxSalary,
      'contactPhone': instance.contactPhone,
      'email': instance.email,
      'description': instance.description,
    };
