# How to run car_company_db
1. Make sure the computer had docker installed
2. Open terminal (`wsl` if you're running from a Windows machine) at the directory with Dockerfile
3. Run this command to build the image: `docker build . -t car_company_db`
4. Run this command to start the container: `docker run -d --name car_company_container -p 5432:5432 car_company_db`