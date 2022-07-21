// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, unused_local_variable, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/live_info.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeWidget extends StatelessWidget {
  const GaugeWidget({
    Key? key,
    required this.value
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
      child: SfRadialGauge(
        //title: GaugeTitle(text: 'Smart Flower LEISTUNG'),
        enableLoadingAnimation: true,
        animationDuration: 4500,
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 3001,
            pointers: <GaugePointer>[
              NeedlePointer(
                value: value,
                enableAnimation: true,
              )
            ],
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 1000,
                color: Colors.greenAccent,
              ),
              GaugeRange(
                startValue: 1000,
                endValue: 2500,
                color: Colors.tealAccent[400],
              ),
              GaugeRange(
                startValue: 2500,
                endValue: 3000,
                color: Colors.redAccent,
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Text(
                  '$value W',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                positionFactor: 0.5,
                angle: 90,
              )
            ],
          )
        ],
      ),
    );
  }
}
