import 'package:flutter/material.dart';

class PaymentTheme {
  final Color primary;
  final Color success;
  final Color failure;
  final TextStyle textStyle;
  final double borderRadius;

  // Animation customization
  final double iconSize;
  final Duration animationDuration;

  const PaymentTheme({
    required this.primary,
    required this.success,
    required this.failure,
    required this.textStyle,
    required this.borderRadius,
    this.iconSize = 100,
    this.animationDuration = const Duration(milliseconds: 800),
  });

  // Default theme
  static const PaymentTheme defaultTheme = PaymentTheme(
    primary: Colors.indigo,
    success: Colors.green,
    failure: Colors.red,
    textStyle: TextStyle(fontSize: 16, color: Colors.black),
    borderRadius: 8,
    iconSize: 100,
    animationDuration: Duration(milliseconds: 800),
  );
}
