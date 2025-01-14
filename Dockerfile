# ------------------------------ SQL 2019 ---------------------------------------
# Imagen de Docker Hub
FROM mcr.microsoft.com/mssql/server:2019-CU18-ubuntu-20.04 AS SQL2019

# Variables de entorno del contenedor
ENV MSSQL_SA_PASSWORD=C0ntrol1* ACCEPT_EULA=Y MSSQL_PID=Developer 

# Puerto SQL
EXPOSE 1433

# ------------------------------ MYSQL 8.0.33 -------------------------------------------
FROM mysql:8 AS MySQL8

ENV MYSQL_ROOT_PASSWORD=C0ntrol1*

EXPOSE 3306

# ------------------------------ POSTGRES ----------------------------------------
# FROM
# ENV
# EXPOSE

# ------------------------------ ORACLE ------------------------------------------
# FROM
# ENV
# EXPOSE