import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  final double height;
  final double dashWidth;
  final double dashSpace;
  final Color color;

  const DottedLine({
    super.key,
    this.height = 1,
    this.dashWidth = 4,
    this.dashSpace = 4,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
