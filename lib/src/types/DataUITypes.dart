import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health/health.dart';
import 'package:medibound_library/src/components/single-number-range/FullRing.dart';
import 'package:medibound_library/src/components/single-number-range/HalfRIng.dart';
import 'UnitType.dart';

enum BlockSize {
  SINGLE,
  DOUBLE,
}

enum BlockType { CHARACTERISITIC, NUMBER, NUMBERRANGE, NUMBERARRAY }

class DataUITypes {
  static Map<String, Map<String, dynamic>> blocks(BlockType type, Map<String, dynamic> data) {
    switch (type) {
      case BlockType.CHARACTERISITIC:
        return {};
      case BlockType.NUMBER:
        return {};
      case BlockType.NUMBERRANGE:
        return {
          'Full Ring': {
            'size': BlockSize.SINGLE,
            'type': BlockType.NUMBERRANGE,
            'color': Colors.blue,
            'description': 'The amount of active energy the user has burned.',
            'widget': FullRing(data: data),
          },
          'Half Ring': {
            'size': BlockSize.SINGLE,
            'type': BlockType.NUMBERRANGE,
            'color': Colors.blue,
            'description': 'The amount of active energy the user has burned.',
            'widget': HalfRing(data: data),
          }
        };
      default:
        return {};
    }
  }

  static Map<String, Map<String, dynamic>> get(
      BlockSize size, BlockType type, Map<String, dynamic> data) {
    Map<String, Map<String, dynamic>> result = {};

    Map<String, Map<String, dynamic>> allBlocks = blocks(type, data);

    allBlocks.forEach((key, value) {
      if (value['size'] == size) {
        result[key] = value;
      }
    });

    return result;
  }
}
