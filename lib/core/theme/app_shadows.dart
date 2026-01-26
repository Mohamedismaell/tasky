import 'package:flutter/material.dart';

class AppShadows {
  const AppShadows._();
  // === Light ===
  static BoxShadow elevation1 = BoxShadow(
    color: Color(0xf000000).withOpacity(0.15),

    offset: Offset(0, 4),
    blurRadius: 8,
    spreadRadius: 3,
  );
  static BoxShadow elevation2 = BoxShadow(
    // color: AppColors.eboneyClay.withOpacity(0.4),
    color: Color(0xf000000).withOpacity(0.25),
    offset: Offset(0, 1),
    blurRadius: 3,
    spreadRadius: 0,
  );
}
