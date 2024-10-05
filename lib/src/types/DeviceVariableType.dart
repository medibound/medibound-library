import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeviceVariableType {
  static const Map<String, Map<String, dynamic>> types = {
    /*'Decimal Array': {
      'code': 'ADEC',
      'name': 'Array Decimal Value',
      'icon': FontAwesomeIcons.hashtag,
      'color': Colors.purple,
      'description': 'Decimals with single spaces in between.'
    },*/
    'Characteristic': {
      'code': 'STRG',
      'icon': FontAwesomeIcons.font,
      'color': Colors.blue,
      'description': 'String value.'
    },
    'Number': {
      'code': 'DECM',
      'icon': FontAwesomeIcons.hashtag,
      'color': Colors.green,
      'description': 'Decimal value.'
    },
  };

  static const Map<String, Map<String, dynamic>> codes = {
    /*'ADEC': {
      'name': 'Number Array',
      'icon': FontAwesomeIcons.hashtag,
      'color': Colors.purple,
      'description': 'Decimals with single spaces in between.'
    },*/
    'STRG': {
      'name': 'Characterisitic',
      'icon': FontAwesomeIcons.font,
      'color': Colors.blue,
      'description': 'String value'
    },
    'DECM': {
      'name': 'Number',
      'icon': FontAwesomeIcons.hashtag,
      'color': Colors.green,
      'description': 'Decimal value'
    },
  };
}
