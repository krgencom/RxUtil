
POD 저장소에 업로드 하기위한 세션키 등록 (이메일 요청)
 [ pod trunk register krgencom@gmail.com krgencom ]

simctl 오류발생시 
커맨드라인툴이 path 에 추가되었는지 확인 : xcrun simctl help
.zshrc 파일의 가장 하단에 추가하고 source 적용
$ export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
$ source ~/.bash_profile

pod 저장소 업데이트
pod install --repo-update

버전이 올라갔는지 확인
시간이 몇분정도 걸리니 강제로 업데이트 하려면 : pod repo update, pod search RxUtil, pod cache clean RxUtil
명령어 : pod search RxUtil
사이트 : https://cocoapods.org

-----------------------------

CocoaPods 저장소에 라이브러리를 추가하려면 다음 단계를 따라주세요:

라이브러리를 호스팅할 원격 저장소를 생성합니다. GitHub, GitLab, Bitbucket 등의 서비스를 사용하거나, 직접 호스팅할 수 있습니다.

원하는 위치에 로컬 작업 디렉토리를 생성합니다. 이 디렉토리에서 라이브러리와 관련된 파일을 관리합니다. 예를 들어, RxUtil이라는 작업 디렉토리를 생성합니다:

mkdir RxUtil
cd RxUtil

로컬 작업 디렉토리에서 라이브러리의 소스 코드와 함께 .podspec 파일을 생성합니다. .podspec 파일은 라이브러리의 메타데이터와 종속성을 정의합니다. RxUtil.podspec이라는 파일을 생성하고 다음 내용을 추가합니다:

Pod::Spec.new do |s|
  s.name             = 'RxUtil'
  s.version          = '0.1.0'
  s.summary          = 'A simple library providing a println function for Swift.'

  s.description      = <<-DESC
                        RxUtil is a simple library that provides a println function for Swift projects. It aims to make logging easier and more convenient.
                       DESC

  s.homepage         = 'https://github.com/yourusername/RxUtil'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'your@email.com' }
  s.source           = { :git => 'https://github.com/yourusername/RxUtil.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '3.0'
  
  s.source_files = 'Sources/*.{h,swift}'

  s.swift_version = '5.0'
end

라이브러리의 소스 코드를 작성합니다. Sources라는 폴더를 생성하고, 그 안에 println.swift라는 파일을 생성한 다음, 다음 내용을 추가합니다:

import Foundation

public func println(_ log: String = "", filename: String = #file, line: Int = #line, funcName: String = #function) {
    print("\(log) [\(filename):\(line)] \(funcName)")
}

원격 저장소에 모든 변경 사항을 커밋하고 푸시합니다:

git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/yourusername/RxUtil.git
git tag -a 0.1.0 -m "Initial release"
git push --tags
git push -u origin master

이제 .podspec 파일을 CocoaPods 저장소에 푸시할 수 있습니다. 먼저 CocoaPods Trunk에 등록되어 있는지 확인하고, 필요한 경우 등록하세요:

pod trunk me

등록되지 않은 경우 다음 명령으로 CocoaPods Trunk에 등록하세요:

pod trunk register your@email.com 'Your Name' --description='Your computer description'

이메일 인증 절차를 완료한 후, 다음 명령을 실행하여 .podspec 파일을 CocoaPods 저장소에 푸시합니다:

pod trunk push RxUtil.podspec

성공적으로 푸시하면, 다른 개발자들이 Podfile에 RxUtil을 추가하여 라이브러리를 사용할 수 있습니다:

pod 'RxUtil', '~> 0.1.0'

라이브러리를 업데이트하려면 .podspec의 버전을 증가시키고, 변경 사항을 커밋한 후 새 태그를 추가하고 푸시합니다. 그런 다음, pod trunk push 명령을 다시 실행하세요.
