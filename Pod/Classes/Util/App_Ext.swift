//
//  UIColor_Ext.swift
//
//  Created by RemarkableSoft
//
import Foundation
import UIKit
import StoreKit
// MARK: ?°?Έ ?¬?΄μ¦?
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

extension UIColor {
    /// RGBκ°? κ°κ° `red`, `green`, `blue`?΄κ³? opacity? `a`?Έ Color object λ°ν
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: a
        )
    }
}

// MARK: - UIColor
extension UIColor {
    /// RGBκ°? `hex`, opacity? 1? ?΄?Ή?? Color object λ°ν
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
    
    // Opacityκ°μ΄ `opacity`?Έ Color object λ°ν
    func alpha(_ opacity: CGFloat) -> UIColor {
        return self.withAlphaComponent(opacity)
    }
}

// MARK: - UILabel
extension UILabel {
    /// Opacityκ°μ΄ `opacity`?Έ Color object λ°ν
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
extension UIButton {
    /// Opacityκ°μ΄ `opacity`?Έ Color object λ°ν
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

// MARK: - UIView : λΆ?λΆ? ?₯κ·? ?€????Ό
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
    
    // TextField μ’μΈ‘ ?¬λ°? ?€? 
    func addLeftPadding(_ leftPadding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "?λ£?", style: .done, target: self, action: #selector(self.doneButtonAction))
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
        let done: UIBarButtonItem = UIBarButtonItem(title: "?λ£?", style: .done, target: self, action: #selector(self.doneButtonAction))
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
extension String {
    // URL ?Έμ½λ© : ??€?Έ ? μ²? ?Έμ½λ©
    func urlEncParam() -> String {
        guard let encodedStr = self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return ""
        }
        return encodedStr
    }
    // URL ?Έμ½λ© : ??Όλ―Έν° λΆ?λΆλ§ ?Έμ½λ©
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
        
        // Index κ°? ??
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to + 1) // '+1'?΄ ?? ?΄? : endIndex? λ¬Έμ?΄? λ§μ??λ§? κ·? ?€?? κ°?λ¦¬ν€κΈ? ?λ¬?
        
        // ??±
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

extension Int {
    func priceFormat() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}

// MARK: - Date
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
extension UIScrollView {
    func setCommonAttribute() {
        if self is UITableView {
            (self as? UITableView)?.separatorStyle = .none
            self.showsHorizontalScrollIndicator = false
            self.showsVerticalScrollIndicator = false
        } else {
            // κ°?λ‘? ?€?¬λ‘? ?Έ?μΌ??΄?° ? κ±?
            self.showsHorizontalScrollIndicator = false
        }
    }
}

// MARK: - μ’μΈ‘? ? ¬ μ»¬λ ?λ·?
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
extension SKProduct {
    var localizedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        return formatter.string(from: price)!
    }
}
