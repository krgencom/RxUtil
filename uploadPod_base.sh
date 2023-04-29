#!/bin/bash

# 첫번째 인자로 받은 버전을 사용하여 실행하는 스크립트 파일

version="$1"

# Git 명령어 실행
git add .
git commit -m "Update to version $version"
git tag "$version"
git push --tags
git push origin master

# Pod 명령어 실행
pod trunk push RxUtil.podspec
