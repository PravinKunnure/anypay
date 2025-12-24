import 'package:flutter/material.dart';
import 'payment_model.dart';
import 'themes.dart';

class AnyPayResult extends StatelessWidget {
  final PaymentStatus status;
  final AnyPayTheme theme;

  const AnyPayResult({
    super.key,
    required this.status,
    this.theme = const AnyPayTheme(),
  });

  @override
  Widget build(BuildContext context) {
    Widget content;

    switch (status) {
      case PaymentStatus.success:
        content = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: theme.successColor, size: 100),
            const SizedBox(height: 10),
            const Text("Payment Successful", style: TextStyle(fontSize: 18)),
          ],
        );
        break;
      case PaymentStatus.failure:
        content = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error, color: theme.failureColor, size: 100),
            const SizedBox(height: 10),
            const Text("Payment Failed", style: TextStyle(fontSize: 18)),
          ],
        );
        break;
      case PaymentStatus.pending:
        content = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: theme.primaryColor),
            const SizedBox(height: 10),
            const Text("Processing Payment...", style: TextStyle(fontSize: 18)),
          ],
        );
        break;
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: content,
    );
  }
}
