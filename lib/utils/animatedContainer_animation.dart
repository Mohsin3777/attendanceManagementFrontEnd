// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class AnimatedContainer extends StatefulWidget {
//   const AnimatedContainer({super.key});

//   @override
//   State<AnimatedContainer> createState() => _AnimatedContainerState();
// }

// class _AnimatedContainerState extends State<AnimatedContainer> {
//       Duration _animationDuration = Duration(milliseconds: 1000);
//   Color _backgroundColor = Colors.blueGrey;
// double _height = 300;
// double _width = 300;
// double _borderWidth = 300;
// double _borderRadius = 10;
// double _padding = 50;
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Center(
//  child: AnimatedContainer(
//             width: _width,
//             height: _height,
//             decoration: BoxDecoration(
//               color: _color,
//               borderRadius: _borderRadius,
//             ),
//             duration: Duration(seconds: 1),
//             curve: Curves.fastOutSlowIn,
//           ),
//       ),
//     );
//   }
// }