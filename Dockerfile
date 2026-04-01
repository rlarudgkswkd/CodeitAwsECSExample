# 1. 베이스 이미지 선택
# amazoncorretto:17 - 자바 17 JDK 포함
# JDK를 사용하는 이유: 일부 라이브러리에서 컴파일 도구가 필요할 수 있음
FROM amazoncorretto:17-alpine

# 2. 컨테이너 메타데이터 설정(선택사항)
# 이미지 작성자, 설명, 버전 등의 정보를 포함
LABEL maintainer="ohgiraffers" \
      description="Spring Boot Cafe POS System - Basic Build" \
      version="1.0.0"

# 3. 작업 디렉토리 설정
# 컨테이너 내부에서 모든 작업이 수행될 기본 디렉토리
# /app 디렉토리가 없으면 자동으로 생성된다
WORKDIR /app

# 4. JAR 파일 복사
# build/libs/*.jar - Gradle 빌드 결과물 (와일드카드로 버전 무관하게 복사)
# app.jar - 컨테이너 내부에서 사용할 파일명 (단순화)
COPY build/libs/*.jar app.jar

# 5. 포트 노출 설정
# Spring Boot 애플리케이션의 기본 포트인 8080을 노출
# EXPOSE는 문서화 목적이며, 실제 포트 매핑은 docker run -p 옵션으로 설정
EXPOSE 8080

# 6. 컨테이너 시작 시 실행할 명령어
# java -jar app.jar - Spring Boot 애플리케이션 실행
# CMD는 컨테이너 실행 시 기본 명령어 (docker run에서 오버라이드 가능)
CMD ["java", "-jar", "app.jar"]