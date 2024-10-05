import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health/health.dart';

class UnitType {

  late String type;
  final String code;
  late HealthDataUnit unit;
  late IconData icon;
  late Color color;
  late String description;

  UnitType({
    required this.code
  }) {
    type = codes[code]!['name'];
    unit = codes[code]!['unitHealthData'];
    icon = codes[code]!['icon'];
    color = codes[code]!['color'];
    description = codes[code]!['description'];
  }

  static const Map<String, Map<String, dynamic>> types = {
    'Gram': {
      'code': 'g',
      'unitHealthData': HealthDataUnit.GRAM,
      'icon': FontAwesomeIcons.weight,
      'color': Colors.blue,
      'description': 'Mass unit: Gram'
    },
    'Kilogram': {
      'code': 'kg',
      'unitHealthData': HealthDataUnit.KILOGRAM,
      'icon': FontAwesomeIcons.weight,
      'color': Colors.green,
      'description': 'Mass unit: Kilogram'
    },
    'Ounce': {
      'code': 'oz',
      'unitHealthData': HealthDataUnit.OUNCE,
      'icon': FontAwesomeIcons.weight,
      'color': Colors.orange,
      'description': 'Mass unit: Ounce'
    },
    'Pound': {
      'code': 'lb',
      'unitHealthData': HealthDataUnit.POUND,
      'icon': FontAwesomeIcons.weight,
      'color': Colors.red,
      'description': 'Mass unit: Pound'
    },
    'Stone': {
      'code': '[stone_av]',
      'unitHealthData': HealthDataUnit.STONE,
      'icon': FontAwesomeIcons.weight,
      'color': Colors.purple,
      'description': 'Mass unit: Stone'
    },
    'Meter': {
      'code': 'm',
      'unitHealthData': HealthDataUnit.METER,
      'icon': FontAwesomeIcons.ruler,
      'color': Colors.blue,
      'description': 'Length unit: Meter'
    },
    'Inch': {
      'code': '[in_i]',
      'unitHealthData': HealthDataUnit.INCH,
      'icon': FontAwesomeIcons.ruler,
      'color': Colors.green,
      'description': 'Length unit: Inch'
    },
    'Foot': {
      'code': '[ft_i]',
      'unitHealthData': HealthDataUnit.FOOT,
      'icon': FontAwesomeIcons.ruler,
      'color': Colors.orange,
      'description': 'Length unit: Foot'
    },
    'Yard': {
      'code': '[yd_i]',
      'unitHealthData': HealthDataUnit.YARD,
      'icon': FontAwesomeIcons.ruler,
      'color': Colors.red,
      'description': 'Length unit: Yard'
    },
    'Mile': {
      'code': '[mi_i]',
      'unitHealthData': HealthDataUnit.MILE,
      'icon': FontAwesomeIcons.ruler,
      'color': Colors.purple,
      'description': 'Length unit: Mile'
    },
    'Liter': {
      'code': 'L',
      'unitHealthData': HealthDataUnit.LITER,
      'icon': FontAwesomeIcons.flask,
      'color': Colors.blue,
      'description': 'Volume unit: Liter'
    },
    'Milliliter': {
      'code': 'mL',
      'unitHealthData': HealthDataUnit.MILLILITER,
      'icon': FontAwesomeIcons.flask,
      'color': Colors.green,
      'description': 'Volume unit: Milliliter'
    },
    'Fluid Ounce (US)': {
      'code': '[foz_us]',
      'unitHealthData': HealthDataUnit.FLUID_OUNCE_US,
      'icon': FontAwesomeIcons.flask,
      'color': Colors.orange,
      'description': 'Volume unit: Fluid Ounce (US)'
    },
    'Fluid Ounce (Imperial)': {
      'code': '[foz_br]',
      'unitHealthData': HealthDataUnit.FLUID_OUNCE_IMPERIAL,
      'icon': FontAwesomeIcons.flask,
      'color': Colors.red,
      'description': 'Volume unit: Fluid Ounce (Imperial)'
    },
    'Cup (US)': {
      'code': '[cup_us]',
      'unitHealthData': HealthDataUnit.CUP_US,
      'icon': FontAwesomeIcons.mugHot,
      'color': Colors.purple,
      'description': 'Volume unit: Cup (US)'
    },
    'Cup (Imperial)': {
      'code': '[cup_br]',
      'unitHealthData': HealthDataUnit.CUP_IMPERIAL,
      'icon': FontAwesomeIcons.mugHot,
      'color': Colors.blue,
      'description': 'Volume unit: Cup (Imperial)'
    },
    'Pint (US)': {
      'code': '[pt_us]',
      'unitHealthData': HealthDataUnit.PINT_US,
      'icon': FontAwesomeIcons.beer,
      'color': Colors.green,
      'description': 'Volume unit: Pint (US)'
    },
    'Pint (Imperial)': {
      'code': '[pt_br]',
      'unitHealthData': HealthDataUnit.PINT_IMPERIAL,
      'icon': FontAwesomeIcons.beer,
      'color': Colors.orange,
      'description': 'Volume unit: Pint (Imperial)'
    },
    'Pascal': {
      'code': 'Pa',
      'unitHealthData': HealthDataUnit.PASCAL,
      'icon': FontAwesomeIcons.thermometerHalf,
      'color': Colors.red,
      'description': 'Pressure unit: Pascal'
    },
    'Millimeter of Mercury': {
      'code': 'mm[Hg]',
      'unitHealthData': HealthDataUnit.MILLIMETER_OF_MERCURY,
      'icon': FontAwesomeIcons.thermometerHalf,
      'color': Colors.purple,
      'description': 'Pressure unit: Millimeter of Mercury'
    },
    'Inches of Mercury': {
      'code': '[in_iHg]',
      'unitHealthData': HealthDataUnit.INCHES_OF_MERCURY,
      'icon': FontAwesomeIcons.thermometerHalf,
      'color': Colors.blue,
      'description': 'Pressure unit: Inches of Mercury'
    },
    'Centimeter of Water': {
      'code': 'cm[H2O]',
      'unitHealthData': HealthDataUnit.CENTIMETER_OF_WATER,
      'icon': FontAwesomeIcons.thermometerHalf,
      'color': Colors.green,
      'description': 'Pressure unit: Centimeter of Water'
    },
    'Atmosphere': {
      'code': 'atm',
      'unitHealthData': HealthDataUnit.ATMOSPHERE,
      'icon': FontAwesomeIcons.thermometerHalf,
      'color': Colors.orange,
      'description': 'Pressure unit: Atmosphere'
    },
    'Decibel A Weighted Sound Pressure Level': {
      'code': 'dB[A]',
      'unitHealthData': HealthDataUnit.DECIBEL_A_WEIGHTED_SOUND_PRESSURE_LEVEL,
      'icon': FontAwesomeIcons.volumeUp,
      'color': Colors.red,
      'description': 'Pressure unit: Decibel A Weighted Sound Pressure Level'
    },
    'Second': {
      'code': 's',
      'unitHealthData': HealthDataUnit.SECOND,
      'icon': FontAwesomeIcons.clock,
      'color': Colors.blue,
      'description': 'Time unit: Second'
    },
    'Millisecond': {
      'code': 'ms',
      'unitHealthData': HealthDataUnit.MILLISECOND,
      'icon': FontAwesomeIcons.clock,
      'color': Colors.green,
      'description': 'Time unit: Millisecond'
    },
    'Minute': {
      'code': 'min',
      'unitHealthData': HealthDataUnit.MINUTE,
      'icon': FontAwesomeIcons.clock,
      'color': Colors.orange,
      'description': 'Time unit: Minute'
    },
    'Hour': {
      'code': 'h',
      'unitHealthData': HealthDataUnit.HOUR,
      'icon': FontAwesomeIcons.clock,
      'color': Colors.red,
      'description': 'Time unit: Hour'
    },
    'Day': {
      'code': 'd',
      'unitHealthData': HealthDataUnit.DAY,
      'icon': FontAwesomeIcons.clock,
      'color': Colors.purple,
      'description': 'Time unit: Day'
    },
    'Joule': {
      'code': 'J',
      'unitHealthData': HealthDataUnit.JOULE,
      'icon': FontAwesomeIcons.bolt,
      'color': Colors.blue,
      'description': 'Energy unit: Joule'
    },
    'Kilocalorie': {
      'code': 'kcal',
      'unitHealthData': HealthDataUnit.KILOCALORIE,
      'icon': FontAwesomeIcons.bolt,
      'color': Colors.green,
      'description': 'Energy unit: Kilocalorie'
    },
    'Large Calorie': {
      'code': 'Cal',
      'unitHealthData': HealthDataUnit.LARGE_CALORIE,
      'icon': FontAwesomeIcons.bolt,
      'color': Colors.orange,
      'description': 'Energy unit: Large Calorie'
    },
    'Small Calorie': {
      'code': 'cal',
      'unitHealthData': HealthDataUnit.SMALL_CALORIE,
      'icon': FontAwesomeIcons.bolt,
      'color': Colors.red,
      'description': 'Energy unit: Small Calorie'
    },
    'Degree Celsius': {
      'code': 'Cel',
      'unitHealthData': HealthDataUnit.DEGREE_CELSIUS,
      'icon': FontAwesomeIcons.thermometerHalf,
      'color': Colors.blue,
      'description': 'Temperature unit: Degree Celsius'
    },
    'Degree Fahrenheit': {
      'code': '[degF]',
      'unitHealthData': HealthDataUnit.DEGREE_FAHRENHEIT,
      'icon': FontAwesomeIcons.thermometerHalf,
      'color': Colors.green,
      'description': 'Temperature unit: Degree Fahrenheit'
    },
    'Kelvin': {
      'code': 'K',
      'unitHealthData': HealthDataUnit.KELVIN,
      'icon': FontAwesomeIcons.thermometerHalf,
      'color': Colors.orange,
      'description': 'Temperature unit: Kelvin'
    },
    'Decibel Hearing Level': {
      'code': 'dB[HL]',
      'unitHealthData': HealthDataUnit.DECIBEL_HEARING_LEVEL,
      'icon': FontAwesomeIcons.volumeUp,
      'color': Colors.red,
      'description': 'Hearing unit: Decibel Hearing Level'
    },
    'Hertz': {
      'code': 'Hz',
      'unitHealthData': HealthDataUnit.HERTZ,
      'icon': FontAwesomeIcons.wifi,
      'color': Colors.purple,
      'description': 'Frequency unit: Hertz'
    },
    'Siemen': {
      'code': 'S',
      'unitHealthData': HealthDataUnit.SIEMEN,
      'icon': FontAwesomeIcons.plug,
      'color': Colors.blue,
      'description': 'Electrical conductance unit: Siemen'
    },
    'Volt': {
      'code': 'V',
      'unitHealthData': HealthDataUnit.VOLT,
      'icon': FontAwesomeIcons.bolt,
      'color': Colors.green,
      'description': 'Potential unit: Volt'
    },
    'International unitHealthData': {
      'code': '[iU]',
      'unitHealthData': HealthDataUnit.INTERNATIONAL_UNIT,
      'icon': FontAwesomeIcons.pills,
      'color': Colors.orange,
      'description': 'Pharmacology unit: International unitHealthData'
    },
    'Count': {
      'code': '{count}',
      'unitHealthData': HealthDataUnit.COUNT,
      'icon': FontAwesomeIcons.sortNumericDown,
      'color': Colors.red,
      'description': 'Scalar unit: Count'
    },
    'Percent': {
      'code': '%',
      'unitHealthData': HealthDataUnit.PERCENT,
      'icon': FontAwesomeIcons.percent,
      'color': Colors.purple,
      'description': 'Scalar unit: Percent'
    },
    'Beats Per Minute': {
      'code': '/min',
      'unitHealthData': HealthDataUnit.BEATS_PER_MINUTE,
      'icon': FontAwesomeIcons.heartbeat,
      'color': Colors.blue,
      'description': 'Other unit: Beats Per Minute'
    },
    'Respirations Per Minute': {
      'code': 'res/min',
      'unitHealthData': HealthDataUnit.RESPIRATIONS_PER_MINUTE,
      'icon': FontAwesomeIcons.lungs,
      'color': Colors.green,
      'description': 'Other unit: Respirations Per Minute'
    },
    'Milligram Per Deciliter': {
      'code': 'mg/dL',
      'unitHealthData': HealthDataUnit.MILLIGRAM_PER_DECILITER,
      'icon': FontAwesomeIcons.vial,
      'color': Colors.orange,
      'description': 'Other unit: Milligram Per Deciliter'
    },
    'Unknown Unit': {
      'code': '{unknown}',
      'unitHealthData': HealthDataUnit.UNKNOWN_UNIT,
      'icon': FontAwesomeIcons.question,
      'color': Colors.red,
      'description': 'Other unit: Unknown Unit'
    },
    'No Unit': {
      'code': '{none}',
      'unitHealthData': HealthDataUnit.NO_UNIT,
      'icon': FontAwesomeIcons.times,
      'color': Colors.purple,
      'description': 'Other unit: No Unit'
    },
  };

