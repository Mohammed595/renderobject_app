import 'package:flutter/material.dart';

class ProductCardRenderBox extends RenderBox {
  String productName;
  double price;
  Color selectedColor;
  Color unselectedColor;
  bool isFavorite;
  bool hasShipping;

  ProductCardRenderBox({
    required this.productName,
    required this.price,
    required this.selectedColor,
    required this.unselectedColor,
    this.isFavorite = false,
    this.hasShipping = false,
  });

  @override
  void performLayout() {
    size = const Size(200, 100);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    // canvas.save();
    canvas.translate(50, 50);

    // Paint background
    final paint = Paint()  ;
    paint.color =Colors.blue;
    canvas.drawRect(Offset.zero & size, paint);

    // Paint product image (simplified as a black rectangle)
    paint.color = Colors.red;
    canvas.drawRect(Rect.fromLTWH(10, 10, size.width - 20, size.height - 80), paint);

    // Paint product name
    final textPainter = TextPainter(
      text: TextSpan(text: productName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width - 20);
    textPainter.paint(canvas, Offset(10, size.height - 60));

    // Paint price
    textPainter.text = TextSpan(text: '\$$price', style: const TextStyle(fontSize: 14));
    textPainter.layout(maxWidth: size.width - 20);
    textPainter.paint(canvas, Offset(10, size.height - 40));

    // Paint color options
    paint.color = selectedColor;
    canvas.drawCircle(Offset(10, size.height - 20), 5, paint);
    paint.color = unselectedColor;
    canvas.drawCircle(Offset(25, size.height - 20), 5, paint);

    // Paint favorite icon
    if (isFavorite) {
      paint.color = Colors.red;
      final path = Path()
        ..moveTo(size.width - 20, size.height - 25)
        ..lineTo(size.width - 15, size.height - 20)
        ..lineTo(size.width - 10, size.height - 25)
        ..close();
      canvas.drawPath(path, paint);
    }

    // Paint shipping icon
    if (hasShipping) {
      paint.color = Colors.green;
      canvas.drawRect(Rect.fromLTWH(size.width - 40, size.height - 25, 15, 10), paint);
      canvas.drawRect(Rect.fromLTWH(size.width - 35, size.height - 15, 5, 5), paint);
    }

    canvas.restore();
  }
}

class ProductCard extends LeafRenderObjectWidget {
  final String productName;
  final double price;
  final Color selectedColor;
  final Color unselectedColor;
  final bool isFavorite;
  final bool hasShipping;

  const ProductCard({super.key, 
    required this.productName,
    required this.price,
    required this.selectedColor,
    required this.unselectedColor,
    this.isFavorite = false,
    this.hasShipping = false,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return ProductCardRenderBox(
      productName: productName,
      price: price,
      selectedColor: selectedColor,
      unselectedColor: unselectedColor,
      isFavorite: isFavorite,
      hasShipping: hasShipping,
    );
  }

  @override
  void updateRenderObject(BuildContext context, ProductCardRenderBox renderObject) {
    renderObject
      ..productName = productName
      ..price = price
      ..selectedColor = selectedColor
      ..unselectedColor = unselectedColor
      ..isFavorite = isFavorite
      ..hasShipping = hasShipping;
  }
}