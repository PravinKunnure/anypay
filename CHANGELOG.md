# Changelog

All notable changes to this package will be documented in this file.
This project follows early-stage semantic versioning during development.

---

## [0.0.1-dev.7] - 2026-01-02

### Changed
- **Major architectural shift** from UI-based payment flows to a **UI-agnostic, adapter-based payment abstraction**.
- Removed built-in checkout and payment status UI as a core feature.
- Removed enforced animations and UI assumptions.
- Dependency choice (Stripe, Razorpay, PayPal, etc.) fully delegated to the developer.

### Added
- `PaymentAdapter` interface for integrating any payment provider.
- Unified `AnyPay.charge()` API.
- `PaymentOptions` model for standardized payment input.
- `PaymentResult` model with explicit payment states:
  - `success`
  - `failed`
  - `pending`
  - `error`
- Adapter registration system.
- Provider-agnostic execution flow.
- Improved testability through mock adapters.
- Documentation aligned with adapter-based architecture.

### Breaking Changes
- Built-in payment UI, checkout flow, and animations are no longer part of the core API.
- Developers must implement their own UI for payment states.

### Notes
- This release establishes the **foundation architecture** of AnyPay.
- Any future UI helpers or animations will be **optional and non-enforced**.

---

## [0.0.1-dev.5] - 2025-12-24

### Changed
- Began transitioning away from fixed payment UI assumptions.
- Internal exploration of abstraction-based payment handling.

### Notes
- Marked as work-in-progress.
- UI components considered experimental and unstable.

---

## [0.0.1-dev.3] - 2025-12-24

### Added
- Internal refactoring of payment UI components.
- Improved handling of payment states.
- Early groundwork for extensibility.

### Notes
- Package remained UI-driven.
- Work-in-progress release.

---

## [0.0.1-dev.1] - 2025-12-18

### Added
- Initial experimental dev release of AnyPay.
- Built-in payment UI prototype.
- Checkout flow with amount entry screen.
- Status screens for success, failure, and pending payments.
- Customizable `PaymentTheme`:
  - Colors
  - Text styles
  - Border radius
  - Animation configuration
- Animated payment result screens:
  - Bounce animation for success and failure
  - Rotating animation for pending
- Example app to simulate payment outcomes.
- Fully self-contained UI with no external payment SDKs.

---
