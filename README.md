# Flutter In-App Subscription Integration using `in_app_purchase`

This repository demonstrates how to integrate **in-app subscriptions** in a Flutter application using the [`in_app_purchase`](https://pub.dev/packages/in_app_purchase) package. The guide includes step-by-step instructions for setting up in-app subscriptions for both **Google Play Store** and **Apple App Store**, along with introductory offers.

## Features

- Subscription handling for both iOS and Android.
- Fetching products and subscription plans from stores.
- Managing purchases and handling billing.
- Handling introductory offers on both stores.

## Prerequisites

1. **Flutter SDK**: Make sure Flutter is installed. [Installation Guide](https://flutter.dev/docs/get-started/install)
2. **Google Play Console**: To configure in-app purchases for Android.
3. **App Store Connect**: To configure in-app purchases for iOS.

## Setup

### 1. Add Dependencies

In your `pubspec.yaml`, add the following dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
  in_app_purchase: ^3.0.6
```

### 2. Configure iOS

- In **Xcode**, go to **Signing & Capabilities** and enable and create product **In-App Subscription**.
- Ensure that your app’s bundle ID matches the one registered in **App Store Connect**.
- Set up your **In-App Purchase** items in **App Store Connect**.

#### Enable StoreKit Testing

For local testing, you can enable StoreKit testing using Xcode:
- Open the `ios` project in Xcode.
- In the **Scheme Editor**, select **Run**, then go to **Options**.
- Under **StoreKit Configuration**, select the StoreKit configuration file for testing.

### 3. Configure Android

- Open `android/app/build.gradle` and ensure you have:
  ```groovy
  def billing_version = "5.0.0"
  ```

- Add the following permission in `AndroidManifest.xml`:
  ```xml
  <uses-permission android:name="com.android.vending.BILLING" />
  ```

- Set up **In-App Purchase** products in the **Google Play Console** under **Monetize > Products > Subscriptions**.

### 4. Initialize `in_app_purchase`

Add the initialization code to your app:

```dart
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InAppPurchase.instance.isAvailable().then((isAvailable) {
    if (isAvailable) {
      // Proceed with fetching and displaying products
    } else {
      // Handle store unavailability
    }
  });
  runApp(MyApp());
}
```

### 5. Fetch Available Subscriptions

```dart
Future<void> fetchSubscriptions() async {
  final bool available = await InAppPurchase.instance.isAvailable();
  if (!available) {
    // Handle store not available
    return;
  }

  const Set<String> _kIds = <String>{'subscription_id_1', 'subscription_id_2'};
  final ProductDetailsResponse response = await InAppPurchase.instance.queryProductDetails(_kIds);
  if (response.notFoundIDs.isNotEmpty) {
    // Handle missing products
  }
  final List<ProductDetails> products = response.productDetails;
  // Process and display the available subscriptions
}
```

### 6. Handling Purchases

```dart
void handlePurchaseUpdates() {
  final Stream<List<PurchaseDetails>> purchaseUpdates = InAppPurchase.instance.purchaseStream;
  purchaseUpdates.listen((purchases) {
    for (PurchaseDetails purchase in purchases) {
      if (purchase.status == PurchaseStatus.pending) {
        // Handle pending purchase
      } else if (purchase.status == PurchaseStatus.purchased) {
        // Verify purchase and grant entitlement
        InAppPurchase.instance.completePurchase(purchase);
      } else if (purchase.status == PurchaseStatus.error) {
        // Handle purchase error
      }
    }
  });
}
```

## Creating Introductory Offers

### App Store (iOS)

1. Log in to [App Store Connect](https://appstoreconnect.apple.com/).
2. Navigate to **My Apps** > **Your App** > **Features** > **In-App Purchases**.
3. Create a new subscription or select an existing one.
4. Scroll down to **Subscription Prices** and click **Add Introductory Offer**.
5. Choose the introductory offer type (free trial, pay-as-you-go, pay-up-front), and set the pricing details.

### Play Store (Android)

1. Log in to the [Google Play Console](https://play.google.com/console/).
2. Navigate to **Monetize** > **Products** > **Subscriptions**.
3. Select your subscription product.
4. In the **Introductory pricing** section, click **Add**.
5. Set up the introductory pricing duration and price.

## Links

- [`in_app_purchase` package documentation](https://pub.dev/packages/in_app_purchase)
- [App Store In-App Purchases Guide](https://developer.apple.com/in-app-purchase/)
- [Google Play Billing Guide](https://developer.android.com/google/play/billing/integrate)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
