#  Day 25 - Multi Container Service

##  목표

* Docker Compose를 사용하여 여러 컨테이너를 하나의 서비스로 구성한다.
* 컨테이너 간 네트워크 통신 방식을 이해한다.

---

##  구성 구조

```
[ app (nginx) ]  →  [ db (mysql) ]
        │
     (docker network)
```

* app: 웹 서버 역할 (nginx)
* db: 데이터베이스 (MySQL)

---

##  docker-compose.yml

```yaml
version: "3.8"

services:
  app:
    image: nginx
    container_name: my-app
    ports:
      - "8080:80"

  db:
    image: mysql:5.7
    container_name: my-db
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: testdb
```

---

## 실행 방법

```bash
docker-compose up -d
```

---

##  실행 결과

```bash
docker ps
```

* my-app (nginx)
* my-db (mysql)

---

##  확인

* http://localhost:8080 접속 → nginx 정상 출력

---

##  핵심 개념

### 1. docker-compose 네트워크

* compose 실행 시 자동으로 네트워크 생성

### 2. 서비스 이름 기반 통신 (DNS)

* 컨테이너 간 통신 시 `localhost`가 아닌 서비스 이름 사용

```
db:3306
```

### 3. localhost의 의미

* localhost는 자기 자신을 의미
* app 컨테이너에서 localhost → app 자신

---

##  문제점

* db가 준비되지 않아도 app이 먼저 실행됨
* 실제 서비스에서는 장애 발생 가능

---

##  느낀 점

* 컨테이너 하나가 아니라 여러 개가 모여 하나의 서비스가 된다.
* 네트워크 연결이 서비스 구성의 핵심이다.


