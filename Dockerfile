# Install openjdk11
FROM openjdk:11

# Create Tomcat default temp dir
VOLUME /tmp

# Setup JAVA_HOME and JAVA_OPTIONS
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN export JAVA_HOME
ENV JAVA_OPTIONS -Xmx4G -Xms1G

# Setup spring boot app
COPY target/*.jar ./app.jar
EXPOSE 19090
ENTRYPOINT exec java $JAVA_OPTIONS -jar \
-Dlogging.file=logs/server.log \
app.jar