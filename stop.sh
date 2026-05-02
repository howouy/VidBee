#!/usr/bin/env bash
echo "Stopping VidBee..."

# Kill Electron window
taskkill /F /IM electron.exe /T 2>/dev/null && echo "Stopped electron.exe" || true

# Kill the vite dev server (port 5173)
PID=$(netstat -ano 2>/dev/null | grep ":5173 " | grep "LISTENING" | awk '{print $5}' | head -1)
if [ -n "$PID" ]; then
  taskkill /F /PID "$PID" /T 2>/dev/null && echo "Stopped vite dev server (PID $PID)" || true
fi

echo "Done."
