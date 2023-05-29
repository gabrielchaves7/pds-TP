import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

enum UserRole {
  APPLICANT,
  COMPANY,
}

@JsonSerializable()
class NUser {
  const NUser({required this.id, this.username, this.role});

  factory NUser.fromJson(Map<String, dynamic> json) => _$NUserFromJson(json);

  final int id;
  final String? username;
  final UserRole? role;

  static const empty = NUser(id: 0);

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == NUser.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != NUser.empty;

  bool get isCompany => role == UserRole.COMPANY;

  /// Connect the generated [_$NUserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$NUserToJson(this);
}
