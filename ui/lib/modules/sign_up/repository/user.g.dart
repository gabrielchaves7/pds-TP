// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NUser _$NUserFromJson(Map<String, dynamic> json) => NUser(
      id: json['id'] as int,
      username: json['username'] as String?,
      role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']),
    );

Map<String, dynamic> _$NUserToJson(NUser instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'role': _$UserRoleEnumMap[instance.role],
    };

const _$UserRoleEnumMap = {
  UserRole.APPLICANT: 'APPLICANT',
  UserRole.COMPANY: 'COMPANY',
};
