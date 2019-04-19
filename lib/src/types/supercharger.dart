part of tesla;

class Supercharger implements TeslaObject {
  Supercharger(this.client, this.json);

  @override
  final TeslaClient client;

  @override
  final Map<String, dynamic> json;

  String get id => json["location_id"];
  String get title => json["title"];
  List<String> get type =>
      json["location_type"] == null ? [] : List.from(json["location_type"]);
  String get addressLine1 => json["address_line_1"];
  String get addressLine2 => json["address_line_2"];
  String get city => json["city"];
  String get country => json["country"];
  String get postalCode => json["postal_code"];
  String get provinceState => json["province_state"];
  String get region => json["region"];
  String get subRegion => json["sub_region"];
  String get addressNotes => json["address_notes"];
  String get address => json["address"];
  String get amenities => json["amenities"];
  num get baiduLat => num.tryParse(json["baidu_lat"]);
  num get baiduLng => num.tryParse(json["baidu_lng"]);
  String get chargers => json["chargers"];
  String get destinationChargerLogo => json["destination_charger_logo"];
  String get destinationWebsite => json["destination_website"];
  String get directionsLink => json["directions_link"];
  List<String> get emails =>
      json["emails"] == null ? [] : List.from(json["emails"]);
  String get geocode => json["geocode"];
  String get hours => json["hours"];
  bool get isGallery => json["is_gallery"];
  num get kioskPinX => num.tryParse(json["kiosk_pin_x"]);
  num get kioskPinY => num.tryParse(json["kiosk_pin_y"]);
  num get zoomKioskPinX => num.tryParse(json["kiosk_zoom_pin_x"]);
  num get zoomKioskPinY => num.tryParse(json["kiosk_zoom_pin_y"]);
  num get latitude => num.tryParse(json["latitude"]);
  num get longitude => num.tryParse(json["longitude"]);
  num get nid => num.tryParse(json["nid"]);
  num get openSoon => num.tryParse(json["open_soon"]);
  String get path => json["path"];
  String get trtId => json["trt_id"];
  bool get isSalesRepresentative => json["sales_representative"];
  List<SalesPhone> get salesPhone => json["sales_phone"] == null
      ? []
      : List.from(json["sales_phone"])
          .map((p) => SalesPhone(client, p))
          .toList();
}

class SalesPhone implements TeslaObject {
  SalesPhone(this.client, this.json);

  @override
  final TeslaClient client;

  @override
  final Map<String, dynamic> json;

  String get label => json["label"];
  String get number => json["number"];
  String get line_below => json["line_below"];
}
