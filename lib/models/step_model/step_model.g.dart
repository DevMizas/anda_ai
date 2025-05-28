// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepModel _$StepModelFromJson(Map<String, dynamic> json) => StepModel(
      (json['steps'] as num).toInt(),
      DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$StepModelToJson(StepModel instance) => <String, dynamic>{
      'steps': instance.steps,
      'date': instance.date.toIso8601String(),
    };
