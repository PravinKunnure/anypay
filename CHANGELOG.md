# Changelog

All notable changes to this package will be documented in this file.
This project follows early-stage semantic versioning during development.


---

## [0.1.2] - 2026-01-13
- Minor bug fixing documentations changes

## [0.1.3] - 2026-01-13
- Minor bug fixing documentations changes


## [0.1.1] - 2026-01-02
- Minor bug fixing documentations changes

## [0.1.0] - 2026-01-02

### Added

* Official release of AnyPay as a **UI-agnostic, adapter-based payments plugin**.
* `PaymentAdapter` interface to integrate any payment provider.
* Unified `AnyPay.chargeWithName()` API.
* `PaymentOptions` model for standardized payment input.
* `PaymentResult` model with explicit payment states: `success`, `failed`, `pending`, `error`.
* Adapter registration system (`AnyPay.registerAdapter`).
* Developer-controlled UI for payment states.
* Overlay helper (`PaymentStatusOverlay`) and animated widget (`PaymentStatusWidget`) for optional status feedback.
* Improved testing and mocking capabilities.

### Changed

* Removed all built-in payment UI, checkout flow, and enforced animations.
* Dependency choice (Stripe, Razorpay, PayPal, etc.) delegated to the developer.
* Core package now focuses entirely on payment abstraction and status reporting.

### Breaking Changes

* Built-in payment UI and animations from previous dev versions are no longer included.
* Developers must implement their own UI and animations for success, failed, pending, or error states.

### Notes

* This release establishes the foundation architecture for AnyPay v0.1.0.
* Future releases may include optional UI helpers, animated overlays, and official adapters.

---

## [0.0.1-dev.7] - 2026-01-02

### Added / Changed

* Transitioned from UI-driven design to **adapter-based abstraction**.
* Documentation updated for the new architecture.
* Internal mock adapters introduced for testing.

### Breaking Changes

* All built-in UI and animations removed.

---

## [0.0.1-dev.5] - 2025-12-24

### Changed

* Work-in-progress refactoring of payment handling towards abstraction.

---

## [0.0.1-dev.3] - 2025-12-24

### Added

* Experimental UI components and payment state handling.

---

## [0.0.1-dev.1] - 2025-12-18

### Added

* Initial dev release with built-in UI prototype.
* Checkout and status screens.
* Customizable theme and animations.
* Example app simulating payment outcomes.
