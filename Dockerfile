FROM openjdk:17-alpine
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY target/dependency dependency/
ADD target/backend-main.jar .
ENTRYPOINT ["java", "-Dspring.profiles.active=production", "-jar", "backend-main.jar", "-D", "exec.mainClass=main.Main"]