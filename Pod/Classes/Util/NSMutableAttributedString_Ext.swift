//
//  UIColor_Ext.swift
//
//  Created by RemarkableSoft
//
import Foundation
import UIKit

/**
  Example
    lbl.attributedText = NSMutableAttributedString()
        .regular(string: "문자열 실험", fontSize: 12)
        .bold(string: " bold 굵은 부분 ", fontSize: 16)
        .orangeHighlight("오렌지 ")
        .blackHighlight("블랙")
        .underlined("언더라인")
 */
extension NSMutableAttributedString {

    var fontSize: CGFloat {
        return 14
    }
    var boldFont: UIFont {
        return UIFont(name: "AvenirNext-Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
    }
    
    var normalFont: UIFont {
        return UIFont(name: "AvenirNext-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    func bold(string: String, fontSize: CGFloat, color: UIColor? = nil) -> NSMutableAttributedString {
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        if color == nil {
            let attributes: [NSAttributedString.Key: Any] = [.font: font]
            self.append(NSAttributedString(string: string, attributes: attributes))
        } else {
            let attributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: color as Any]
            self.append(NSAttributedString(string: string, attributes: attributes))
        }
        return self
    }

    func regular(string: String, fontSize: CGFloat, color: UIColor? = nil) -> NSMutableAttributedString {
        let font = UIFont.systemFont(ofSize: fontSize)
        if color == nil {
            let attributes: [NSAttributedString.Key: Any] = [.font: font]
            self.append(NSAttributedString(string: string, attributes: attributes))
        } else {
            let attributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: color as Any]
            self.append(NSAttributedString(string: string, attributes: attributes))
        }
        return self
    }
    
    func regularUnderlined(string: String, fontSize: CGFloat, color: UIColor? = nil) -> NSMutableAttributedString {
        let font = UIFont.systemFont(ofSize: fontSize)
        if color == nil {
            let attributes: [NSAttributedString.Key: Any] = [.font: font, .underlineStyle : NSUnderlineStyle.single.rawValue]
            self.append(NSAttributedString(string: string, attributes: attributes))
        } else {
            let attributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: color as Any, .underlineStyle : NSUnderlineStyle.single.rawValue]
            self.append(NSAttributedString(string: string, attributes: attributes))
        }
        return self
    }
    
    func boldUnderlined(string: String, fontSize: CGFloat, color: UIColor? = nil) -> NSMutableAttributedString {
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        if color == nil {
            let attributes: [NSAttributedString.Key: Any] = [.font: font, .underlineStyle : NSUnderlineStyle.single.rawValue]
            self.append(NSAttributedString(string: string, attributes: attributes))
        } else {
            let attributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: color as Any, .underlineStyle : NSUnderlineStyle.single.rawValue]
            self.append(NSAttributedString(string: string, attributes: attributes))
        }
        return self
    }
}