  static const Map<String, Map<String, dynamic>> codes = {
    'g': {
      'name': 'Gram',
      'unitHealthData': HealthDataUnit.GRAM,
      'icon': FontAwesomeIcons.weight,
      'color': Colors.blue,
      'description': 'Mass unit: Gram'
    },
    'kg': {
      'name': 'Kilogram',
      'unitHealthData': HealthDataUnit.KILOGRAM,
      'icon': FontAwesomeIcons.weight,
      'color': Colors.green,
      'description': 'Mass unit: Kilogram'
    },
    'oz': {
      'name': 'Ounce',
      'unitHealthData': HealthDataUnit.OUNCE,
      'icon': FontAwesomeIcons.weight,
      'color': Colors.orange,
      'description': 'Mass unit: Ounce'
    },
    'lb': {
      'name': 'Pound',
      'unitHealthData': HealthDataUnit.POUND,
      'icon': FontAwesomeIcons.weight,
      'color': Colors.red,
      'description': 'Mass unit: Pound'
    },
    '[stone_av]': {
      'name': 'Stone',
      'unitHealthData': HealthDataUnit.STONE,
      'icon': FontAwesomeIcons.weight,
      'color': Colors.purple,
      'description': 'Mass unit: Stone'
    },
    'm': {
      'name': 'Meter',
      'unitHealthData': HealthDataUnit.METER,
      'icon': FontAwesomeIcons.ruler,
      'color': Colors.blue,
      'description': 'Length unit: Meter'
    },
    '[in_i]': {
      'name': 'Inch',
      'unitHealthData': HealthDataUnit.INCH,
      'icon': FontAwesomeIcons.ruler,
      'color': Colors.green,
      'description': 'Length unit: Inch'
    },
    '[ft_i]': {
      'name': 'Foot',
      'unitHealthData': HealthDataUnit.FOOT,
      'icon': FontAwesomeIcons.ruler,
      'color': Colors.orange,
      'description': 'Length unit: Foot'
    },
    '[yd_i]': {
      'name': 'Yard',
      'unitHealthData': HealthDataUnit.YARD,
      'icon': FontAwesomeIcons.ruler,
      'color': Colors.red,
      'description': 'Length unit: Yard'
    },
    '[mi_i]': {
      'name': 'Mile',
      'unitHealthData': HealthDataUnit.MILE,
      'icon': FontAwesomeIcons.ruler,
      'color': Colors.purple,
      'description': 'Length unit: Mile'
    },
    'L': {
      'name': 'Liter',
      'unitHealthData': HealthDataUnit.LITER,
      'icon': FontAwesomeIcons.flask,
      'color': Colors.blue,
      'description': 'Volume unit: Liter'
    },
    'mL': {
      'name': 'Milliliter',
      'unitHealthData': HealthDataUnit.MILLILITER,
      'icon': FontAwesomeIcons.flask,
      'color': Colors.green,
      'description': 'Volume unit: Milliliter'
    },
    '[foz_us]': {
      'name': 'Fluid Ounce (US)',
      'unitHealthData': HealthDataUnit.FLUID_OUNCE_US,
      'icon': FontAwesomeIcons.flask,
      'color': Colors.orange,
      'description': 'Volume unit: Fluid Ounce (US)'
    },
    '[foz_br]': {
      'name': 'Fluid Ounce (Imperial)',
      'unitHealthData': HealthDataUnit.FLUID_OUNCE_IMPERIAL,
      'icon': FontAwesomeIcons.flask,
      'color': Colors.red,
      'description': 'Volume unit: Fluid Ounce (Imperial)'
    },
    '[cup_us]': {
      'name': 'Cup (US)',
      'unitHealthData': HealthDataUnit.CUP_US,
      'icon': FontAwesomeIcons.mugHot,
      'color': Colors.purple,
      'description': 'Volume unit: Cup (US)'
    },
    '[cup_br]': {
      'name': 'Cup (Imperial)',
      'unitHealthData': HealthDataUnit.CUP_IMPERIAL,
      'icon': FontAwesomeIcons.mugHot,
      'color': Colors.blue,
      'description': 'Volume unit: Cup (Imperial)'
    },
    '[pt_us]': {
      'name': 'Pint (US)',
      'unitHealthData': HealthDataUnit.PINT_US,
      'icon': FontAwesomeIcons.beer,
      'color': Colors.green,
      'description': 'Volume unit: Pint (US)'
    },
    '[pt_br]': {
      'name': 'Pint (Imperial)',
      'unitHealthData': HealthDataUnit.PINT_IMPERIAL,
      'icon': FontAwesomeIcons.beer,
      'color': Colors.orange,
      'description': 'Volume unit: Pint (Imperial)'
    },
    'Pa': {
      'name': 'Pascal',
      'unitHealthData': HealthDataUnit.PASCAL,
      'icon': FontAwesomeIcons.thermometerHalf,
      'color': Colors.red,
      'description': 'Pressure unit: Pascal'
    },
    'mm[Hg]': {
      'name': 'Millimeter of Mercury',
      'unitHealthData': HealthDataUnit.MILLIMETER_OF_MERCURY,
      'icon': FontAwesomeIcons.thermometerHalf,
      'color': Colors.purple,
      'description': 'Pressure unit: Millimeter of Mercury'
    },
    '[in_iHg]': {
      'name': 'Inches of Mercury',
      'unitHealthData': HealthDataUnit.INCHES_OF_MERCURY,
      'icon': FontAwesomeIcons.thermometerHalf,
      'color': Colors.blue,
      'description': 'Pressure unit: Inches of Mercury'
    },
    'cm[H2O]': {
      'name': 'Centimeter of Water',
      'unitHealthData': HealthDataUnit.CENTIMETER_OF_WATER,
      'icon': FontAwesomeIcons.thermometerHalf,
      'color': Colors.green,
      'description': 'Pressure unit: Centimeter of Water'
    },
    'atm': {
      'name': 'Atmosphere',
      'unitHealthData': HealthDataUnit.ATMOSPHERE,
      'icon': FontAwesomeIcons.thermometerHalf,
      'color': Colors.orange,
      'description': 'Pressure unit: Atmosphere'
    },
    'dB[A]': {
      'name': 'Decibel A Weighted Sound Pressure Level',
      'unitHealthData': HealthDataUnit.DECIBEL_A_WEIGHTED_SOUND_PRESSURE_LEVEL,
      'icon': FontAwesomeIcons.volumeUp,
      'color': Colors.red,
      'description': 'Pressure unit: Decibel A Weighted Sound Pressure Level'
    },
    's': {
      'name': 'Second',
      'unitHealthData': HealthDataUnit.SECOND,
      'icon': FontAwesomeIcons.clock,
      'color': Colors.blue,
      'description': 'Time unit: Second'
    },
    'ms': {
      'name': 'Millisecond',
      'unitHealthData': HealthDataUnit.MILLISECOND,
      'icon': FontAwesomeIcons.clock,
      'color': Colors.green,
      'description': 'Time unit: Millisecond'
    },
    'min': {
      'name': 'Minute',
      'unitHealthData': HealthDataUnit.MINUTE,
      'icon': FontAwesomeIcons.clock,
      'color': Colors.orange,
      'description': 'Time unit: Minute'
    },
    'h': {
      'name': 'Hour',
      'unitHealthData': HealthDataUnit.HOUR,
      'icon': FontAwesomeIcons.clock,
      'color': Colors.red,
      'description': 'Time unit: Hour'
    },
    'd': {
      'name': 'Day',
      'unitHealthData': HealthDataUnit.DAY,
      'icon': FontAwesomeIcons.clock,
      'color': Colors.purple,
      'description': 'Time unit: Day'
    },
    'J': {
      'name': 'Joule',
      'unitHealthData': HealthDataUnit.JOULE,
      'icon': FontAwesomeIcons.bolt,
      'color': Colors.blue,
      'description': 'Energy unit: Joule'
    },
    'kcal': {
      'name': 'Kilocalorie',
      'unitHealthData': HealthDataUnit.KILOCALORIE,
      'icon': FontAwesomeIcons.bolt,
      'color': Colors.green,
      'description': 'Energy unit: Kilocalorie'
    },
    'Cal': {
      'name': 'Large Calorie',
      'unitHealthData': HealthDataUnit.LARGE_CALORIE,
      'icon': FontAwesomeIcons.bolt,
      'color': Colors.orange,
      'description': 'Energy unit: Large Calorie'
    },
    'cal': {
      'name': 'Small Calorie',
      'unitHealthData': HealthDataUnit.SMALL_CALORIE,
      'icon': FontAwesomeIcons.bolt,
      'color': Colors.red,
      'description': 'Energy unit: Small Calorie'
    },
    'Cel': {
      'name': 'Degree Celsius',
      'unitHealthData': HealthDataUnit.DEGREE_CELSIUS,
      'icon': FontAwesomeIcons.thermometerHalf,
      'color': Colors.blue,
      'description': 'Temperature unit: Degree Celsius'
    },
    '[degF]': {
      'name': 'Degree Fahrenheit',
      'unitHealthData': HealthDataUnit.DEGREE_FAHRENHEIT,
      'icon': FontAwesomeIcons.thermometerHalf,
      'color': Colors.green,
      'description': 'Temperature unit: Degree Fahrenheit'
    },
    'K': {
      'name': 'Kelvin',
      'unitHealthData': HealthDataUnit.KELVIN,
      'icon': FontAwesomeIcons.thermometerHalf,
      'color': Colors.orange,
      'description': 'Temperature unit: Kelvin'
    },
    'dB[HL]': {
      'name': 'Decibel Hearing Level',
      'unitHealthData': HealthDataUnit.DECIBEL_HEARING_LEVEL,
      'icon': FontAwesomeIcons.volumeUp,
      'color': Colors.red,
      'description': 'Hearing unit: Decibel Hearing Level'
    },
    'Hz': {
      'name': 'Hertz',
      'unitHealthData': HealthDataUnit.HERTZ,
      'icon': FontAwesomeIcons.wifi,
      'color': Colors.purple,
      'description': 'Frequency unit: Hertz'
    },
    'S': {
      'name': 'Siemen',
      'unitHealthData': HealthDataUnit.SIEMEN,
      'icon': FontAwesomeIcons.plug,
      'color': Colors.blue,
      'description': 'Electrical conductance unit: Siemen'
    },
    'V': {
      'name': 'Volt',
      'unitHealthData': HealthDataUnit.VOLT,
      'icon': FontAwesomeIcons.bolt,
      'color': Colors.green,
      'description': 'Potential unit: Volt'
    },
    '[iU]': {
      'name': 'International unitHealthData',
      'unitHealthData': HealthDataUnit.INTERNATIONAL_UNIT,
      'icon': FontAwesomeIcons.pills,
      'color': Colors.orange,
      'description': 'Pharmacology unit: International unitHealthData'
    },
    '{count}': {
      'name': 'Count',
      'unitHealthData': HealthDataUnit.COUNT,
      'icon': FontAwesomeIcons.sortNumericDown,
      'color': Colors.red,
      'description': 'Scalar unit: Count'
    },
    '%': {
      'name': 'Percent',
      'unitHealthData': HealthDataUnit.PERCENT,
      'icon': FontAwesomeIcons.percent,
      'color': Colors.purple,
      'description': 'Scalar unit: Percent'
    },
    '/min': {
      'name': 'Beats Per Minute',
      'unitHealthData': HealthDataUnit.BEATS_PER_MINUTE,
      'icon': FontAwesomeIcons.heartbeat,
      'color': Colors.blue,
      'description': 'Other unit: Beats Per Minute'
    },
    'res/min': {
      'name': 'Respirations Per Minute',
      'unitHealthData': HealthDataUnit.RESPIRATIONS_PER_MINUTE,
      'icon': FontAwesomeIcons.lungs,
      'color': Colors.green,
      'description': 'Other unit: Respirations Per Minute'
    },
    'mg/dL': {
      'name': 'Milligram Per Deciliter',
      'unitHealthData': HealthDataUnit.MILLIGRAM_PER_DECILITER,
      'icon': FontAwesomeIcons.vial,
      'color': Colors.orange,
      'description': 'Other unit: Milligram Per Deciliter'
    },
    '{unknown}': {
      'name': 'Unknown Unit',
      'unitHealthData': HealthDataUnit.UNKNOWN_UNIT,
      'icon': FontAwesomeIcons.question,
      'color': Colors.red,
      'description': 'Other unit: Unknown Unit'
    },
    '{none}': {
      'name': 'No Unit',
      'unitHealthData': HealthDataUnit.NO_UNIT,
      'icon': FontAwesomeIcons.times,
      'color': Colors.purple,
      'description': 'Other unit: No Unit'
    },
  };
}
