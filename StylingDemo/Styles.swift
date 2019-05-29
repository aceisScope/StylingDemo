//
//  File.swift
//  StylingDemo
//
//  Created by Binghui Liu on 29/05/2019.
//  Copyright © 2019 Binghui Liu. All rights reserved.
//

import Foundation
import BonMot

extension UIFont {
    
    enum FontWeight: String {
        case bold = "Bold"
        case medium = "Medium"
        case light = "Light"
    }
    
    static func zillaslab(_ weight: FontWeight, _ size: CGFloat) -> UIFont {
        return UIFont(name: "ZillaSlab-\(weight.rawValue)", size: size)!
    }
}

class Styles {
    static let brownBody = StringStyle(.font(.zillaslab(.light, 20)), .color(.brown), .lineHeightMultiple(0.8), .headIndent(18), .adapt(.body))
    
    init() {
        NamedStyles.shared.registerStyle(forName: "BrownBody", style: Styles.brownBody)
    }
}
