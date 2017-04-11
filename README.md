# SwiftExtensions
SwiftExtension is a bunch of useful extension, that we are using at Stfalcon.

1. DeviceType: *modelName* returns the name of current device.
2. Dispatch: has *once* function that can be used instead of old dispatch_once C function.
3. MutableData: has useful extension *appendString(_ string: String)*.
4. OperatorOverloading: as the name says is a collection of overloads for numeric arrays, CGRect, CGPoint and CGSize.
5. Realm: has extension to work with Realm (https://realm.io), and RealmHelper that provides access to get *object* from Realm and to *deleteAll*.
6. UILabel: contains func *setTextWithLineSpacing(text: String, lineHeight: CGFloat)* which is convenient to set line spacing if it differs from line spacing in the label's font; func *boundingRectForCharacterRange(range: NSRange)* allow to detect frame of substring in range, which is useful when you need to make some text clickable.    
7. UIScrollView: has *calculateContentSize(offset: CGFloat, font: UIFont)* method, that calculates height of UILabels inside UIScrollView.
8. UIView: has *gradientSublayer(colorA: UIColor = UIColor.red, colorB: UIColor = UIColor.green)* that you can use to create gradient button or any other UIView; *addDashedLine(startPoint: CGPoint, endPoint: CGPoint, color: UIColor, lineWidth: CGFloat, step: Int)* useful for creation dashed lines; *snapshotImage() -> UIImage?* returns UIImage snapshot of ui, and *snapshotImageView() -> UIImageView?* returns UIImageView with ui snapshot.
9. UIViewController: has *topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController?* method, that returns top view controller. 
10. String extensions contains list of funcs, which allow to work with Swift strings, substrings, ranges of substrings similar to NSString.
