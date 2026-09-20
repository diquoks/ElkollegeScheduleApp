import "package:json_annotation/json_annotation.dart";

class const PocketbaseDateTimeConverter()
    implements JsonConverter<DateTime, String> {
  @override
  DateTime fromJson(String json) => .parse(json);

  @override
  String toJson(DateTime object) => object.toString();
}
