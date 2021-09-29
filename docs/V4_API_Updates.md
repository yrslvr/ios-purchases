## RevenueCat V4 API updates
There were various updates to our API when we migrated the ObjC pieces to Swift. Most were unavoidable, 
but a number of updates make our Swift API more idomatic. We'll be updating this list as we continue to release betas.

To start us off, Our framework name changed from `Purchases` to `RevenueCat` 😻!

### Known Issues

#### ObjC + SPM
If you expose any Purchases objects from one target to another (see [example project](https://github.com/taquitos/SPMBug)
for what this could look like), that second target will not build due to a missing autogenerated header.
Currently there is a known bug in SPM whereby Xcode either doesn't pass the RevenueCat ObjC generated interface to SPM,
or SPM just doesn't integrate it. You can follow along: [SR-15154](https://bugs.swift.org/browse/SR-15154). 

##### Workaround: 
You must manually add the autogenerated file we committed to the repository
[RevenueCat-Swift.h](https://github.com/RevenueCat/purchases-ios/blob/main/IntegrationTests/CommonFiles/RevenueCat-Swift.h)
to your project, and `#import RevenueCat-Swift.h` in your bridging header. You can see how we do this in our
[SPMIntegration project](https://github.com/RevenueCat/purchases-ios/tree/main/IntegrationTests/SPMIntegration).

### ObjC Changes

`@import Purchases` is now `@import RevenueCat`

<table>
	<thead>
		<tr>
			<th>Old API</th>
			<th>New API</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>(RCPurchasesErrorCode).RCOperationAlreadyInProgressError</td>
			<td>RCOperationAlreadyInProgressForProductError</td>
		</tr>
		<tr>
			<td>RCBackendErrorDomain</td>
			<td>RCBackendErrorCodeDomain</td>
		</tr>
		<tr>
			<td>RCPurchasesErrorDomain</td>
			<td>RCPurchasesErrorCodeDomain</td>
		</tr>
		<tr>
			<td>RCFinishableKey</td>
			<td>RCErrorDetails.RCFinishableKey</td>
		</tr>
	</tbody>
</table>

### Type Changes for Swift

`import Purchases` is now `import RevenueCat`

<table>
	<thead>
		<tr>
			<th>Old type name</th>
			<th>New type name</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Purchases.Offering</td>
			<td>Offering</td>
		</tr>
		<tr>
			<td>Purchases.RevenueCatBackendErrorCode</td>
			<td>RCBackendErrorCodeDomain</td>
		</tr>
		<tr>
			<td>Purchases.ErrorCode.Code</td>
			<td>RCPurchasesErrorCodeDomain</td>
		</tr>
		<tr>
			<td>Purchases.Package</td>
			<td>Package</td>
		</tr>
		<tr>
			<td>Purchases.PurchaserInfo</td>
			<td>PurchaserInfo</td>
		</tr>
		<tr>
			<td>Purchases.EntitlementInfos</td>
			<td>EntitlementInfos</td>
		</tr>
		<tr>
			<td>Purchases.Transaction</td>
			<td>Transaction</td>
		</tr>
		<tr>
			<td>Purchases.EntitlementInfo</td>
			<td>EntitlementInfo</td>
		</tr>
		<tr>
			<td>Purchases.PeriodType</td>
			<td>PeriodType</td>
		</tr>
		<tr>
			<td>Purchases.Store</td>
			<td>Store</td>
		</tr>
		<tr>
			<td>RCPurchaseOwnershipType</td>
			<td>PurchaseOwnershipType</td>
		</tr>
		<tr>
			<td>RCAttributionNetwork</td>
			<td>AttributionNetwork</td>
		</tr>
		<tr>
			<td>Purchases.ErrorUtils</td>
			<td>ErrorUtils</td>
		</tr>
		<tr>
			<td>RCIntroEligibility</td>
			<td>IntroEligibility</td>
		</tr>
		<tr>
			<td>RCIntroEligibilityStatus</td>
			<td>IntroEligibilityStatus</td>
		</tr>
		<tr>
			<td>Purchases.LogLevel</td>
			<td>LogLevel</td>
		</tr>
		<tr>
			<td>Purchases.ReceivePurchaserInfoBlock</td>
			<td>ReceivePurchaserInfoBlock</td>
		</tr>
		<tr>
			<td>ReadableErrorCodeKey</td>
			<td>ErrorDetails.readableErrorCodeKey</td>
		</tr>
		<tr>
			<td>RCFinishableKey</td>
			<td>ErrorDetails.finishableKey</td>
		</tr>
		<tr>
			<td>RCDeferredPromotionalPurchaseBlock</td>
			<td>DeferredPromotionalPurchaseBlock</td>
		</tr>
		<tr>
			<td>Purchases.Offerings</td>
			<td>Offerings</td>
		</tr>
		<tr>
			<td>Purchases.PackageType</td>
			<td>PackageType</td>
		</tr>
		<tr>
			<td>Purchases.ReceiveOfferingsBlock</td>
			<td>ReceiveOfferingsBlock</td>
		</tr>
		<tr>
			<td>Purchases.ReceiveProductsBlock</td>
			<td>ReceiveProductsBlock</td>
		</tr>
		<tr>
			<td>Purchases.PurchaseCompletedBlock</td>
			<td>PurchaseCompletedBlock</td>
		</tr>
		<tr>
			<td>Purchases.PaymentDiscountBlock</td>
			<td>PaymentDiscountBlock</td>
		</tr>
	</tbody>
</table>

### API Changes for Swift
<table>
	<thead>
		<tr>
			<th>Old API</th>
			<th>New API</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>logIn(_ appUserId, _ completion)</td>
			<td>login(appUserId:completionBlock)</td>
		</tr>
		<tr>
			<td>purchaserInfo(_ completion)</td>
			<td>purchaserInfo(completionBlock)</td>
		</tr>
		<tr>
			<td>offerings(_completion)</td>
			<td>offerings(completionBlock)</td>
		</tr>
		<tr>
			<td>products(_ productIdentifiers, _ completion)</td>
			<td>products(identifiers:completionBlock)</td>
		</tr>
		<tr>
			<td>purchaseProduct(_ product, _ completion)</td>
			<td>purchase(product, completion)</td>
		</tr>
		<tr>
			<td>purchasePackage(_ package, _ completion)</td>
			<td>purchase(package, completion)</td>
		</tr>
		<tr>
			<td>restoreTransactions(_completion)</td>
			<td>restoreTransactions(completionBlock)</td>
		</tr>
		<tr>
			<td>syncPurchases(_ completion)</td>
			<td>syncPurchases(completionBlock)</td>
		</tr>
		<tr>
			<td>paymentDiscount(for:product:completion)</td>
			<td>paymentDiscount(forProductDiscount:product:completion)</td>
		</tr>
		<tr>
			<td>purchaseProduct(_:discount:_)</td>
			<td>purchase(product:discount:completion:)</td>
		</tr>
		<tr>
			<td>purchasePackage(_:discount:_)</td>
			<td>purchase(package:discount:completion:)</td>
		</tr>
	</tbody>
</table>


## Reporting undocumented issues:
Feel free to file an issue! [New RevenueCat Issue](https://github.com/RevenueCat/purchases-ios/issues/new/).