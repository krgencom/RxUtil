//
//  Created by Krgencom
//

import Foundation
import UIKit

/**
 색상을 쓰기쉽게 extension 을 제공합니다.
 */
extension UIColor {
    // 웹 색상을 RGB 값으로 변환하는 메서드
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    // 16진수 문자열을 사용하여 UIColor 객체 생성
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let hexValue: String
        if hex.hasPrefix("#") {
            hexValue = String(hex.dropFirst())
        } else {
            hexValue = hex
        }
        
        let scanner = Scanner(string: hexValue)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
            let red = CGFloat((hexNumber & 0xFF0000) >> 16) / 255
            let green = CGFloat((hexNumber & 0x00FF00) >> 8) / 255
            let blue = CGFloat(hexNumber & 0x0000FF) / 255
            
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        } else {
            self.init(red: 0, green: 0, blue: 0, alpha: alpha)
        }
    }
    
    // 미리 정의된 웹 색상들
    static let cff0000 = UIColor(hex: "#FF0000")
    static let webGreen = UIColor(hex: "#008000")
    static let webBlue = UIColor(hex: "#0000FF")
    static let webYellow = UIColor(hex: "#FFFF00")
    static let webCyan = UIColor(hex: "#00FFFF")
    static let webMagenta = UIColor(hex: "#FF00FF")
    static let webOrange = UIColor(hex: "#FFA500")
    static let webPurple = UIColor(hex: "#800080")
}
