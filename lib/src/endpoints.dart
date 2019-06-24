part of tesla;

abstract class TeslaApiEndpoints {
  factory TeslaApiEndpoints.standard() {
    return new TeslaStandardApiEndpoints();
  }

  Uri get ownersApiUrl;
  Uri get teslaApiUl;
  Uri get summonConnectUrl;
  String get clientId;
  String get clientSecret;
  bool get enableProxyMode;
}

class TeslaStandardApiEndpoints implements TeslaApiEndpoints {
  @override
  Uri get ownersApiUrl => Uri.parse("https://owner-api.teslamotors.com/");

  @override
  Uri get teslaApiUl => Uri.parse("https://www.tesla.com/");

  @override
  Uri get summonConnectUrl =>
      Uri.parse("wss://streaming.vn.teslamotors.com/connect/");

  @override
  String get clientId =>
      "81527cff06843c8634fdc09e8ac0abefb46ac849f38fe1e431c2ef2106796384";

  @override
  String get clientSecret =>
      "c7257eb71a564034f9419ee651c7d0e5f7aa6bfbd18bafb5c5c033b093bb2fa3";

  @override
  bool get enableProxyMode => false;
}
