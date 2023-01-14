import 'package:flutter/material.dart';

class TopCurve extends StatelessWidget {
  const TopCurve({super.key});

  @override
  Widget build(BuildContext context) {
    var widthSize = MediaQuery.of(context).size.width;
    var heightSize = MediaQuery.of(context).size.height;
    return Center(
      child: ClipPath(
        clipper: UpperClipper(),
        child: Container(
          height: heightSize / 4,
          width: widthSize,
          color: Colors.deepPurple.shade900,
        ),
      ),
    );
  }
}

class UpperClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(0, size.height);
    path0.quadraticBezierTo(size.width * 0.3891505, size.height * 1.0075000,
        size.width * 0.4590291, size.height * 0.3838846);
    path0.quadraticBezierTo(size.width * 0.7548786, size.height * 0.3741923,
        size.width * 0.8463107, 0);
    path0.lineTo(0, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
