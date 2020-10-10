library circular_page_view;

import 'package:flutter/material.dart';

/// A PageView which creates Circular Scroll Effect.
class CircularPageView extends StatefulWidget {
  final PageController controller;
  final int itemCount;
  final List<Widget> items;
  ///Function to access the PageChanged status and returns currently Active Index
  final Function(int) onPageChanged;
  ///Value to control the amount of circular effect you want to create.
  ///It accepts value between 0.0 and 1.0
  final double innerRadius;
  ///Value to control the amount of offset you want the widgets to move down
  ///Best values range (100 - 300)
  final double offset;

  CircularPageView({
    @required this.controller,
    @required this.itemCount,
    @required this.items,
    @required this.onPageChanged,
    this.innerRadius = 0.5,
    this.offset = 150.0,
  });

  @override
  _CircularPageViewState createState() => _CircularPageViewState();
}

class _CircularPageViewState extends State<CircularPageView> {
  int _currentPage;

  @override
  void initState() {
    super.initState();

    _currentPage = widget.controller.initialPage ?? 0;

  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.controller,
      itemCount: widget.itemCount,
      itemBuilder: (context, index) => _buildPage(index, widget.items[index]),
      onPageChanged: widget.onPageChanged,
    );
  }

  Widget _buildPage(int index, Widget mainChild) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (BuildContext context, Widget child) {
        double value = 1;
        if (widget.controller.position.haveDimensions) {
          value = widget.controller.page - index;
          value = (1 - (value.abs() * widget.innerRadius)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(0, -(Curves.ease.transform(value) * widget.offset)),
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(0.0, -(Curves.ease.transform(index == 0 ? value : value * widget.innerRadius) * widget.offset)),
              child: child,
            ),
          );
        }
      },
      child: mainChild,
    );
  }
}

