//
//  CustomLoading.swift
//  Das
//
//  Created by RemarkableSoft
//

import Foundation
import Gifu

/** https://velog.io/@hygge/Swift-GIF-%ED%8C%8C%EC%9D%BC%EB%A1%9C-Custom-Loading-%EB%A7%8C%EB%93%A4%EA%B8%B0 */
class LoadingSpinner {
    private static let shared = LoadingSpinner()
    
    private var backgroundView: UIView?
    private var popupView: GIFImageView?
    
    class func show() {
        let backgroundView = UIView()
        let popupView = GIFImageView()
        if let window = UIWindow.key {
            window.addSubview(backgroundView)
            window.addSubview(popupView)
            
            backgroundView.frame = CGRect(x: 0, y: 0, width: window.frame.maxX, height: window.frame.maxY)
            backgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)

            popupView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            popupView.translatesAutoresizingMaskIntoConstraints = false
            popupView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
            popupView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
            popupView.animate(withGIFNamed: "gif_loading")
            
            shared.backgroundView?.removeFromSuperview()
            shared.popupView?.removeFromSuperview()
            shared.backgroundView = backgroundView
            shared.popupView = popupView
        }
    }
    
    class func hide() {
        if let popupView = shared.popupView, let backgroundView = shared.backgroundView {
            popupView.stopAnimatingGIF()
            backgroundView.removeFromSuperview()
            popupView.removeFromSuperview()
        }
    }
}

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
