import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomPaddingRenderBox extends RenderShiftedBox {
  EdgeInsetsGeometry _padding;
  TextDirection? _textDirection;

  CustomPaddingRenderBox(
      {RenderBox? child,
      required EdgeInsetsGeometry padding,
      TextDirection? textDirection})
      : _padding = padding,
        _textDirection = textDirection,
        super(child);

  EdgeInsetsGeometry get padding => _padding;
  set padding(EdgeInsetsGeometry value) {
    if (value == _padding) return;
    _padding = value;
    markNeedsLayout();
  }

  TextDirection? get textDirection => _textDirection;
  set textDirection(TextDirection? value) {
    if (value == _textDirection) return;
    _textDirection = value;
    markNeedsLayout();
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    final double superMin = super.computeMinIntrinsicWidth(height);
    final EdgeInsets resolvedPadding = padding.resolve(_textDirection);
    return resolvedPadding.left + superMin + resolvedPadding.right;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    final double superMin = super.computeMinIntrinsicHeight(width);
    final EdgeInsets resolvedPadding = padding.resolve(textDirection);
    return resolvedPadding.top + superMin + resolvedPadding.bottom;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    final double superMax = super.computeMaxIntrinsicWidth(height);
    final EdgeInsets resolvedPadding = padding.resolve(textDirection);
    return resolvedPadding.left + superMax + resolvedPadding.right;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    final double superMax = super.computeMaxIntrinsicHeight(width);
    final EdgeInsets resolvedPadding = padding.resolve(textDirection);
    return resolvedPadding.top + superMax + resolvedPadding.bottom;
  }

  @override
  void performLayout() {
    final EdgeInsets resolvedPadding = padding.resolve(textDirection);
    if (child != null) {
      final BoxConstraints innerConstraints =
          constraints.deflate(resolvedPadding);
      child!.layout(innerConstraints, parentUsesSize: true);
      final BoxParentData childParentData = child!.parentData! as BoxParentData;
      childParentData.offset =
          Offset(resolvedPadding.left, resolvedPadding.top);
      size = constraints.constrain(Size(
        child!.size.width + resolvedPadding.left + resolvedPadding.right,
        child!.size.height + resolvedPadding.top + resolvedPadding.bottom,
      ));
    } else {
      size = constraints.constrain(resolvedPadding.collapsedSize);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      final BoxParentData childParentData = child!.parentData! as BoxParentData;
      context.paintChild(child!, offset + childParentData.offset);
    }
  }
}

///
///
///
///
///
///
///
///
///
///

class CustomPadding extends SingleChildRenderObjectWidget {
  final EdgeInsetsGeometry padding;

  const CustomPadding({super.key, required this.padding, super.child});

  @override
  RenderObject createRenderObject(BuildContext context) {

    return CustomPaddingRenderBox(padding: padding);
  }

  @override
  void updateRenderObject(
      BuildContext context, CustomPaddingRenderBox renderObject) {
    renderObject
      ..padding = padding
      ..textDirection = Directionality.of(context);
  }
}
