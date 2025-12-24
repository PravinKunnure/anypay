import 'package:flutter/material.dart';
import 'payment_model.dart';
import 'anypay_result.dart';
import 'themes.dart';

class AnyPay extends StatelessWidget {
  final String title;
  final PaymentStatus status;
  final AnyPayTheme theme;

  const AnyPay({
    super.key,
    required this.title,
    required this.status,
    this.theme = const AnyPayTheme(),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: theme.primaryColor,
      ),
      body: Center(
        child: AnyPayResult(
          status: status,
          theme: theme,
        ),
      ),
    );
  }
}
