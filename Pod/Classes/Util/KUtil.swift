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
 여러가지 기능을 제공하는 유틸리티 클래스 입니다.
 */
class KUtil {
//    static func pushVC(main: UIViewController, target:BaseViewController, _ animate: Bool = false, _ dic: Dictionary<String, String> = Dictionary()) {
//        target.setParam(dic)
//        main.navigationController?.pushViewController(target, animated: animate)
//    }
//
//    static func popVC(main: UIViewController, _ animate: Bool = false) {
//        main.navigationController?.popViewController(animated: animate)
//    }
//
//    static func presentVC(main: UIViewController, target:BaseViewController, _ animate: Bool = false, _ dic: Dictionary<String, String> = Dictionary()) {
//        target.setParam(dic)
//        target.modalPresentationStyle = .fullScreen
//        main.present(target, animated: animate)
//    }
//
//    static func dismissVC(main: UIViewController, _ animate: Bool = false, _ dic: Dictionary<String, String> = Dictionary()) {
//        main.dismiss(animated: animate)
//    }
//
//    static func popToViewControllerOfType<T: UIViewController>(_ navigationController: UINavigationController?, _ type: T.Type) {
//        // ex: popToViewControllerOfType(MyViewController.self, self.navigationController)
//        if let navigationController = navigationController {
//            for viewController in navigationController.viewControllers {
//                if viewController is T {
//                    navigationController.popToViewController(viewController, animated: true)
//                    break
//                }
//            }
//        }
//    }
//
//    static func pushOrPopToVC(main: UIViewController, target: BaseViewController, _ animate: Bool = false, _ dic: Dictionary<String, String> = Dictionary()) {
//        target.setParam(dic)
//
//        if let navigationController = main.navigationController {
//            var targetVC: UIViewController?
//
//            // navigationController.viewControllers를 검색하여 target이 있는지 확인합니다.
//            for viewController in navigationController.viewControllers {
//                if type(of: viewController) == type(of: target) {
//                    targetVC = viewController
//                    break
//                }
//            }
//
//            if let targetVC = targetVC {
//                // targetVC가 이미 스택에 있으면 popToViewController로 이동합니다.
//                navigationController.popToViewController(targetVC, animated: animate)
//            } else {
//                // 그렇지 않으면 pushViewController로 이동합니다.
//                navigationController.pushViewController(target, animated: animate)
//            }
//        }
//    }
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
//
//var notificationIdentifiers: [String] = []
//func localNotification(message: String) {
//    let content = UNMutableNotificationContent()
//    content.title = message
//    content.body = ""
//    content.sound = .default
//
//    // Configure the trigger for a specific time interval
//    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)
//
//    // Create a unique identifier for the request
//    let requestIdentifier = UUID().uuidString
//    notificationIdentifiers.append(requestIdentifier)
//
//    // Create the request with the content and trigger
//    let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
//
//    // Schedule the request with the system
//    let center = UNUserNotificationCenter.current()
//    center.add(request) { error in
//        if let error = error {
//            // Handle the error here
//            println("Error: \(error.localizedDescription)")
//        }
//    }
//}
//
//// MARK: 모든 노티피케이션 삭제
//func localNotificationClear() {
//    let center = UNUserNotificationCenter.current()
//
//    // 예약알림 삭제
//    center.removeAllPendingNotificationRequests()
//
//    // 제어센터 알림 삭제
//    center.removeAllDeliveredNotifications()
//}
