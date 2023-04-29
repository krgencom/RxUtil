//
//  KUtil.swift
//
//  Created by Krgencom
//
import UIKit
import Foundation
import AVFoundation
var _logTime: UInt64 = 0
func println(_ _log: String = "", _filename: String = #file, _line: Int = #line, _funcName: String = #function) {
#if DEBUG
//    let aInfo = _filename.components(separatedBy: "/")
//    let logInfo = "\(aInfo[aInfo.count-1]), \(_line), \(_funcName)"
//    print("SLog : \(logInfo), \n> \(_log)")
    if _logTime == 0 {
        _logTime = DispatchTime.now().uptimeNanoseconds
    }
    
    let elapsedTimeInNanoseconds = DispatchTime.now().uptimeNanoseconds - _logTime
    let elapsedTimeInSeconds = Double(elapsedTimeInNanoseconds) / 1_000_000_000.0
    
    let integerPart = Int(elapsedTimeInSeconds)
    let decimalPart = elapsedTimeInSeconds - Double(integerPart)
    
    let formattedTime = String(format: "%3d%.5f", integerPart, decimalPart).replacingOccurrences(of: ".0.", with: ".", options: .literal, range: nil)
    print("Log[\(formattedTime)]: " + _log)
    _logTime = DispatchTime.now().uptimeNanoseconds

#endif
}


/**
 여러가지 기능을 제공하는 유틸리티 클래스입니다.

 KUtil 클래스는 앱에서 사용되는 다양한 유틸리티 기능을 제공합니다.
 */
class KUtil {

    static func getSafeString(value: String?) -> String {
        return value ?? ""
    }
    // 앱 버전
    static func getBuildNumber() -> String {
        let bundleVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as! String
        return bundleVersion
    }
    // 빌드 버전
    static func getBuildString() -> String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        return version
    }
    
    static func getSafeString(value: Int) -> String {
        return "\(value)"
    }
    static func getSafeInt(value: Int?) -> Int {
        return value ?? 0
    }
    static func getSafeBool(value: Bool?) -> Bool {
        return value ?? false
    }
    static func setUserDefaultStr(key: String, value: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    static func getUserDefaultStr(key: String, defaultValue: String) -> String {
        return UserDefaults.standard.string(forKey: key) ?? defaultValue
    }
    static func setUserDefaultInt(key: String, value: Int) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    static func getUserDefaultInt(key: String, defaultValue: Int) -> Int {
        if UserDefaults.standard.object(forKey: key) == nil {
            return defaultValue
        }
        return UserDefaults.standard.integer(forKey: key)
    }
    static func setUserDefaultBool(key: String, value: Bool) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    static func getUserDefaultBool(key: String, defaultValue: Bool) -> Bool {
        if UserDefaults.standard.object(forKey: key) == nil {
            return defaultValue
        }
        return UserDefaults.standard.bool(forKey: key)
    }
    static func setUserDefaultObj(key: String, value: Any) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    static func getUserDefaultObj(key: String, default: Any) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
}

// 텍스트필드 최대 글자수 지정
func textFieldLimit(_ tf: UITextField, _ maxSize: Int) {
    let text = tf.text ?? ""
    if text.count > maxSize {
        let index = text.index(text.startIndex, offsetBy: maxSize)
        tf.text = String(text[..<index])
    }
}
