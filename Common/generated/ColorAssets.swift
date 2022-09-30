// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Colors {
  internal static let _000000 = ColorAsset(name: "000000")
  internal static let _00000000 = ColorAsset(name: "00000000")
  internal static let _19A800 = ColorAsset(name: "19A800")
  internal static let _1Ec800 = ColorAsset(name: "1EC800")
  internal static let _2C88A2 = ColorAsset(name: "2C88A2")
  internal static let _2F487D = ColorAsset(name: "2F487D")
  internal static let _333333 = ColorAsset(name: "333333")
  internal static let _381E1F = ColorAsset(name: "381E1F")
  internal static let _3B5998 = ColorAsset(name: "3B5998")
  internal static let _4783Ff = ColorAsset(name: "4783FF")
  internal static let _4A4A4A = ColorAsset(name: "4A4A4A")
  internal static let _4Cffffff = ColorAsset(name: "4CFFFFFF")
  internal static let _4D8Ad7 = ColorAsset(name: "4D8AD7")
  internal static let _636363 = ColorAsset(name: "636363")
  internal static let _666666 = ColorAsset(name: "666666")
  internal static let _80000000 = ColorAsset(name: "80000000")
  internal static let _888888 = ColorAsset(name: "888888")
  internal static let _999999 = ColorAsset(name: "999999")
  internal static let aaaaaa = ColorAsset(name: "AAAAAA")
  internal static let aaffffff = ColorAsset(name: "AAFFFFFF")
  internal static let b1B1B1 = ColorAsset(name: "B1B1B1")
  internal static let b3000000 = ColorAsset(name: "B3000000")
  internal static let b38D1E1E = ColorAsset(name: "B38D1E1E")
  internal static let c7A200 = ColorAsset(name: "C7A200")
  internal static let c8C8C8 = ColorAsset(name: "C8C8C8")
  internal static let cccccc = ColorAsset(name: "CCCCCC")
  internal static let ccffffff = ColorAsset(name: "CCFFFFFF")
  internal static let ddcb15 = ColorAsset(name: "DDCB15")
  internal static let dddddd = ColorAsset(name: "DDDDDD")
  internal static let dfb600 = ColorAsset(name: "DFB600")
  internal static let e0E6Ff = ColorAsset(name: "E0E6FF")
  internal static let e2F7Fd = ColorAsset(name: "E2F7FD")
  internal static let eaeaea = ColorAsset(name: "EAEAEA")
  internal static let eeeeee = ColorAsset(name: "EEEEEE")
  internal static let f0F0F0 = ColorAsset(name: "F0F0F0")
  internal static let f7E319 = ColorAsset(name: "F7E319")
  internal static let f7F7F7 = ColorAsset(name: "F7F7F7")
  internal static let f9F9F9 = ColorAsset(name: "F9F9F9")
  internal static let ff5757 = ColorAsset(name: "FF5757")
  internal static let ffffff = ColorAsset(name: "FFFFFF")
  internal static let commonProductTradeTypeFf = ColorAsset(name: "common_product_trade_type_ff")
  internal static let commonProductTradeTypeSl = ColorAsset(name: "common_product_trade_type_sl")
  internal static let highlight = ColorAsset(name: "highlight")
  internal static let primary = ColorAsset(name: "primary")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = Color(asset: self)

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
