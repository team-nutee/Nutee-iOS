//
//  UIColor+Extension.swift
//  Nutee
//
//  Created by Junhyeon on 2020/01/24.
//  Copyright © 2020 S.OWL. All rights reserved.
//

import UIKit

extension UIColor {
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }

    @nonobjc class var veryLightPink: UIColor {
      return UIColor(white: 209.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var nuteeGreen: UIColor {
        return UIColor(red: 19.0 / 255.0, green: 194.0 / 255.0, blue: 118.0 / 255.0 , alpha: 1.0)
    }
    
    @nonobjc class var pantoneGreen2019: UIColor {
        return UIColor(red: 129.0 / 255.0, green: 228.0 / 255.0, blue: 189.0 / 255.0 , alpha: 1.0)
    }
    
    @nonobjc class var pantoneGreen2020: UIColor {
        return UIColor(red: 0 / 255.0, green: 135.0 / 255.0, blue: 58.0 / 255.0 , alpha: 0.6)
    }
    
    @nonobjc class var nuteeGreen2: UIColor {
        return UIColor(red: 239 / 255.0, green: 251.0 / 255.0, blue: 245.0 / 255.0 , alpha: 1.0)
    }

    @nonobjc class var commentWindowLight: UIColor {
        return UIColor(red: 230 / 255.0, green: 234.0 / 255.0, blue: 240.0 / 255.0 , alpha: 1.0)
    }
    
    @nonobjc class var commentWindowDark: UIColor {
        return UIColor(red: 20 / 255.0, green: 22.0 / 255.0, blue: 23.0 / 255.0 , alpha: 1.0)
    }
}
