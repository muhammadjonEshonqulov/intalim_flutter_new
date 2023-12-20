import 'package:flutter/material.dart';

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double max;
  final double min;
  final Widget child;
  final Color color;

  const MySliverPersistentHeaderDelegate({
    required this.max,
    required this.min,
    required this.child,
    required this.color,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: color,
      child: child,
    );
  }

  @override
  double get maxExtent => max;

  @override
  double get minExtent => min;

  @override
  bool shouldRebuild(covariant MySliverPersistentHeaderDelegate oldDelegate) {
    return max != oldDelegate.max ||
        min != oldDelegate.min ||
        child != oldDelegate.child ||
        color != oldDelegate.color;
  }
}
