
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



--------------------------------------
당신의 라이브러리를 CocoaPods에 등록하여 다른 사람들이 쉽게 사용할 수 있도록 하려면 아래와 같은 단계를 따라주세요.

라이브러리 프로젝트 생성
터미널에서 다음 명령어를 실행하여 라이브러리 프로젝트를 생성합니다:

pod lib create MyLibrary

여기서 'MyLibrary'를 원하는 라이브러리 이름으로 변경하세요.

라이브러리 코드 작성
'Classes' 폴더 내에 새로운 Swift 파일을 생성하고, hello() 함수를 작성합니다.
예를 들어, MyLibrary.swift 파일을 생성하고 다음 내용을 추가합니다:

public class MyLibrary {
    public init() { }

    public func hello() {
        print("Hello from MyLibrary!")
    }
}

Podspec 파일 편집
프로젝트 디렉토리 내의 MyLibrary.podspec 파일을 열어 필요한 정보를 작성합니다. 예를 들면 다음과 같습니다:

Pod::Spec.new do |s|
  s.name             = 'MyLibrary'
  s.version          = '0.1.0'
  s.summary          = 'A short description of MyLibrary.'
  s.description      = 'MyLibrary is a simple library that provides a hello function.'

  s.homepage         = 'https://github.com/YourUsername/MyLibrary'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'your.email@example.com' }
  s.source           = { :git => 'https://github.com/YourUsername/MyLibrary.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'
  s.source_files = 'MyLibrary/Classes/**/*'
end

YourUsername, Your Name 및 이메일 주소 등의 정보를 실제 정보로 변경하세요.

라이브러리 프로젝트를 Git 리포지토리에 푸시
GitHub, GitLab 등 원격 저장소를 생성한 후, 프로젝트를 푸시하세요:

git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YourUsername/MyLibrary.git
git push -u origin master

위의 명령어에서 https://github.com/YourUsername/MyLibrary.git 부분을 실제 원격 저장소 주소로 변경하세요.

라이브러리 태그 생성 및 푸시
버전 태그를 생성하고 푸시합니다:

git tag '0.1.0'
git push --tags

CocoaPods Trunk에 등록
CocoaPods Trunk에 라이브러리를 등록하려면 먼저 CocoaPods Trunk에 계정을 등록하세요. 계정이 없다면 다음 명령어를 사용

계정이 없다면 다음 명령어를 사용하여 등록하세요:

이메일로 발송된 인증 링크를 클릭하여 계정 등록을 완료하세요.

라이브러리 CocoaPods Trunk에 푸시
다음 명령어를 실행하여 CocoaPods Trunk에 라이브러리를 푸시합니다:

pod trunk push MyLibrary.podspec

이제 다른 사람들이 당신의 라이브러리를 사용할 수 있습니다. 사용자는 다음과 같이 Podfile에 라이브러리를 추가하여 사용할 수 있습니다:

pod 'MyLibrary', '~> 0.1.0'

CocoaPods에 라이브러리를 등록하고 관리하는 과정이 처음에는 복잡해 보일 수 있지만, 연습을 통해 익숙해질 수 있습니다. 이제 당신의 라이브러리를 다른 사람들과 공유하고 더 나은 프로젝트를 만들 수 있습니다!
