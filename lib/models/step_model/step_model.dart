import 'package:json_annotation/json_annotation.dart';

part 'step_model.g.dart';

@JsonSerializable()
class StepModel {
  final int steps;
  final DateTime date;

  StepModel(this.steps, this.date);

  factory StepModel.fromJson(Map<String, dynamic> json) => _$StepModelFromJson(json);
  Map<String, dynamic> toJson() => _$StepModelToJson(this);
}
