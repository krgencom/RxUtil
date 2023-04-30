
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

새로운 pod 라이브러리를 iOS Swift 프로젝트에 추가하려면 다음 단계를 따르세요.

새로운 라이브러리를 개발합니다. (ex. MyNewLibrary)

새로운 라이브러리를 등록할 때 사용되는 라이브러리 관리 도구인 Cocoapods를 설치합니다. 터미널에서 다음 명령어를 실행하세요.

$ sudo gem install cocoapods


새로운 라이브러리를 위한 podspec 파일을 작성합니다. 이 파일은 라이브러리에 대한 정보를 포함합니다.

새로운 라이브러리를 위한 Github 저장소를 만듭니다.

새로운 라이브러리를 Github 저장소에 푸시합니다.

터미널에서 iOS Swift 프로젝트 디렉토리로 이동합니다.

Podfile을 열어 새로운 라이브러리를 추가합니다.

target 'MyProject' do
  use_frameworks!

  # 새로운 라이브러리 추가
  pod 'MyNewLibrary', :git => 'https://github.com/yourusername/MyNewLibrary.git', :tag => '0.1.0'
  
  
