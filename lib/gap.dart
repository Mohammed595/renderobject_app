import 'package:flutter/material.dart';


class Gap extends LeafRenderObjectWidget {
   Gap({super.key, required this.h, required this.w});
    double h ;
  double w; 
  @override
  RenderObject createRenderObject(Object context) {
    return RenderGap(h: h, w: w) ;
  }

}

class  RenderGap extends RenderBox {
  double h ;
  double w; 
  RenderGap ({required this.h, required this.w});

  @override
  void performLayout () {
    size  =  Size(w, h);
  }
}