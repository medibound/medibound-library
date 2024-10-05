import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health/health.dart';
import 'UnitType.dart';

class DeviceVariableNumberType {
  static Map<String, Map<String, dynamic>> types = {
    'Interconnected Health Profiles': {
      'Active Energy Burned': {
        'unit': UnitType(code: 'cal'),
        'code': 'ACTIVE_ENERGY_BURNED',
        'type': HealthDataType.ACTIVE_ENERGY_BURNED,
        'icon': FontAwesomeIcons.fire,
        'color': Colors.blue,
        'description': 'The amount of active energy the user has burned.',
      },
      'Basal Energy Burned': {
        'unit': UnitType(code: 'cal'),
        'code': 'BASAL_ENERGY_BURNED',
        'type': HealthDataType.BASAL_ENERGY_BURNED,
        'icon': FontAwesomeIcons.burn,
        'color': Colors.pink,
        'description': 'The amount of basal energy the user has burned.',
      },
      'Blood Glucose': {
        'unit': UnitType(code: 'mg/dL'),
        'code': 'BLOOD_GLUCOSE',
        'type': HealthDataType.BLOOD_GLUCOSE,
        'icon': FontAwesomeIcons.tint,
        'color': Colors.orange,
        'description': 'The user\'s blood glucose level.',
        'lowerLimit': 70.0,
        'upperLimit': 200.0
      },
      'Blood Oxygen': {
        'unit': UnitType(code: '%'),
        'code': 'BLOOD_OXYGEN',
        'type': HealthDataType.BLOOD_OXYGEN,
        'icon': FontAwesomeIcons.lungs,
        'color': Colors.red,
        'description': 'The user\'s blood oxygen level.',
        'lowerLimit': 0,
        'upperLimit': 100.0
      },
      'Blood Pressure Diastolic': {
        'unit': UnitType(code: 'mm[Hg]'),
        'code': 'BLOOD_PRESSURE_DIASTOLIC',
        'type': HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
        'icon': FontAwesomeIcons.heartbeat,
        'color': Colors.purple,
        'description': 'The user\'s diastolic blood pressure.',
        'lowerLimit': 60.0,
        'upperLimit': 90.0
      },
      'Blood Pressure Systolic': {
        'unit': UnitType(code: 'mm[Hg]'),
        'code': 'BLOOD_PRESSURE_SYSTOLIC',
        'type': HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
        'icon': FontAwesomeIcons.heartbeat,
        'color': Colors.green,
        'description': 'The user\'s systolic blood pressure.',
        'lowerLimit': 90.0,
        'upperLimit': 140.0
      },
      'Body Fat Percentage': {
        'unit': UnitType(code: '%'),
        'code': 'BODY_FAT_PERCENTAGE',
        'type': HealthDataType.BODY_FAT_PERCENTAGE,
        'icon': FontAwesomeIcons.dumbbell,
        'color': Colors.blueGrey,
        'description': 'The user\'s body fat percentage.',
        'lowerLimit': 0.0,
        'upperLimit': 100.0
      },
      'Body Mass Index': {
        'unit': UnitType(code: '{none}'),
        'code': 'BODY_MASS_INDEX',
        'type': HealthDataType.BODY_MASS_INDEX,
        'icon': FontAwesomeIcons.balanceScale,
        'color': Colors.lightBlue,
        'description': 'The user\'s body mass index (BMI).',
        'lowerLimit': 18.5,
        'upperLimit': 30.0
      },
      'Body Temperature': {
        'unit': UnitType(code: 'Cel'),
        'code': 'BODY_TEMPERATURE',
        'type': HealthDataType.BODY_TEMPERATURE,
        'icon': FontAwesomeIcons.thermometerHalf,
        'color': Colors.amber,
        'description': 'The user\'s body temperature.',
        'lowerLimit': 30.0,
        'upperLimit': 50.0
      },
      'Flights Climbed': {
        'unit': UnitType(code: '{count}'),
        'code': 'FLIGHTS_CLIMBED',
        'type': HealthDataType.FLIGHTS_CLIMBED,
        'icon': FontAwesomeIcons.stairs,
        'color': Colors.brown,
        'description': 'The number of flights of stairs the user has climbed.',
      },
      'Heart Rate': {
        'unit': UnitType(code: '/min'),
        'code': 'HEART_RATE',
        'type': HealthDataType.HEART_RATE,
        'icon': FontAwesomeIcons.heartbeat,
        'color': Colors.redAccent,
        'description': 'The user\'s heart rate.',
        'lowerLimit': 40.0,
        'upperLimit': 180.0
      },
      'Height': {
        'unit': UnitType(code: 'm'),
        'code': 'HEIGHT',
        'type': HealthDataType.HEIGHT,
        'icon': FontAwesomeIcons.rulerVertical,
        'color': Colors.teal,
        'description': 'The user\'s height.',
      },
      'Nutrition': {
        'unit': UnitType(code: '{none}'),
        'code': 'NUTRITION',
        'type': HealthDataType.NUTRITION,
        'icon': FontAwesomeIcons.utensils,
        'color': Colors.greenAccent,
        'description': 'The user\'s nutrition data.',
      },
      'Respiratory Rate': {
        'unit': UnitType(code: 'res/min'),
        'code': 'RESPIRATORY_RATE',
        'type': HealthDataType.RESPIRATORY_RATE,
        'icon': FontAwesomeIcons.wind,
        'color': Colors.lightGreen,
        'description': 'The user\'s respiratory rate.',
        'lowerLimit': 10.0,
        'upperLimit': 30.0
      },
      'Resting Heart Rate': {
        'unit': UnitType(code: '/min'),
        'code': 'RESTING_HEART_RATE',
        'type': HealthDataType.RESTING_HEART_RATE,
        'icon': FontAwesomeIcons.heartbeat,
        'color': Colors.deepPurple,
        'description': 'The user\'s resting heart rate.',
        'lowerLimit': 40.0,
        'upperLimit': 100.0
      },
      'Sleep Asleep': {
        'unit': UnitType(code: 'min'),
        'code': 'SLEEP_ASLEEP',
        'type': HealthDataType.SLEEP_ASLEEP,
        'icon': FontAwesomeIcons.bed,
        'color': Colors.blueAccent,
        'description': 'The amount of time the user was asleep.',
      },
      'Sleep Awake': {
        'unit': UnitType(code: 'min'),
        'code': 'SLEEP_AWAKE',
        'type': HealthDataType.SLEEP_AWAKE,
        'icon': FontAwesomeIcons.bed,
        'color': Colors.indigo,
        'description': 'The amount of time the user was awake.',
      },
      'Sleep Deep': {
        'unit': UnitType(code: 'min'),
        'code': 'SLEEP_DEEP',
        'type': HealthDataType.SLEEP_DEEP,
        'icon': FontAwesomeIcons.bed,
        'color': Colors.deepOrange,
        'description': 'The amount of time the user was in deep sleep.',
      },
      'Sleep REM': {
        'unit': UnitType(code: 'min'),
        'code': 'SLEEP_REM',
        'type': HealthDataType.SLEEP_REM,
        'icon': FontAwesomeIcons.bed,
        'color': Colors.deepPurpleAccent,
        'description': 'The amount of time the user was in REM sleep.',
      },
      'Steps': {
        'unit': UnitType(code: '{count}'),
        'code': 'STEPS',
        'type': HealthDataType.STEPS,
        'icon': FontAwesomeIcons.walking,
        'color': Colors.deepOrange,
        'description': 'The number of steps the user has taken.',
      },
      'Water': {
        'unit': UnitType(code: 'L'),
        'code': 'WATER',
        'type': HealthDataType.WATER,
        'icon': FontAwesomeIcons.water,
        'color': Colors.blueAccent,
        'description': 'The amount of water the user has consumed.',
      },
      'Weight': {
        'unit': UnitType(code: 'kg'),
        'code': 'WEIGHT',
        'type': HealthDataType.WEIGHT,
        'icon': FontAwesomeIcons.weight,
        'color': Colors.brown,
        'description': 'The user\'s weight.',
        'lowerLimit': 30.0,
        'upperLimit': 300.0
      },
      'Workout': {
        'unit': UnitType(code: '{none}'),
        'code': 'WORKOUT',
        'type': HealthDataType.WORKOUT,
        'icon': FontAwesomeIcons.running,
        'color': Colors.cyan,
        'description': 'The user\'s workout data.',
      },
    },
    'Custom Profiles (Not Interconnected)': {
      'Custom Profile': {
        'unit': UnitType(code: '{none}'),
        'code': 'CUSTOM_PROFILE',
        'icon': FontAwesomeIcons.toolbox,
        'color': Colors.blue,
        'description': 'The user\'s custom data with more options.'
      },
    }
  };

