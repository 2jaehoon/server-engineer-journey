# Week 02 – Docker & Container Fundamentals

Week 02에서는 Docker를 단순히 “컨테이너 실행 도구”로 사용하는 수준을 넘어서,  
이미지 → 컨테이너 → 서비스 → 운영 관점까지 연결해서 학습했다.

서버 엔지니어 관점에서  
“왜 Docker를 쓰는가”, “운영 시 어떤 문제가 생길 수 있는가”를 중심으로 정리했다.

---

## 학습 목표

- Docker 이미지와 컨테이너의 개념 이해
- Dockerfile을 통한 이미지 빌드
- docker-compose를 이용한 멀티 컨테이너 구성
- 컨테이너 실행 순서와 서비스 준비 상태 차이 이해
- 환경 변수 분리 및 보안 관점 설정

---

## 학습 내용 요약

### Day 10 – Dockerfile Basics
- Dockerfile은 이미지를 정의하는 설정 문서
- FROM / RUN / COPY / CMD 흐름 이해
- 이미지와 컨테이너의 역할 분리 개념 학습

---

### Day 11 – Custom Image Build
- Dockerfile을 이용해 nginx 기반 커스텀 이미지 생성
- CMD와 ENTRYPOINT의 차이 이해
- 포그라운드 실행(daemon off)의 중요성 학습

---

### Day 12 – Volume
- 컨테이너는 기본적으로 휘발성이라는 점 이해
- volume을 통해 데이터 영속성 확보
- 컨테이너 삭제 후에도 데이터가 유지되는 구조 확인

---

### Day 13 – Docker Compose
- docker-compose를 이용한 멀티 컨테이너 관리
- app / db 컨테이너를 하나의 서비스 단위로 실행
- 단일 컨테이너 관리의 한계 인식

---

### Day 14 – App + DB 구성
- Python app + DB 컨테이너 구성
- 네트워크를 통한 컨테이너 간 통신 이해
- depends_on 옵션의 한계 확인

---

### Day 15 – Healthcheck
- depends_on은 실행 순서만 보장함
- 서비스가 “실제로 준비되었는지”는 보장하지 않음
- healthcheck를 통해 서비스 상태 기준 의존성 관리
- 운영 환경에서 중요한 안정성 개념 학습

---

### Day 16 – Environment Variables (.env)
- 환경 변수를 코드에서 분리
- `.env` 파일을 통한 설정 관리
- `.gitignore`로 민감 정보 Git 추적 방지
- 보안과 운영 편의성 관점에서 Docker 설정 이해

---

## Week 02에서 얻은 핵심 정리

- Docker는 단순 실행 도구가 아니라 **운영 단위**
- 컨테이너는 프로세스이며, 상태와 수명 관리가 중요
- “실행됨”과 “사용 가능함”은 다르다
- 설정, 보안, 안정성을 고려하지 않으면 운영에서 바로 문제가 된다

---

## 다음 단계

- Docker 이미지 버전 관리 및 태그 전략
- Docker Hub를 통한 이미지 배포
- AWS 환경에서 Docker 기반 서비스 운영
