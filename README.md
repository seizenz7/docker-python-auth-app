# Overview
Project ini mendefinisikan aplikasi yang dipaketkan menggunakan Docker dan dijalankan bersama database PostgreSQL menggunakan Docker Compose.

Komponen utama:
- app: service aplikasi.
- database: service PostgreSQL.

# Prerequisites
- Clone this repo for source code app [python-auth-app](https://github.com/fauzan-rafi/python-auth-app.git)
- Docker (v20+)
- Docker Compose (v2+)

# Step by Step

1. Buat file [Dockerfile](./Dockerfile)
2. Buat file [docker-compose.yaml](./docker-compose.yaml)
3. Lakukan build docker images dengan menggunakan perintah `docker compose -f docker-compose.yaml build`
4. Jalankan service aplikasi dengan menggunakan perintah `docker compose up -d`

# Screenshot

- Build and Run
![](./screenshot/docker-compose-build-up.png)

- Register
![](./screenshot/register-page.png)

- Login
![](./screenshot/login-page.png)

- Home
![](./screenshot/home-page.png)