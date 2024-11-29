FROM maven:3.8-openjdk-17

WORKDIR /app

COPY . .
RUN mvn dependency:go-offline -B
RUN mvn clean install

CMD ["mvn", "spring-boot:run"]