//
//  UIColor_Ext.swift
//
//  Created by RemarkableSoft
//
import Foundation
import UIKit
import StoreKit
import SnapKit
// MARK: 폰트 사이즈
let pt9          = 11.0
let pt10         = 12.0
let pt11         = 13.0
let pt12         = 14.0
let pt13         = 15.0
let pt14         = 16.0
let pt15         = 17.0
let pt16         = 19.0
let pt17         = 20.0
let pt18         = 21.5
let pt20         = 24.0
let pt21         = 25.0
let pt22         = 26.0
let pt24         = 28.0
let pt26         = 31.0
let pt28         = 33.5
let pt30         = 36.0


/**
 컬러에 대한 편의 기능을 제공합니다.
 */
extension UIColor {
    /// RGB가 각각 `red`, `green`, `blue`이고 opacity는 `a`인 Color object 반환
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: a
        )
    }
}

// MARK: - UIColor
/**
 컬러에 대한 편의 기능을 제공합니다.
 */
extension UIColor {
    /// RGB가 `hex`, opacity는 1에 해당하는 Color object 반환
    convenience init(intHex: Int) {
        self.init(
            red: (intHex >> 16) & 0xff,
            green: (intHex >> 8) & 0xff,
            blue: intHex & 0xff
        )
    }
    
    convenience init(hex: String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            self.init()
        } else {

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: CGFloat(1.0))
            
        }
    }
    
    // Opacity값이 `opacity`인 Color object 반환
    func alpha(_ opacity: CGFloat) -> UIColor {
        return self.withAlphaComponent(opacity)
    }
}

// MARK: - UILabel
/**
 컬러에 대한 편의 기능을 제공합니다.
 */
extension UILabel {
    /// Opacity값이 `opacity`인 Color object 반환
    func text(_ text: String?, _ color:String, _ size:CGFloat, _ isBold:Bool) -> Void {
        self.text = text
        self.numberOfLines = 0
        self.textColor = UIColor.init(hex: color)
        if (isBold) {
//            self.font = UIFont.boldSystemFont(ofSize: size)
            self.font = UIFont(name: "NanumSquareEB", size: size)
        } else {
//            self.font = UIFont.systemFont(ofSize: size)
            self.font = UIFont(name: "NanumSquareL", size: size)

        }
    }
}

// MARK: - UIButton
/**
 컬러에 대한 편의 기능을 제공합니다.
 */
extension UIButton {
    /// Opacity값이 `opacity`인 Color object 반환
    func setTitle(_ text: String, _ color:String, _ size:CGFloat, _ isBold:Bool) -> Void {
        self.setTitle(text, for: UIControl.State.normal)
        self.setTitleColor(UIColor.init(hex: color), for: UIControl.State.normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        
        if (isBold) {
            self.titleLabel?.font = UIFont(name: "NanumSquareEB", size: size)
        } else {
            self.titleLabel?.font = UIFont(name: "NanumSquareL", size: size)
        }
    }
}

// MARK: - UIView : 부분 둥근 스타일
/**
 컬러에 대한 편의 기능을 제공합니다.
 */
extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
    
    func setRound(radius: CGFloat, borderColor: String = "#ffffff", borderWidth: CGFloat = 0) {
        self.layer.cornerRadius = radius
        self.layer.borderColor = UIColor.init(hex: borderColor).cgColor
        self.layer.borderWidth = borderWidth
        self.clipsToBounds = true
    }
    
    func setRounCorner(radius: CGFloat, borderColor: String = "#ffffff", borderWidth: CGFloat = 0,
                       leftTop:Bool = true, rightTop:Bool = true,
                       rightBottom:Bool = true, leftBottom:Bool = true) {
        self.layer.cornerRadius = radius
        self.layer.borderColor = UIColor.init(hex: borderColor).cgColor
        self.layer.borderWidth = borderWidth
        
        var corner = CACornerMask()
        if leftTop {
            corner.insert(.layerMinXMinYCorner)
        }
        if rightTop {
            corner.insert(.layerMaxXMinYCorner)

        }
        if rightBottom {
            corner.insert(.layerMaxXMaxYCorner)
        }
        if leftBottom {
            corner.insert(.layerMinXMaxYCorner)

        }
        self.layer.maskedCorners = corner
        self.clipsToBounds = true
    }
    
    func addShadow(_ height:Int = 2) {
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.3
    }
}

// MARK: - UITableField
/**
 컬러에 대한 편의 기능을 제공합니다.
 */
