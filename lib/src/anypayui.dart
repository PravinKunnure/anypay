import 'package:anypay/src/card_payment.dart';
import 'package:anypay/src/net_banking.dart';
import 'package:anypay/src/upi_payment.dart';
import 'package:flutter/material.dart';
import 'payment_model.dart';
import 'anypay_result.dart';
import 'themes.dart';
import 'payment_gateway.dart';
import 'payment_options.dart';

/// AnyPay Widget
/// Combines payment options, gateway integration, and result screen
class AnyPay extends StatefulWidget {
  final String title;
  final PaymentGateway gateway;
  final double amount;
  final String currency;
  final AnyPayTheme theme;

  const AnyPay({
    super.key,
    required this.title,
    required this.gateway,
    required this.amount,
    this.currency = "INR",
    this.theme = const AnyPayTheme(),
  });

  @override
  State<AnyPay> createState() => _AnyPayState();
}

class _AnyPayState extends State<AnyPay> {
  PaymentStatus status = PaymentStatus.pending;
  String? selectedMethod;
  String? selectedApp;

  // Step 1: _startPayment stays here
  void _startPayment(String method, [String? app]) async {
    setState(() {
      status = PaymentStatus.pending;
      selectedMethod = method;
      selectedApp = app;
    });

    PaymentStatus result = await widget.gateway.pay(
      amount: widget.amount,
      currency: widget.currency,
      metadata: {"app": app},
      method: method,
    );

    setState(() {
      status = result;
    });
  }

  // Step 1: _onMethodSelected goes here
  void _onMethodSelected(String method) {
    if (method == "Card") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CardPaymentScreen(
              onPay: (cardNumber, expiry, cvv) =>
                  _startPayment("Card", cardNumber),
            ),
          ));
    } else if (method == "UPI") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => UpiPaymentScreen(
              apps: const ["Google Pay", "PhonePe", "Paytm", "BHIM"],
              onSelect: (app) => _startPayment("UPI", app),
            ),
          ));
    } else if (method == "NetBanking") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => NetBankingScreen(
              banks: const ["HDFC", "ICICI", "SBI", "Axis"],
              onSelect: (bank) => _startPayment("NetBanking", bank),
            ),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.theme.primaryColor,
      ),
      body: Center(
        child: selectedMethod == null
            ? PaymentOptions(
                onSelect: _onMethodSelected,
              ) // <-- Use _onMethodSelected here
            : AnyPayResult(status: status, theme: widget.theme),
      ),
    );
  }
}

// class _AnyPayState extends State<AnyPay> {
//   PaymentStatus status = PaymentStatus.pending;
//   String? selectedMethod;
//   String? selectedApp;
//
//   void _startPayment(String method, [String? app]) async {
//     setState(() {
//       status = PaymentStatus.pending;
//       selectedMethod = method;
//       selectedApp = app;
//     });
//
//     PaymentStatus result = await widget.gateway.pay(
//       amount: widget.amount,
//       currency: widget.currency,
//       metadata: {"app": app}, // pass selected UPI app
//       method: method,
//     );
//
//     setState(() {
//       status = result;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: widget.theme.primaryColor,
//       ),
//       body: Center(
//         child: selectedMethod == null
//             ? PaymentOptions(onSelected: _startPayment) // show pre-payment options
//             : AnyPayResult(status: status, theme: widget.theme), // show result
//       ),
//     );
//   }
// }

// class _AnyPayState extends State<AnyPay> {
//   PaymentStatus status = PaymentStatus.pending;
//   String? selectedMethod;
//
//   /// Trigger payment using the selected method
//   void _startPayment(String method) async {
//     setState(() {
//       status = PaymentStatus.pending; // show loading
//       selectedMethod = method;        // store selected payment method
//     });
//
//     // Call the gateway's pay method
//     PaymentStatus result = await widget.gateway.pay(
//       amount: widget.amount,
//       currency: widget.currency,
//       metadata: {},
//       method: method,
//     );
//
//     setState(() {
//       status = result; // update status to success/failure
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: widget.theme.primaryColor,
//       ),
//       body: Center(
//         child: selectedMethod == null
//             ? PaymentOptions(onSelected: _startPayment) // select payment method
//             : AnyPayResult(status: status, theme: widget.theme), // show result
//       ),
//     );
//   }
// }

////-----------------
// import 'package:flutter/material.dart';
// import 'payment_model.dart';
// import 'anypay_result.dart';
// import 'themes.dart';
//
// class AnyPay extends StatelessWidget {
//   final String title;
//   final PaymentStatus status;
//   final AnyPayTheme theme;
//
//   const AnyPay({
//     super.key,
//     required this.title,
//     required this.status,
//     this.theme = const AnyPayTheme(),
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//         backgroundColor: theme.primaryColor,
//       ),
//       body: Center(
//         child: AnyPayResult(
//           status: status,
//           theme: theme,
//         ),
//       ),
//     );
//   }
// }
