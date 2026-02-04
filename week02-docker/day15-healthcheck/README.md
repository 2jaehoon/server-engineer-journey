# Day 15 – docker-compose healthcheck

docker-compose의 depends_on 옵션은
컨테이너 실행 순서만 보장하며,
서비스가 실제로 준비되었는지는 보장하지 않는다.

Day 15에서는 데이터베이스 컨테이너에 healthcheck를 정의해
서비스가 정상 상태(healthy)가 된 이후에
애플리케이션 컨테이너가 실행되도록 구성했다.

이를 통해 컨테이너 상태가 아닌
서비스 준비 상태를 기준으로
의존성을 관리하는 것이 실제 운영 환경에서 중요함을 이해했다.
