# Day 13 – docker-compose

Day 13에서는 docker-compose를 사용해
컨테이너 실행 명령을 파일로 선언하고,
서비스를 한 번에 관리하는 방법을 학습했다.

docker-compose.yml에 이미지, 포트, 볼륨을 정의하면
docker compose up/down 명령으로 실행과 종료를 일관되게 수행할 수 있다.

또한 Volume을 함께 정의하여
컨테이너 재생성 이후에도 데이터를 유지할 수 있음을 확인했다.
