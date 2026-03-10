# Day 24 – Docker Container DNS

## 목표

Docker 사용자 정의 네트워크에서
컨테이너 이름이 DNS처럼 동작한다는 것을 이해한다.

---

## 실험 – 컨테이너 이름으로 통신

네트워크 생성

```
docker network create mynet
```

컨테이너 실행

```
docker run -dit --name db --network mynet busybox sh
docker run -dit --name app --network mynet busybox sh
```

컨테이너 내부 접속

```
docker exec -it app sh
```

ping 테스트

```
ping db
```

---

## 확인 결과

```
PING db (172.x.x.x)
```

`db`라는 컨테이너 이름이 실제 IP 주소로 변환되는 것을 확인했다.

---

## 핵심 정리

Docker user-defined network에서는 내부 DNS가 제공된다.

컨테이너들은 IP 주소 대신 **컨테이너 이름으로 서로 통신**할 수 있다.

IP 주소는 컨테이너 재생성 시 변경될 수 있지만
컨테이너 이름을 사용하면 안정적으로 서비스 간 연결을 유지할 수 있다.

---

## 느낀 점

Docker 네트워크에서는 컨테이너 이름이 DNS 역할을 한다는 점이 인상적이었다.

실제 서비스 환경에서도 IP가 아닌 서비스 이름으로 통신하는 구조가 일반적이며,
이러한 구조가 docker-compose나 Kubernetes 같은 오케스트레이션 환경에서
더 중요한 역할을 한다는 것을 이해하게 되었다.
