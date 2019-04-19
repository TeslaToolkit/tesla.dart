import 'dart:async';
import 'dart:io';

import 'package:tesla/tool.dart';

Future main() async {
  var client = getTeslaClient();

  for (var vehicle in await client.listVehicles()) {
    await vehicle.wake();
    var state = await vehicle.getAllVehicleState();
    print("${state.displayName}:");
    print("  VIN: ${state.vin}");
    print("  State: ${state.state}");
    print("  Software Version: ${state.vehicleState.carVersion}");
    print(
        "  Location: ${state.driveState.latitude} LAT, ${state.driveState.longitude} LONG");
    print("  Tokens: ${state.tokens}");

    if (stdout.hasTerminal) {
      print("  Option Codes");
      var buffer = new StringBuffer();
      var codes = new List<VehicleOptionCode>.from(vehicle.knownOptionCodes);
      while (codes.isNotEmpty) {
        var code = codes.removeAt(0);
        var content = "(${code.code}) ${code.description}";
        if (buffer.length + content.length + 4 >= stdout.terminalColumns) {
          print("    ${buffer.toString()}");
          buffer.clear();
        }

        if (buffer.isNotEmpty) {
          buffer.write(", ");
        }
        buffer.write(content);
      }

      if (buffer.isNotEmpty) {
        print("    ${buffer.toString()}");
      }
    } else {
      print("  Option Codes: ${state.knownOptionCodes}");
    }
  }

  client.close();
}
