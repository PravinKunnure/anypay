# Changelog

All notable changes to this package will be documented in this file.

## [0.0.1-dev.1] - 2025-12-18
### Added
- Initial dev release of AnyPay Flutter package.
- `PaymentUI` for launching payment checkout screens.
- `_CheckoutView` for amount entry and payment initiation.
- `_StatusView` to show payment results (success, failure, pending).
- Customizable `PaymentTheme`:
    - Primary, success, failure colors.
    - Text style and border radius.
    - Icon size and animation duration.
- Animations for payment results:
    - Bounce animation for success/failure.
    - Rotating animation for pending.
- Example project with buttons to simulate success, failure, and pending states.
- Fully self-contained: no external dependencies for animations.
