//
//  TextStyle.swift
//  TextStyle
//
//  Created by Przemyslaw Bobak on 17/02/2020.
//  Copyright © 2020 Przemyslaw Bobak. All rights reserved.
//

import UIKit

@propertyWrapper
public struct TextStyle<T: UILabel> {
    public var wrappedValue: T {
        didSet {
            setTextStyle()
        }
    }
    public private(set) var textStyle: UIFont.TextStyle
    public private(set) var textColor: UIColor

    public init(wrappedValue: T, _ textStyle: UIFont.TextStyle, textColor: UIColor = .text) {
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
        wrappedValue.textColor = textColor
    }
}
