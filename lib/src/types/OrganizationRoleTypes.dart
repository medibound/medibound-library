import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrganizationRole {
  static const Map<String, Map<String, dynamic>> roles = {
    'Invited': {'code': 'invited', 'icon': FontAwesomeIcons.userPlus, 'color': Colors.grey},
    'Member': {'code': 'member', 'icon': FontAwesomeIcons.user, 'color': Colors.blue},
    'Admin': {'code': 'admin', 'icon': FontAwesomeIcons.userShield, 'color': Colors.green},
    'Owner': {'code': 'owner', 'icon': FontAwesomeIcons.crown, 'color': Colors.red},
  };

  static const Map<String, Map<String, dynamic>> codes = {
    'invited': {'name': 'Invited', 'icon': FontAwesomeIcons.userPlus, 'color': Colors.grey},
    'member': {'name': 'Member', 'icon': FontAwesomeIcons.user, 'color': Colors.blue},
    'admin': {'name': 'Admin', 'icon': FontAwesomeIcons.userShield, 'color': Colors.green},
    'owner': {'name': 'Owner', 'icon': FontAwesomeIcons.crown, 'color': Colors.red},
  };
}