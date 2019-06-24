import 'dart:async';

import 'package:tesla/tool.dart';

Future main() async {
  var client = getTeslaClient();
  for (var vehicle in await client.listVehicles()) {
    print("Vehicle ${vehicle.displayName} is ${vehicle.state}");
  }
  for (var supercharger in await client.listSuperchargers()) {
    print("Vehicle ${supercharger.address}");
  }
}
