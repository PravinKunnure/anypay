import 'package:anypay/anypay.dart';
import 'package:flutter/material.dart';

class PaymentStatusWidget extends StatefulWidget {
  final PaymentStatus status;
  final String message;
  final VoidCallback? onDismissed;

  const PaymentStatusWidget({
    super.key,
    required this.status,
    required this.message,
    this.onDismissed, // callback when animation ends
  });

  @override
  State<PaymentStatusWidget> createState() => _PaymentStatusWidgetState();
}

class _PaymentStatusWidgetState extends State<PaymentStatusWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    // Auto-dismiss after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _controller.reverse().then((value) {
          widget.onDismissed?.call(); // let overlay remove itself
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Icon icon;

    switch (widget.status) {
      case PaymentStatus.success:
        bgColor = Colors.green;
        icon = const Icon(Icons.check_circle, color: Colors.white);
        break;
      case PaymentStatus.failed:
        bgColor = Colors.red;
        icon = const Icon(Icons.cancel, color: Colors.white);
        break;
      case PaymentStatus.pending:
        bgColor = Colors.orange;
        icon = const Icon(Icons.hourglass_top, color: Colors.white);
        break;
      case PaymentStatus.error:
        bgColor = Colors.grey;
        icon = const Icon(Icons.warning, color: Colors.white);
        break;
    }

    return SlideTransition(
      position: _offsetAnimation,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  widget.message,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
