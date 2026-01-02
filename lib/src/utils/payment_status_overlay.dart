import 'package:anypay/anypay.dart';
import 'package:flutter/material.dart';

class PaymentStatusOverlay {
  static void show(BuildContext context,
      {required PaymentStatus status, required String message}) {
    final overlay = Overlay.of(context);

    final entry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50,
        left: 0,
        right: 0,
        child: PaymentStatusWidget(status: status, message: message),
      ),
    );

    overlay.insert(entry);

    Future.delayed(const Duration(seconds: 2), () {
      entry.remove();
    });
  }
}
