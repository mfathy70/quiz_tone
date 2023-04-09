import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircularProgressContainer extends StatefulWidget {
  final bool useWhiteLoader;
  final double? heightAndWidth;
  CircularProgressContainer(
      {Key? key, required this.useWhiteLoader, this.heightAndWidth})
      : super(key: key);
  @override
  State<CircularProgressContainer> createState() =>
      _CircularProgressContainerState();
}

class _CircularProgressContainerState extends State<CircularProgressContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 5000,
      ))
    ..repeat();
  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _rotationController,
        builder: (context, _) {
          return widget.useWhiteLoader
              ? Container(
                  width: 250,
                  height: 250,
                  child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.asset(
                        "assets/images/loading.gif",
                        // color: Colors.white,
                      )),
                )
              : Transform.rotate(
                  angle: (_rotationController.value * 6) * 2 * pi,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SvgPicture.asset("assets/images/loadder.svg",
                            color: Theme.of(context).primaryColor)),
                  ),
                );
        });
  }
}
//  Lottie.asset(
//           useWhiteLoader ? "assets/animations/whiteLoading.json" : "assets/animations/loading.json",
//         ),