extension UITextField {
    func text(_ text: String, _ color:String, _ size:CGFloat, _ isBold:Bool) -> Void {
        self.text = text
        self.textColor = UIColor.init(hex: color)
        if (isBold) {
            self.font = UIFont.boldSystemFont(ofSize: size)
        } else {
            self.font = UIFont.systemFont(ofSize: size)
        }
        self.autocorrectionType = .no
        self.addDoneButtonOnKeyboard()
        self.autocapitalizationType = .none
    }
    
    // TextField 좌측 여백 설정
    func addLeftPadding(_ leftPadding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(self.doneButtonAction))
        done.tintColor = .systemBlue
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        self.inputAccessoryView = doneToolbar
    }
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}

/**
 컬러에 대한 편의 기능을 제공합니다.
 */
extension UITextView {
    func text(_ text: String, _ color:String, _ size:CGFloat, _ isBold:Bool) -> Void {
        self.text = text
        self.textColor = UIColor.init(hex: color)
        if (isBold) {
            self.font = UIFont.boldSystemFont(ofSize: size)
        } else {
            self.font = UIFont.systemFont(ofSize: size)
        }
        self.autocorrectionType = .no
        self.addDoneButtonOnKeyboard()
        self.autocapitalizationType = .none
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(self.doneButtonAction))
        done.tintColor = .systemBlue
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}

// MARK: - String
/**
 컬러에 대한 편의 기능을 제공합니다.
 */
extension String {
    // URL 인코딩 : 텍스트 전체 인코딩
    func urlEncParam() -> String {
        guard let encodedStr = self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return ""
        }
        return encodedStr
    }
    // URL 인코딩 : 파라미터 부분만 인코딩
    func urlEnc() -> String {
        guard let encodedStr = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return ""
        }
        return encodedStr
    }
    
    func color() -> UIColor {
        return UIColor.init(hex: self)
    }
    
    func priceFormat() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: Int(self) ?? 0))!
    }
    
    func substring(from: Int, to: Int) -> String {
        guard from < count, to >= 0, to - from >= 0 else {
            return ""
        }
        
        // Index 값 획득
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to + 1) // '+1'이 있는 이유: endIndex는 문자열의 마지막 그 다음을 가리키기 때문
        
        // 파싱
        return String(self[startIndex ..< endIndex])
    }
    
    func toDate() -> Date { //"yyyy-MM-dd HH:mm:ss"
        var dateStr = String.init(self)
        if dateStr.count == 10 {
            dateStr = "\(dateStr) 00:00:00"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "ko_KR") as TimeZone?
        dateFormatter.locale = NSLocale(localeIdentifier: "KST") as Locale
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = dateFormatter.date(from: dateStr) {
            return date
        } else {
            return Date()
        }
    }
    
    func getNumber() -> Int {
        let filterStr = self.filter {
            $0.isNumber
        }
        
        return Int(filterStr) ?? 0
    }
    
    func getFloat() -> Float {
        let filterStr = self.filter {
            $0.isNumber || $0 == "."
        }
        
        return Float(filterStr) ?? 0
    }
}

/**
 컬러에 대한 편의 기능을 제공합니다.
 */
extension Int {
    func priceFormat() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}

// MARK: - Date
/**
 컬러에 대한 편의 기능을 제공합니다.
 */
extension Date {
    public var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    public var month: Int {
         return Calendar.current.component(.month, from: self)
    }
    
    public var day: Int {
         return Calendar.current.component(.day, from: self)
    }
    
    public var monthName: String {
        let nameFormatter = DateFormatter()
        nameFormatter.dateFormat = "MMMM" // format January, February, March, ...
        return nameFormatter.string(from: self)
    }
    
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "ko_KR") as TimeZone?
        dateFormatter.locale = NSLocale(localeIdentifier: "KST") as Locale
        return dateFormatter.string(from: self)
    }
}

// MARK: - UIScrollView
/**
 컬러에 대한 편의 기능을 제공합니다.
 */
extension UIScrollView {
    func setCommonAttribute() {
        if self is UITableView {
            (self as? UITableView)?.separatorStyle = .none
            self.showsHorizontalScrollIndicator = false
            self.showsVerticalScrollIndicator = false
        } else {
            // 가로 스크롤 인디케이터 제거
            self.showsHorizontalScrollIndicator = false
        }
    }
}

// MARK: - 좌측정렬 컬렉션뷰
/**
 컬러에 대한 편의 기능을 제공합니다.
 */
class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)

        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }

            layoutAttribute.frame.origin.x = leftMargin

            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }

        return attributes
    }
}

// MARK: - StoreKit
/**
 컬러에 대한 편의 기능을 제공합니다.
 */
extension SKProduct {
    var localizedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        return formatter.string(from: price)!
    }
}
