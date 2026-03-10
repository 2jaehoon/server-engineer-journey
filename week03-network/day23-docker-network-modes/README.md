# Day 23 – Docker Network Modes (Bridge vs Host)

##  목표

Docker의 기본 네트워크 모드인 **bridge**와 **host**의 차이를 이해하고,  
각 네트워크 모드가 컨테이너 통신에 어떤 영향을 주는지 확인한다.

---

##  Docker 기본 네트워크 모드

Docker에는 기본적으로 다음 네트워크 모드가 존재한다.

- **bridge** : 기본 네트워크, Docker 내부 가상 네트워크 사용
- **host** : 호스트의 네트워크를 그대로 사용
- **none** : 네트워크 사용하지 않음

확인 명령어

```bash
docker network ls
```

---

##  Bridge 네트워크 실험

```bash
docker run -d --name bridge-nginx -p 8080:80 nginx
```

접속

```
http://localhost:8080
```

### 관찰

- 컨테이너는 Docker 내부 bridge 네트워크에 연결됨
- 컨테이너는 내부 IP (예: 172.x.x.x)를 가짐
- 외부 접근을 위해 `-p` 옵션으로 포트 매핑 필요

구조

```
브라우저
   ↓
호스트:8080
   ↓
Docker bridge network
   ↓
컨테이너:80
```

---

##  Host 네트워크 실험

```bash
docker run -d --name host-nginx --network host nginx
```

접속

```
http://localhost:80
```

### 관찰

- 컨테이너가 호스트 네트워크를 직접 사용
- 포트 매핑(`-p`)이 필요 없음
- 컨테이너가 호스트 포트를 직접 사용함

구조

```
브라우저
   ↓
호스트:80
   ↓
컨테이너:80
```

---

##  Bridge vs Host 차이

| 구분 | Bridge | Host |
|-----|------|------|
네트워크 | Docker 내부 네트워크 | 호스트 네트워크 사용 |
포트 매핑 | 필요 | 필요 없음 |
격리 | 있음 | 거의 없음 |
IP | 컨테이너 별 내부 IP | 호스트 IP 공유 |

---

##  정리

- Docker의 기본 네트워크는 **bridge**
- bridge 모드에서는 컨테이너가 내부 네트워크에 연결된다.
- 외부 접근을 위해 **포트 매핑**이 필요하다.
- host 모드는 컨테이너가 **호스트 네트워크를 직접 사용**한다.
- 네트워크 격리 측면에서는 bridge 모드가 더 안전하다.
