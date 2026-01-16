# AnyPay


## ⚠️ Disclaimer: The AnyPay package is still in early development and may contain bugs.

[![Pub Version](https://img.shields.io/pub/v/anypay)](https://pub.dev/packages/anypay) | [![License: MIT](https://img.shields.io/badge/license-MIT-green)](https://opensource.org/licenses/MIT)

AnyPay is a unified payments plugin for Flutter that provides a single, consistent API for integrating multiple payment providers. It uses an adapter-based architecture and is completely UI-agnostic, giving developers full control over how payment results are displayed.

AnyPay does not enforce or bundle any third-party payment SDKs. Developers are free to choose and integrate any payment provider they want.


---

## Features

* Unified payment API
* Adapter-based provider integration
* No forced dependencies (Stripe, Razorpay, etc.)
* No UI restrictions
* Supports payment states: success, failed, pending, error
* Easy to mock and test
* Lightweight and extensible
* Suitable for Indian and global payment flows

---

## Installation

```yaml
dependencies:
  anypay: <latest_version>
```

---

## Core Concept

AnyPay uses the Adapter Pattern.

Each payment provider implements `PaymentAdapter`.
AnyPay coordinates execution and returns a `PaymentResult` with proper status.

Developers choose which payment SDKs to integrate.

---

## Registering Payment Adapters

```dart
import 'package:anypay/anypay.dart';
import 'example_adapter.dart';
import 'mock_adapter.dart';

void main() {
  AnyPay.registerAdapter('example', ExampleAdapter());
  AnyPay.registerAdapter('mock', MockAdapter());

  runApp(const MyApp());
}
```

---

## Charging a Payment

```dart
final result = await AnyPay.chargeWithName(
  providerName: 'example',
  options: PaymentOptions(
    amount: 5000,
    currency: 'INR',
    metadata: {'orderId': 'ORD123'},
  ),
);
```

---

## Handling Payment Result

```dart
switch (result.status) {
  case PaymentStatus.success:
    // handle success UI
    break;
  case PaymentStatus.failed:
    // handle failed UI
    break;
  case PaymentStatus.pending:
    // handle pending UI
    break;
  case PaymentStatus.error:
    // handle error UI
    break;
}
```

---

## Example Widget

```dart
ElevatedButton(
  onPressed: () async {
    final result = await AnyPay.chargeWithName(
      providerName: 'example',
      options: PaymentOptions(amount: 5000, currency: 'INR'),
    );

    if (!context.mounted) return;

    _showDialog(context, result.status.name, result.message ?? '');
  },
  child: const Text('Pay with ExampleAdapter'),
);
```

---

## Example Adapter

```dart
class ExampleAdapter implements PaymentAdapter {
  @override
  Future<PaymentResult> charge(PaymentOptions options) async {
    await Future.delayed(const Duration(seconds: 1));

    return PaymentResult.success(
      transactionId: 'TXN123456',
      message: 'Payment successful',
    );
  }
}
```

---

## Notes

* AnyPay does not render UI
* AnyPay does not manage payment SDKs
* All logic lives inside adapters
* Easy to test using mock adapters

---

## Roadmap

* Official adapter templates
* Optional animated UI helpers
* Better logging hooks
* Testing utilities