  static Map<String, Map<String, dynamic>> codes = {
    'Interconnected Health Profiles': {
      'ACTIVE_ENERGY_BURNED': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Active Energy Burned']!,
        'name': 'Active Energy Burned',
      },
      'BASAL_ENERGY_BURNED': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Basal Energy Burned']!,
        'name': 'Basal Energy Burned',
      },
      'BLOOD_GLUCOSE': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Blood Glucose']!,
        'name': 'Blood Glucose',
      },
      'BLOOD_OXYGEN': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Blood Oxygen']!,
        'name': 'Blood Oxygen',
      },
      'BLOOD_PRESSURE_DIASTOLIC': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Blood Pressure Diastolic']!,
        'name': 'Blood Pressure Diastolic',
      },
      'BLOOD_PRESSURE_SYSTOLIC': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Blood Pressure Systolic']!,
        'name': 'Blood Pressure Systolic',
      },
      'BODY_FAT_PERCENTAGE': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Body Fat Percentage']!,
        'name': 'Body Fat Percentage',
      },
      'BODY_MASS_INDEX': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Body Mass Index']!,
        'name': 'Body Mass Index',
      },
      'BODY_TEMPERATURE': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Body Temperature']!,
        'name': 'Body Temperature',
      },
      'FLIGHTS_CLIMBED': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Flights Climbed']!,
        'name': 'Flights Climbed',
      },
      'HEART_RATE': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Heart Rate']!,
        'name': 'Heart Rate',
      },
      'HEIGHT': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Height']!,
        'name': 'Height',
      },
      'NUTRITION': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Nutrition']!,
        'name': 'Nutrition',
      },
      'RESPIRATORY_RATE': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Respiratory Rate']!,
        'name': 'Respiratory Rate',
      },
      'RESTING_HEART_RATE': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Resting Heart Rate']!,
        'name': 'Resting Heart Rate',
      },
      'SLEEP_ASLEEP': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Sleep Asleep']!,
        'name': 'Sleep Asleep',
      },
      'SLEEP_AWAKE': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Sleep Awake']!,
        'name': 'Sleep Awake',
      },
      'SLEEP_DEEP': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Sleep Deep']!,
        'name': 'Sleep Deep',
      },
      'SLEEP_REM': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Sleep REM']!,
        'name': 'Sleep REM',
      },
      'STEPS': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Steps']!,
        'name': 'Steps',
      },
      'WATER': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Water']!,
        'name': 'Water',
      },
      'WEIGHT': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Weight']!,
        'name': 'Weight',
      },
      'WORKOUT': {
        ...DeviceVariableNumberType.types['Interconnected Health Profiles']!['Workout']!,
        'name': 'Workout',
      },
    },
    'Custom Profiles (Not Interconnected)': {
      'CUSTOM_PROFILE': {
        ...DeviceVariableNumberType.types['Custom Profiles (Not Interconnected)']!['Custom Profile']!,
        'name': 'Custom Profile',
      },
    }
  };

  static Map<String, Map<String, dynamic>> allCodes() {
    Map<String, Map<String, dynamic>> result = {};
    codes.forEach((key1, value1) {
      value1.forEach((key2, value2) {
        result[key2] = Map<String, dynamic>.from(value2);
      });
    });
    return result;
  }
}
