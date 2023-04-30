#!/bin/bash

# .podspec 파일에서 현재 버전 읽어오기
#current_version=$(grep -E "s.version\s*=\s*'[0-9]+\.[0-9]+\.[0-9]+'" RxUtil.podspec | grep -E -o "[0-9]+\.[0-9]+\.[0-9]+")

# 현재 버전 출력
#echo "Current version: $current_version"

# 버전 출력
#echo "New version: $current_version"

# Git 명령어 실행
git add .
git commit -m "update"
#git tag "$current_version"
#git push --tags
git push origin master

# Pod 명령어 실행 - pod 저장소로 업로드
#pod trunk push RxUtil.podspec

# sh 파일 권한변경
# chmod +x gitPodUpdate.sh
