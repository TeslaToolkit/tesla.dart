/// Tesla API Client
///
/// ```
/// import 'package:tesla/tesla.dart';
///
/// /// List all vehicles on your account.
/// listTeslaVehicles() async {
///   // Create a Tesla client with an account username and password.
///   var client = new TeslaClient("elon@tesla.com", "BoredElonMusk");
///
///   // List all of the vehicles on this account.
///   for (var vehicle in await client.listVehicles()) {
///     // Print the name of the vehicle and its current state.
///     print("Vehicle ${vehicle.displayName} is ${vehicle.state}");
///   }
/// }
/// ```
library tesla;

import 'dart:async';

import 'src/impl/unsupported.dart'
    if (dart.library.html) 'src/impl/browser.dart'
    if (dart.library.io) 'src/impl/io.dart';

part 'src/client.dart';
part 'src/token.dart';
part 'src/endpoints.dart';

part 'src/vehicle/summon.dart';
part 'src/vehicle/option_codes.dart';

part 'src/types/object.dart';
part 'src/types/vehicle.dart';
part 'src/types/all_vehicle_state.dart';
part 'src/types/charge_state.dart';
part 'src/types/climate_state.dart';
part 'src/types/drive_state.dart';
part 'src/types/gui_settings.dart';
part 'src/types/media_state.dart';
part 'src/types/speed_limit_mode.dart';
part 'src/types/seat_heater.dart';
part 'src/types/vehicle_state.dart';
part 'src/types/supercharger.dart';
