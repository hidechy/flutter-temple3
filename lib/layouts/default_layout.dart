// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../utility/utility.dart';

class DefaultLayout extends StatelessWidget {
  final String title;
  final Widget widget;
  final bool isTitleDisplay;

  DefaultLayout(
      {Key? key,
      required this.widget,
      required this.title,
      required this.isTitleDisplay})
      : super(key: key);

  final Utility _utility = Utility();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (isTitleDisplay)
          ? AppBar(
              title: Text(title),
            )
          : null,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _utility.getBackGround(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: widget,
          ),
        ],
      ),
    );
  }
}
