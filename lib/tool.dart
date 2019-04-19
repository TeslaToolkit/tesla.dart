library tesla.tool;

import 'dart:io';
import 'dart:convert';

import 'tesla.dart';
export 'tesla.dart';

const List<String> _emailEnvVars = const <String>[
  "TESLA_EMAIL",
  "TESLA_USERNAME",
  "TESLA_USER"
];

const List<String> _passwordEnvVars = const <String>[
  "TESLA_PASSWORD",
  "TESLA_PASS",
  "TESLA_PWD"
];

String _getEnvKey(List<String> possible) {
  for (var key in possible) {
    var dartEnvValue = new String.fromEnvironment(key);
    if (dartEnvValue != null) {
      return dartEnvValue;
    }

    if (Platform.environment.containsKey(key) &&
        Platform.environment[key].isNotEmpty) {
      return Platform.environment[key];
    }
  }

  throw new Exception(
      "Expected environment variable '${possible.first}' to be present.");
}

TeslaClient getTeslaClient(
    {String teslaUsername,
    String teslaPassword,
    TeslaApiEndpoints endpoints}) {
  var email = teslaUsername ?? _getEnvKey(_emailEnvVars).trim();
  var password = teslaPassword ?? _getEnvKey(_passwordEnvVars);

  if (password.startsWith("base64:")) {
    password =
        const Utf8Decoder().convert(const Base64Decoder().convert(password, 7));
  }

  if (password.endsWith("\n")) {
    password = password.substring(0, password.length - 1);
  }

  return new TeslaClient(email, password, endpoints: endpoints);
}
