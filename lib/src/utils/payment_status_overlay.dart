import 'package:anypay/anypay.dart';
import 'package:flutter/material.dart';
import 'payment_status_widget.dart';

class PaymentStatusOverlay {
  /// Show a payment status overlay at the bottom
  static void show(
    BuildContext context, {
    required PaymentStatus status,
    required String message,
    Duration duration = const Duration(seconds: 2),
  }) {
    final overlay = Overlay.of(context); // safety check

    final entry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50,
        left: 16,
        right: 16,
        child: PaymentStatusWidget(
          status: status,
          message: message,
        ),
      ),
    );

    overlay.insert(entry);

    Future.delayed(duration, () {
      if (entry.mounted) {
        entry.remove();
      }
    });
  }
}
