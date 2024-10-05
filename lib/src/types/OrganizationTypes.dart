import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrganizationType {
  static const Map<String, Map<String, dynamic>> types = {
    'Manufacturer': {'code': 'OT01', 'icon': FontAwesomeIcons.industry, 'color': Colors.blue},
    'Software Developer': {'code': 'OT02', 'icon': FontAwesomeIcons.laptopCode, 'color': Colors.green},
    'Health and Wellness': {'code': 'OT03', 'icon': FontAwesomeIcons.heartbeat, 'color': Colors.red},
    'Fitness and Sports': {'code': 'OT04', 'icon': FontAwesomeIcons.dumbbell, 'color': Colors.orange},
    'Research and Development': {'code': 'OT05', 'icon': FontAwesomeIcons.flask, 'color': Colors.purple},
    'Security and Privacy': {'code': 'OT06', 'icon': FontAwesomeIcons.shopLock, 'color': Colors.brown},
    'Fashion and Design': {'code': 'OT07', 'icon': FontAwesomeIcons.tshirt, 'color': Colors.pink},
    'Retail and Distribution': {'code': 'OT08', 'icon': FontAwesomeIcons.shoppingCart, 'color': Colors.yellow},
    'Education': {'code': 'OT09', 'icon': FontAwesomeIcons.graduationCap, 'color': Colors.teal},
  };

  static const Map<String, Map<String, dynamic>> codes = {
  'OT01': {'name': 'Manufacturer', 'icon': FontAwesomeIcons.industry, 'color': Colors.blue},
  'OT02': {'name': 'Software Developer', 'icon': FontAwesomeIcons.laptopCode, 'color': Colors.green},
  'OT03': {'name': 'Health and Wellness', 'icon': FontAwesomeIcons.heartbeat, 'color': Colors.red},
  'OT04': {'name': 'Fitness and Sports', 'icon': FontAwesomeIcons.dumbbell, 'color': Colors.orange},
  'OT05': {'name': 'Research and Development', 'icon': FontAwesomeIcons.flask, 'color': Colors.purple},
  'OT06': {'name': 'Security and Privacy', 'icon': FontAwesomeIcons.shopLock, 'color': Colors.brown},
  'OT07': {'name': 'Fashion and Design', 'icon': FontAwesomeIcons.tshirt, 'color': Colors.pink},
  'OT08': {'name': 'Retail and Distribution', 'icon': FontAwesomeIcons.shoppingCart, 'color': Colors.yellow},
  'OT09': {'name': 'Education', 'icon': FontAwesomeIcons.graduationCap, 'color': Colors.teal},
};
}
