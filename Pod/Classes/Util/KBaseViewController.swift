//
//  KBaseViewController.swift
//  DAS
//
//  Created by Home on 2023/05/04.
//  Copyright © 2023 RemarkableSoft. All rights reserved.
//

import Foundation
import RxSwift

class KBaseViewController: UIViewController {
    var disposeBag              = DisposeBag()
    var recvParam:Dictionary<String, String>? = nil
    
    // MARK: - ViewController 데이터 전달
    func setParam(_ param: Dictionary<String, String>) {
        print("----param \(param)")
        recvParam = param
        
    }
}
