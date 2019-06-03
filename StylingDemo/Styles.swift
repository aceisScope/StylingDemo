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
    static let brownBody = StringStyle(.font(.zillaslab(.medium, 20)), .color(.brown), .lineHeightMultiple(0.8), .headIndent(18))
    static let magentaTracking = StringStyle(.font(.zillaslab(.medium, 20)), .color(.magenta), .lineHeightMultiple(0.8), .headIndent(18), .tracking(.point(0.5)))
    static let xmlStyle = StringStyle(
        .font(.zillaslab(.medium, 20)),
        .lineSpacing(20),
        .xmlRules([
            .style("large", StringStyle(
                .font(.zillaslab(.bold, 20)),
                .lineSpacing(40),
                .adapt(.control))),
            .style("kern", StringStyle(
                .tracking(.adobe(-80))
            )),
            ])
    )
    static let lightStyle = StringStyle(.font(.zillaslab(.light, 20)), .lineHeightMultiple(1.2))
    static let leftLabel = StringStyle(.font(.zillaslab(.bold, 40)), .color(.darkGray), .alignment(.right))
    static let rightLabel = StringStyle(.font(.systemFont(ofSize: 40)), .color(.lightGray))
    
    init() {
        NamedStyles.shared.registerStyle(forName: "BrownBody", style: Styles.brownBody)
        NamedStyles.shared.registerStyle(forName: "MagentaTracking", style: Styles.magentaTracking)
        NamedStyles.shared.registerStyle(forName: "XmlStyle", style: Styles.xmlStyle)
        NamedStyles.shared.registerStyle(forName: "LeftLabel", style: Styles.leftLabel)
        NamedStyles.shared.registerStyle(forName: "RightLabel", style: Styles.rightLabel)
    }
}
