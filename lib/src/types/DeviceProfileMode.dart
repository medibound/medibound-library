import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeviceProfileMode {
  static const Map<String, Map<String, dynamic>> types = {
    'Production': {
      'code': 'PROD',
      'icon': FontAwesomeIcons.rocket,
      'color': Colors.blue,
      'description': 'Ready for Production'
    },
    'Development': {
      'code': 'DEVM',
      'icon': FontAwesomeIcons.tools,
      'color': Colors.green,
      'description': 'For Development and Education'
    },
  };

  static const Map<String, Map<String, dynamic>> codes = {
    'PROD': {
      'name': 'Production',
      'icon': FontAwesomeIcons.rocket,
      'color': Colors.blue,
      'description': 'Production mode.'
    },
    'DEVM': {
      'name': 'Development',
      'icon': FontAwesomeIcons.tools,
      'color': Colors.green,
      'description': 'Development mode.'
    },
  };
}
