<<<<<<< HEAD
# anypay
AnyPay is a lightweight Flutter package for displaying   customizable payment UI with animated result screens for   success, failure, and pending states. Fully themable and   easy to integrate into any Flutter app.
=======
# AnyPay Flutter Package

A lightweight Flutter package for displaying **customizable payment UI**.  
Allows developers to integrate payment flows with **attractive result animations** for success, failure, and pending states.

---

## Features

- Checkout screen with amount and title.
- Result screen with animated icons:
    - Bounce for success/failure.
    - Rotation for pending.
- Fully customizable `PaymentTheme`:
    - Colors: primary, success, failure
    - Text style, border radius
    - Icon size & animation speed
- Example project included for quick testing.
- Lightweight: **No external dependencies**.

---

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  anypay: latest_version


import 'package:anypay/anypay.dart';

// Launch payment UI
PaymentUI.open(
  context: context,
  amount: 499,
  title: "Order Payment",
  startPayment: () async {
    // Simulate payment process
    await Future.delayed(Duration(seconds: 2));
    return const PaymentResult(
      status: PaymentStatus.success,
      message: "Payment successful!",
    );
  },
  theme: const PaymentTheme(
    primary: Colors.orange,
    success: Colors.greenAccent,
    failure: Colors.redAccent,
    iconSize: 120,
    animationDuration: Duration(milliseconds: 1000),
    textStyle: TextStyle(fontSize: 18),
    borderRadius: 12,
  ),
);
>>>>>>> 6bb5239 (Update README.md with latest info)
