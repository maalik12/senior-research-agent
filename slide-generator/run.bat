@echo off
echo Installing dependencies...
cd backend
pip install -r requirements.txt
echo.
echo Starting backend server...
start "Backend Server" cmd /k python main.py
timeout /t 3 /nobreak >nul
echo.
echo Starting frontend server...
cd ..\frontend
start "Frontend Server" cmd /k python -m http.server 8080
echo.
echo ================================================
echo Application is starting!
echo Backend: http://127.0.0.1:5000
echo Frontend: http://localhost:8080
echo.
echo Opening browser in 3 seconds...
timeout /t 3 /nobreak >nul
start http://localhost:8080
echo Done! Keep both command windows open.
