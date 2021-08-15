import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

///
///[getShimmer] this Widget respone to show shimmer flash on the
///widget when the data in the loading state
///it take one argument:
///[shimmerChild] the widget that will shimmer it
///
Widget getShimmer(Widget shimmerChild) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    enabled: true,
    direction: ShimmerDirection.rtl,
    child: shimmerChild,
  );
}
