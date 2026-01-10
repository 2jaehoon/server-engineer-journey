#!/bin/bash
set -e

APP="./app.sh"
PIDFILE="run/app.pid"
LOGFILE="logs/app.log"

start() {
  if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
    echo "Already running (PID: $(cat "$PIDFILE"))"
    exit 0
  fi

  mkdir -p run logs
  nohup "$APP" >/dev/null 2>&1 &
  echo $! > "$PIDFILE"
  echo "Started (PID: $(cat "$PIDFILE"))"
}

stop() {
  if [ ! -f "$PIDFILE" ]; then
    echo "Not running (no pidfile)"
    exit 0
  fi

  PID="$(cat "$PIDFILE")"
  if kill -0 "$PID" 2>/dev/null; then
    kill "$PID"
    echo "Stopped (PID: $PID)"
  else
    echo "Not running (stale pidfile: $PID)"
  fi

  rm -f "$PIDFILE"
}

status() {
  if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
    echo "Running (PID: $(cat "$PIDFILE"))"
  else
    echo "Not running"
  fi
}

logs() {
  touch "$LOGFILE"
  tail -f "$LOGFILE"
}

case "${1:-}" in
  start) start ;;
  stop) stop ;;
  status) status ;;
  logs) logs ;;
  *)
    echo "Usage: $0 {start|stop|status|logs}"
    exit 1
    ;;
esac
