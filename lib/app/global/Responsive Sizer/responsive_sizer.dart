import 'package:flutter/widgets.dart';

class ResponsiveSizer {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 425;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 425 &&
        MediaQuery.of(context).size.width < 768;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 768;
  }
}
