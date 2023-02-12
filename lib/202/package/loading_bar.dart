// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({Key? key, this.size}) : super(key: key);
  final double? size;
  final _defaultSize = 50.0;

  @override
  Widget build(BuildContext context) {
    return SpinKitSquareCircle(
      color: Colors.black,
      size: size ?? _defaultSize,
    );
  }
}
