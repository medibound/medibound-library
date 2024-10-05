import 'package:flutter/material.dart';
import 'package:medibound_library/src/res/DoubleExtension.dart';
import 'package:medibound_library/src/res/Functions.dart';
import 'package:medibound_library/src/types/UnitType.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'dart:math';

class FullRing extends StatelessWidget {
  final Map<String, dynamic> data;

  late String title;
  late double value;
  late double minValue;
  late double maxValue;
  late Color color;
  late UnitType unit;

  FullRing({
    required this.data,
  }) {
    title = data['name'];
    value = data['value'];
    minValue = data['lowerLimit'];
    maxValue = data['upperLimit'];
    color = data['color'];
    unit = data['unit'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
            color: MbColors(context).grey,
            borderRadius: BorderRadius.circular(10),
          ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double gaugeSize = min(constraints.maxWidth, constraints.maxHeight);
      
          return Transform.translate(
            offset: Offset(0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Center(
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 0,
                          startAngle: 270,
                          endAngle: 270,
                          axisLineStyle: AxisLineStyle(
                            thickness: gaugeSize * 0.5, // Adjust the thickness as needed
                            color: Colors.grey.withOpacity(0.15),
                          ),
                          pointers: <GaugePointer>[
                            RangePointer(
                              value: value,
                              width: gaugeSize * 0.5,
                              cornerStyle: CornerStyle.bothCurve,
                              color: color,
                              gradient: SweepGradient(colors: [
                                color.withOpacity(0.4),
                                color,
                              ]),
                            )
                          ],
                          maximum: maxValue,
                          showLabels: false, // Hide the axis labels
                          showTicks: false, // Hide the ticks
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              widget: Container(
                                width: gaugeSize * 0.26,
                                height: gaugeSize * 0.28,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      height: gaugeSize * 0.1,
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        title.toUpperCase(),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: gaugeSize * 0.05,
                                          fontWeight: FontWeight.bold,
                                          color: color,
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: gaugeSize * 0.03),
                                    Text("${value.roundedToString()}",
                                        style: TextStyle(
                                          height: 0.6,
                                          fontSize: gaugeSize * 0.09,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(unit.code.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: gaugeSize * 0.04,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                              ),
                              angle: 90,
                              positionFactor: 0.2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
