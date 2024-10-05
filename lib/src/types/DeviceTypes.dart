import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeviceTypes {
  static const Map<String, Map<String, dynamic>> types = {
    'Wearables': {
      'Health Rings': {
        'code': 'W001',
        'icon': FontAwesomeIcons.ring,
        'color': Colors.blue,
        'description':
            'Wearable rings that monitor health metrics such as heart rate and sleep patterns.'
      },
      'Smart Watches': {
        'code': 'W002',
        'icon': FontAwesomeIcons.clock,
        'color': Colors.green,
        'description':
            'Wristwatches with integrated health tracking and smart features.'
      },
      'Fitness Bands': {
        'code': 'W003',
        'icon': FontAwesomeIcons.bolt,
        'color': Colors.orange,
        'description':
            'Bands that track physical activity, sleep, and other health metrics.'
      },
      'Smart Glasses': {
        'code': 'W004',
        'icon': FontAwesomeIcons.glasses,
        'color': Colors.purple,
        'description':
            'Glasses with integrated technology for enhanced reality and health monitoring.'
      },
      'Activity Trackers': {
        'code': 'W005',
        'icon': FontAwesomeIcons.running,
        'color': Colors.red,
        'description':
            'Devices that track physical activities and fitness levels.'
      },
      'Sleep Monitors': {
        'code': 'W006',
        'icon': FontAwesomeIcons.bed,
        'color': Colors.teal,
        'description':
            'Devices that monitor sleep patterns and provide insights for better sleep.'
      },
      'Heart Rate Monitors': {
        'code': 'W007',
        'icon': FontAwesomeIcons.heartbeat,
        'color': Colors.pink,
        'description': 'Wearable devices that measure and track heart rate.'
      },
      'Smart Clothing': {
        'code': 'W008',
        'icon': FontAwesomeIcons.tshirt,
        'color': Colors.brown,
        'description':
            'Clothing with integrated technology for health and fitness monitoring.'
      },
      'GPS Trackers': {
        'code': 'W009',
        'icon': FontAwesomeIcons.mapMarkerAlt,
        'color': Colors.yellow,
        'description': 'Devices that use GPS to track location and movement.'
      },
      'UV Sensors': {
        'code': 'W010',
        'icon': FontAwesomeIcons.sun,
        'color': Colors.amber,
        'description':
            'Devices that measure UV exposure and provide sun safety information.'
      },
      'Other Wearable': {
        'code': 'W999',
        'icon': FontAwesomeIcons.question,
        'color': Colors.grey,
        'description':
            'Other types of wearable technology not categorized above.'
      },
    },
    'Medical Devices': {
      'Blood Pressure Monitors': {
        'code': 'M001',
        'icon': FontAwesomeIcons.tint,
        'color': Colors.blue,
        'description': 'Devices used to measure and monitor blood pressure.'
      },
      'Glucose Meters': {
        'code': 'M002',
        'icon': FontAwesomeIcons.syringe,
        'color': Colors.green,
        'description': 'Devices used to measure blood glucose levels.'
      },
      'ECG/EKG Monitors': {
        'code': 'M003',
        'icon': FontAwesomeIcons.heartbeat,
        'color': Colors.red,
        'description':
            'Devices that record the electrical activity of the heart.'
      },
      'Pulse Oximeters': {
        'code': 'M004',
        'icon': FontAwesomeIcons.heartPulse,
        'color': Colors.purple,
        'description': 'Devices that measure oxygen saturation in the blood.'
      },
      'Thermometers': {
        'code': 'M005',
        'icon': FontAwesomeIcons.thermometer,
        'color': Colors.orange,
        'description': 'Devices used to measure body temperature.'
      },
      'Respiratory Monitors': {
        'code': 'M006',
        'icon': FontAwesomeIcons.lungs,
        'color': Colors.teal,
        'description': 'Devices that monitor respiratory functions.'
      },
      'Pain Management Devices': {
        'code': 'M007',
        'icon': FontAwesomeIcons.ban,
        'color': Colors.pink,
        'description': 'Devices used for pain relief and management.'
      },
      'Mobility Aids': {
        'code': 'M008',
        'icon': FontAwesomeIcons.wheelchair,
        'color': Colors.brown,
        'description': 'Devices designed to assist with mobility.'
      },
      'Diagnostic Imaging Devices': {
        'code': 'M009',
        'icon': FontAwesomeIcons.xRay,
        'color': Colors.yellow,
        'description': 'Devices used for diagnostic imaging, such as X-rays.'
      },
      'Drug Delivery Systems': {
        'code': 'M010',
        'icon': FontAwesomeIcons.pills,
        'color': Colors.amber,
        'description': 'Devices used for delivering medication to patients.'
      },
      'Other Medical Device': {
        'code': 'M999',
        'icon': FontAwesomeIcons.question,
        'color': Colors.grey,
        'description': 'Other types of medical devices not categorized above.'
      },
    },
  };

  static const Map<String, Map<String, dynamic>> codes = {
    'Wearables': {
      'W001': {
        'type': 'Wearables',
        'name': 'Health Rings',
        'icon': FontAwesomeIcons.ring,
        'color': Colors.blue,
        'description':
            'Wearable rings that monitor health metrics such as heart rate and sleep patterns.'
      },
      'W002': {
        'type': 'Wearables',
        'name': 'Smart Watches',
        'icon': FontAwesomeIcons.clock,
        'color': Colors.green,
        'description':
            'Wristwatches with integrated health tracking and smart features.'
      },
      'W003': {
        'type': 'Wearables',
        'name': 'Fitness Bands',
        'icon': FontAwesomeIcons.bolt,
        'color': Colors.orange,
        'description':
            'Bands that track physical activity, sleep, and other health metrics.'
      },
      'W004': {
        'type': 'Wearables',
        'name': 'Smart Glasses',
        'icon': FontAwesomeIcons.glasses,
        'color': Colors.purple,
        'description':
            'Glasses with integrated technology for enhanced reality and health monitoring.'
      },
      'W005': {
        'type': 'Wearables',
        'name': 'Activity Trackers',
        'icon': FontAwesomeIcons.running,
        'color': Colors.red,
        'description':
            'Devices that track physical activities and fitness levels.'
      },
      'W006': {
        'type': 'Wearables',
        'name': 'Sleep Monitors',
        'icon': FontAwesomeIcons.bed,
        'color': Colors.teal,
        'description':
            'Devices that monitor sleep patterns and provide insights for better sleep.'
      },
      'W007': {
        'type': 'Wearables',
        'name': 'Heart Rate Monitors',
        'icon': FontAwesomeIcons.heartbeat,
        'color': Colors.pink,
        'description': 'Wearable devices that measure and track heart rate.'
      },
      'W008': {
        'type': 'Wearables',
        'name': 'Smart Clothing',
        'icon': FontAwesomeIcons.tshirt,
        'color': Colors.brown,
        'description':
            'Clothing with integrated technology for health and fitness monitoring.'
      },
      'W009': {
        'type': 'Wearables',
        'name': 'GPS Trackers',
        'icon': FontAwesomeIcons.mapMarkerAlt,
        'color': Colors.yellow,
        'description': 'Devices that use GPS to track location and movement.'
      },
      'W010': {
        'type': 'Wearables',
        'name': 'UV Sensors',
        'icon': FontAwesomeIcons.sun,
        'color': Colors.amber,
        'description':
            'Devices that measure UV exposure and provide sun safety information.'
      },
      'W999': {
        'type': 'Wearables',
        'name': 'Other Wearable',
        'icon': FontAwesomeIcons.question,
        'color': Colors.grey,
        'description':
            'Other types of wearable technology not categorized above.'
      },
    },
    'Medical Devices': {
      'M001': {
        'type': 'Medical Devices',
        'name': 'Blood Pressure Monitors',
        'icon': FontAwesomeIcons.tint,
        'color': Colors.blue,
        'description': 'Devices used to measure and monitor blood pressure.'
      },
      'M002': {
        'type': 'Medical Devices',
        'name': 'Glucose Meters',
        'icon': FontAwesomeIcons.syringe,
        'color': Colors.green,
        'description': 'Devices used to measure blood glucose levels.'
      },
      'M003': {
        'type': 'Medical Devices',
        'name': 'ECG/EKG Monitors',
        'icon': FontAwesomeIcons.heartbeat,
        'color': Colors.red,
        'description':
            'Devices that record the electrical activity of the heart.'
      },
      'M004': {
        'type': 'Medical Devices',
        'name': 'Pulse Oximeters',
        'icon': FontAwesomeIcons.heartPulse,
        'color': Colors.purple,
        'description': 'Devices that measure oxygen saturation in the blood.'
      },
      'M005': {
        'type': 'Medical Devices',
        'name': 'Thermometers',
        'icon': FontAwesomeIcons.thermometer,
        'color': Colors.orange,
        'description': 'Devices used to measure body temperature.'
      },
      'M006': {
        'type': 'Medical Devices',
        'name': 'Respiratory Monitors',
        'icon': FontAwesomeIcons.lungs,
        'color': Colors.teal,
        'description': 'Devices that monitor respiratory functions.'
      },
      'M007': {
        'type': 'Medical Devices',
        'name': 'Pain Management Devices',
        'icon': FontAwesomeIcons.ban,
        'color': Colors.pink,
        'description': 'Devices used for pain relief and management.'
      },
      'M008': {
        'type': 'Medical Devices',
        'name': 'Mobility Aids',
        'icon': FontAwesomeIcons.wheelchair,
        'color': Colors.brown,
        'description': 'Devices designed to assist with mobility.'
      },
      'M009': {
        'type': 'Medical Devices',
        'name': 'Diagnostic Imaging Devices',
        'icon': FontAwesomeIcons.xRay,
        'color': Colors.yellow,
        'description': 'Devices used for diagnostic imaging, such as X-rays.'
      },
      'M010': {
        'type': 'Medical Devices',
        'name': 'Drug Delivery Systems',
        'icon': FontAwesomeIcons.pills,
        'color': Colors.amber,
        'description': 'Devices used for delivering medication to patients.'
      },
      'M999': {
        'type': 'Medical Devices',
        'name': 'Other Medical Device',
        'icon': FontAwesomeIcons.question,
        'color': Colors.grey,
        'description': 'Other types of medical devices not categorized above.'
      },
    }
  };
}
