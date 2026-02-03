# Day 14 – docker-compose (App + DB)

Day 14에서는 docker-compose를 사용해
애플리케이션 컨테이너와 데이터베이스 컨테이너를
하나의 서비스로 구성했다.

docker-compose는 컨테이너 간 전용 네트워크를 자동으로 생성하며,
서비스 이름을 호스트명으로 사용해
별도의 IP 설정 없이 컨테이너 간 통신이 가능함을 확인했다.

또한 Python 애플리케이션 실행 시
stdout buffering으로 인해 로그가 즉시 출력되지 않는 문제를 겪었고,
`python -u` 옵션을 사용해 이를 해결했다.

이를 통해 docker-compose는
단순한 실행 도구가 아니라
실제 서비스 구조와 운영 이슈를 함께 다루는 도구임을 이해했다.
