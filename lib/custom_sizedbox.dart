import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// 1-create our renderBox
class CustomSizedBoxRenderBox extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  CustomSizedBoxRenderBox({
    required double width,
    required double height,
  })  : _width = width,
        _height = height;

  double _width;
  double _height;

  set setHight(double newHight) {
    if (newHight == _height) {
      return;
    } else {
      _height = newHight;
      markNeedsLayout();
    }
  }

  set setWidth(double newWidth) {
    if (newWidth == _width) {
      return;
    } else {
      _width = newWidth;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    size = constraints.constrain(Size(_width, _height));

    if (child != null) {
      child!.layout(BoxConstraints.tight(size), parentUsesSize: true);
    } else {
      size = Size(_width, _height);
    }
  }

  // propty the widget has child > if has paint the child on screen
  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}


////
///
///
///
///
///
///
///



// 2- create signle or multe or leaf of renderBox
// will be take widget name
class CustomSizedBox extends SingleChildRenderObjectWidget {
  final double height;
  final double width;

  const CustomSizedBox({
    super.key,
    this.width = 0.0,
    this.height = 0.0,
    super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomSizedBoxRenderBox(height: height, width: width);
  }

  @override
  void updateRenderObject(
      BuildContext context, CustomSizedBoxRenderBox renderObject) {
    renderObject
      ..setWidth = width
      ..setHight = height;
     
  }
}

