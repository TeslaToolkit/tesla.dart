part of tesla;

class Supercharger implements TeslaObject {
  Supercharger(this.client, this.json);

  @override
  final TeslaClient client;

  @override
  final Map<String, dynamic> json;

  String get addressLine1 => json["address_line_1"];
  String get addressLine2 => json["address_line_2"];
  String get addressNotes => json["address_notes"];
  String get address => json["address"];
  String get amenities => json["amenities"];
}
