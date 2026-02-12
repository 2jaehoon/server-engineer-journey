# Day 19 – Liveness vs Readiness

Docker 컨테이너의 실행 상태와
실제 서비스의 정상 동작은 다를 수 있다.

---

## 실험

- nginx 컨테이너 실행
- docker ps로 상태 확인
- DB 중지 후 app 상태 관찰

---

## 관찰 결과

- 컨테이너는 Up 상태 유지
- 하지만 내부 서비스는 정상 동작하지 않음

---

## 정리

- docker ps는 프로세스 상태만 보여준다
- 실제 서비스 상태는 별도의 health check가 필요하다
