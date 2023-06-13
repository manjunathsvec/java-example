FROM maven:amazoncorretto as build
WORKDIR /javaapp
COPY . .
RUN mvn clean install

FROM tomcat:jre17-temurin
COPY --from=build /javaapp/target/*.war /usr/local/tomcat/webapps/
