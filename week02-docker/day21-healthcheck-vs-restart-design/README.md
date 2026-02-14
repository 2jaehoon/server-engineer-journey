# Day 21 – Healthcheck vs Restart Design

##  목표

Docker의 `restart` 정책과 `healthcheck` 동작 방식을 직접 실험하고,  
두 기능이 서로 독립적으로 동작한다는 점을 이해한다.

---

##  실험 및 분석

### Restart Policy 실험

```bash
docker run -d --name crash-test --restart=on-failure busybox sh -c "exit 1"
```

#### 관찰

- 컨테이너 내부에서 `exit 1` 실행
- 종료 코드 1 (비정상 종료)
- Docker가 자동으로 컨테이너를 재시작함

#### 해석

`--restart=on-failure` 정책은  
컨테이너 내부 프로세스의 **exit code**를 기준으로 동작한다.

즉, exit code가 0이 아니면 (실패)  
Docker는 해당 컨테이너를 자동으로 재시작한다.

---

### Healthcheck 실험

```bash
docker run -d \
--name hc-test \
--restart=always \
--health-cmd="curl -f http://localhost || exit 1" \
--health-interval=5s \
--health-retries=3 \
nginx
```

상태 확인:

```bash
docker inspect --format='{{.State.Health.Status}}' hc-test
```

#### 관찰

- healthcheck 실패 시 상태는 `unhealthy`
- 그러나 컨테이너는 종료되지 않음
- 자동 재시작도 발생하지 않음

#### 해석

Healthcheck는 컨테이너의 **서비스 상태를 표시하는 메타데이터**이다.  
`restart` 정책과 직접적으로 연결되어 있지 않다.

---

##  핵심 정리

- `restart` 정책은 **프로세스 종료 기반**
- `healthcheck`는 **서비스 상태 표시용**
- `unhealthy` 상태는 자동 재시작을 유발하지 않음

Docker는 프로세스 관리자 역할에 집중하며,  
서비스 상태 기반 자동 복구는 오케스트레이터(Kubernetes 등)의 영역이다.
