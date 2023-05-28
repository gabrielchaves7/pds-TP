import 'package:json_annotation/json_annotation.dart';
import 'package:premium_todo/modules/home/widgets/required_experience_filter.dart';

part 'job.g.dart';

@JsonSerializable()
class Job {
  const Job({
    required this.name,
    required this.location,
    required this.minSalary,
    required this.maxSalary,
    required this.contactPhone,
    required this.email,
    required this.description,
    required this.companyId,
    this.companyName,
    required this.experience,
    this.imageUrl,
    this.date,
  });

  final String name;
  final String? companyName;
  final int? companyId;
  final String location;
  final double minSalary;
  final double maxSalary;
  final String contactPhone;
  final String email;
  final String description;
  final String? imageUrl;
  final RequiredExperienceFilter experience;
  final DateTime? date;

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  /// Connect the generated [_$JobToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$JobToJson(this);
}
