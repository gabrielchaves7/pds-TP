import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  const Company({
    required this.name,
    required this.location,
    required this.minSalary,
    required this.maxSalary,
    required this.contactPhone,
    required this.email,
    required this.description,
  });

  final String name;
  final String location;
  final double minSalary;
  final double maxSalary;
  final String contactPhone;
  final String email;
  final String description;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  /// Connect the generated [_$CompanyToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
