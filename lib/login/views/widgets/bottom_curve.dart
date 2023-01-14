import 'package:flutter/material.dart';

class BottomCurve extends StatelessWidget {
  const BottomCurve({super.key});

  @override
  Widget build(BuildContext context) {
    var widthSize = MediaQuery.of(context).size.width;
    var heightSize = MediaQuery.of(context).size.height;

    return Center(
      child: ClipPath(
        clipper: LowerClipper(),
        child: Container(
          height: heightSize / 4,
          width: widthSize,
          color: Colors.blue.shade900,
        ),
      ),
    );
  }
}

class LowerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.1203398, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width * 0.7166019, size.height * 0.1678077,
        size.width * 0.7522330, size.height * 0.6703077);
    path.quadraticBezierTo(size.width * 0.3503641, size.height * 0.4228846,
        size.width * 0.1203398, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
