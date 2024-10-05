import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeviceTransferType {
  static const Map<String, Map<String, dynamic>> types = {
    'Live Bluetooth Low Energy': {
      'code': 'LBLE',
      'icon': FontAwesomeIcons.bluetooth,
      'color': Colors.blue,
      'description': 'Real-time Bluetooth Low Energy data transfer.'
    },
    'Static Bluetooth Low Energy': {
      'code': 'SBLE',
      'icon': FontAwesomeIcons.bluetoothB,
      'color': Colors.green,
      'description': 'Static data transfer using Bluetooth Low Energy.'
    },
    'Static NFC': {
      'code': 'SNFC',
      'icon': FontAwesomeIcons.nfcSymbol,
      'color': Colors.orange,
      'description': 'Static data transfer using Near Field Communication.'
    },
  };

  static const Map<String, Map<String, dynamic>> codes = {
    'LBLE': {
      'name': 'Live Bluetooth Low Energy',
      'icon': FontAwesomeIcons.bluetooth,
      'color': Colors.blue,
      'description': 'Real-time Bluetooth Low Energy data transfer.'
    },
    'SBLE': {
      'name': 'Static Bluetooth Low Energy',
      'icon': FontAwesomeIcons.bluetoothB,
      'color': Colors.green,
      'description': 'Static data transfer using Bluetooth Low Energy.'
    },
    'SNFC': {
      'name': 'Static NFC',
      'icon': FontAwesomeIcons.nfcSymbol,
      'color': Colors.orange,
      'description': 'Static data transfer using Near Field Communication.'
    },
  };
}
