/**
 RxUtil 라이브러리는 RxSwift를 이용한 유틸리티 함수를 제공합니다.
 
 이 라이브러리는 RxSwift를 사용하는 앱에서 사용하기 쉬운 다양한 유틸리티 함수를 제공합니다.
 */
import Foundation

func LString(_ key: String, _ : String = "") -> String {
    return NSLocalizedString(key, comment: "") 
}
