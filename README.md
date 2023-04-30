
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
시간이 몇분정도 걸리니 강제로 업데이트 하려면 : pod repo update
명령어 : pod search RxUtil
사이트 : https://cocoapods.org
