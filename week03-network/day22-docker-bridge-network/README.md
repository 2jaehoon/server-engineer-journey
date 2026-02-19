# Day 22 – Docker Bridge Network

##  목표

Docker 컨테이너의 내부 네트워크 구조를 이해하고,  
bridge 네트워크와 포트 매핑의 역할을 정리한다.

---

##  Docker 네트워크 기본 구조

Docker를 설치하면 기본적으로 `bridge` 네트워크가 생성된다.

확인:

```bash
docker network ls
```

기본 네트워크:

- bridge
- host
- none

---

##  Bridge 네트워크 확인

```bash
docker network inspect bridge
```

관찰한 내용:

- Subnet (예: 172.17.0.0/16)
- Gateway (예: 172.17.0.1)
- 각 컨테이너에 내부 IP 할당

Docker는 내부에 가상 스위치(`docker0`)를 만들고  
컨테이너를 하나의 내부 LAN에 연결한다.

---

##  컨테이너 간 통신 실험

```bash
docker run -dit --name c1 busybox sh
docker run -dit --name c2 busybox sh
```

각 컨테이너의 IP 확인:

```bash
docker inspect c1
```

컨테이너는 172.17.x.x 대역의 내부 IP를 가진다.

👉 내부 네트워크에서는 컨테이너끼리 직접 통신 가능

---

##  포트 매핑의 역할

```bash
docker run -d -p 8080:80 nginx
```

의미:

- 외부(호스트) 8080 포트
- 컨테이너 내부 80 포트

`-p` 옵션은 내부 네트워크에 있는 컨테이너를  
외부에서 접근 가능하게 만드는 통로 역할을 한다.

---

##  핵심 정리

- Docker는 기본 bridge 네트워크를 생성한다.
- 컨테이너는 내부 IP를 가진다.
- 컨테이너 간 통신은 내부 네트워크에서 이루어진다.
- `-p` 옵션은 외부 접근을 위한 포트 매핑이다.
- 내부 포트와 외부 포트는 서로 다른 계층이다.

---

##  느낀 점

컨테이너는 단순한 프로세스가 아니라  
내부 네트워크에 연결된 독립된 노드처럼 동작한다는 점을 이해하게 되었다.

포트 매핑은 단순 설정이 아니라  
내부 네트워크와 외부 네트워크를 연결하는 브릿지 역할이라는 점이 인상적이었다.
