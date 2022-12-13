import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class FakeMap extends StatefulWidget {
  @override
  State<FakeMap> createState() => _FakeMapState();
}

class _FakeMapState extends State<FakeMap> {
  double _scale = 1.0;

  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
        onScaleStart: (ScaleStartDetails details) {
          _previousScale = _scale;
          setState(() {});
          print(details);
        },
        onScaleUpdate: (ScaleUpdateDetails details) {
          _scale = _previousScale * details.scale;
          setState(() {});
          print(details);
        },
        onScaleEnd: (ScaleEndDetails details) {
          _previousScale = 1.0;
          setState(() {});
          print(details);
        },
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Transform(
              transform: Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
              child: Image.asset(
                'map.png',
                fit: BoxFit.cover,
              ),
            )),
      )),
    );
  }
}
