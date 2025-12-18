import 'package:flutter/material.dart';
import 'models/payment_result.dart';
import 'theme/payment_theme.dart';

typedef PaymentCallback = Future<PaymentResult> Function();

class PaymentUI {
  static Future<void> open({
    required BuildContext context,
    required double amount,
    required String title,
    required PaymentCallback startPayment,
    PaymentTheme? theme, // nullable optional parameter
  }) async {
    final appliedTheme = theme ?? PaymentTheme.defaultTheme;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _CheckoutView(
          amount: amount,
          title: title,
          startPayment: startPayment,
          theme: appliedTheme,
        ),
      ),
    );
  }
}

// -------------------- Checkout Screen --------------------
class _CheckoutView extends StatefulWidget {
  final double amount;
  final String title;
  final PaymentCallback startPayment;
  final PaymentTheme theme;

  const _CheckoutView({
    required this.amount,
    required this.title,
    required this.startPayment,
    required this.theme,
  });

  @override
  State<_CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<_CheckoutView> {
  bool _loading = false;
  PaymentResult? _result;

  void _pay() async {
    setState(() => _loading = true);

    PaymentResult result = await widget.startPayment();

    setState(() {
      _loading = false;
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_result != null) {
      return _StatusView(
        result: _result!,
        theme: widget.theme,
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : ElevatedButton(
          onPressed: _pay,
          child: Text("Pay ₹${widget.amount.toStringAsFixed(2)}"),
        ),
      ),
    );
  }
}

// -------------------- Status Screen with Animations --------------------
class _StatusView extends StatefulWidget {
  final PaymentResult result;
  final PaymentTheme theme;

  const _StatusView({
    required this.result,
    required this.theme,
  });

  @override
  State<_StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<_StatusView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.theme.animationDuration,
    );

    if (widget.result.status == PaymentStatus.pending) {
      _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
        ..addListener(() => setState(() {}));
      _controller.repeat();
    } else {
      _animation = Tween<double>(begin: 0.5, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
      );
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color;

    switch (widget.result.status) {
      case PaymentStatus.success:
        icon = Icons.check_circle;
        color = widget.theme.success;
        break;
      case PaymentStatus.failure:
        icon = Icons.cancel;
        color = widget.theme.failure;
        break;
      case PaymentStatus.pending:
        icon = Icons.hourglass_empty;
        color = widget.theme.primary;
        break;
      default:
        icon = Icons.help_outline;
        color = widget.theme.primary;
    }

    Widget animatedIcon;
    if (widget.result.status == PaymentStatus.pending) {
      animatedIcon = Transform.rotate(
        angle: _animation.value * 6.28,
        child: Icon(icon, size: widget.theme.iconSize, color: color),
      );
    } else {
      animatedIcon = ScaleTransition(
        scale: _animation,
        child: Icon(icon, size: widget.theme.iconSize, color: color),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Payment Status")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            animatedIcon,
            const SizedBox(height: 16),
            Text(
              widget.result.message,
              style: widget.theme.textStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
