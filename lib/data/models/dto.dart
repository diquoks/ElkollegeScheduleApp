import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";

@immutable
abstract class const Dto() {
  Map<String, dynamic> toJson();

  Entity toEntity();
}
