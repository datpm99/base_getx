import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

mixin AdaptivePageMixin {
  //  @protected : Only call function when extends, or implement.
  //  @nonVirtual : Can not override this function.
  @protected
  @nonVirtual
  Widget adaptiveBody(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      final deviceSize = MediaQuery.of(context).size;
      final isMobile = deviceSize.shortestSide < 600;
      final orientation = MediaQuery.of(context).orientation;
      final pageSize = Size(constraint.maxWidth, constraint.maxHeight);

      if (isMobile && orientation == Orientation.portrait) {
        return mobilePortraitBody(context, pageSize);
      }
      if (isMobile && orientation == Orientation.landscape) {
        return mobileLandscapeBody(context, pageSize);
      }
      if (!isMobile && orientation == Orientation.portrait) {
        return tabletPortraitBody(context, pageSize);
      }
      if (!isMobile && orientation == Orientation.landscape) {
        return tabletLandscapeBody(context, pageSize);
      }
      return mobilePortraitBody(context, pageSize);
    });
  }

  Widget mobilePortraitBody(BuildContext context, Size size);

  Widget mobileLandscapeBody(BuildContext context, Size size);

  Widget tabletPortraitBody(BuildContext context, Size size);

  Widget tabletLandscapeBody(BuildContext context, Size size);
}
