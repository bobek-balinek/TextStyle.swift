# @TextStyle
Property wrapper that allows to set a text style and text color on a label.

# Declaration:

`@TextStyle` property wrapper

```
@propertyWrapper
public struct TextStyle<T: UILabel> {
    public var wrappedValue: T {
        didSet {
            setTextStyle()
        }
    }
    public private(set) var textStyle: UIFont.TextStyle
    public private(set) var textColor: UIColor?

    public init(wrappedValue: T, _ textStyle: UIFont.TextStyle, textColor: UIColor? = nil) {
        self.wrappedValue = wrappedValue
        self.textStyle = textStyle
        self.textColor = textColor
        setTextStyle()
    }

    func setTextStyle() {
        wrappedValue.font = UIFont.preferredFont(forTextStyle: textStyle)
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
        wrappedValue.adjustsFontForContentSizeCategory = true
        wrappedValue.numberOfLines = 0
        if let value = textColor {
            wrappedValue.textColor = value
        }
    }
}
```

# Usage

```
@TextStyle(.headline, textColor: .blue) var label = UILabel()
```


## Installation

Property wrappers are defined in Swift 5.1.
Using @TextStyle requires Xcode 11.0(and above) and Swift 5.1 toolchain


### Swift Package Manager

Add
`.package(url: "https://github.com/bobek-balinek/TextStyle.swift.git", from: "1.0.0")`
to your `Package.swift` file's `dependencies`.

If youre using Xcode 11.0 add this Swift Package to your target(s) using Xcode.
