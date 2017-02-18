FROM tomcat:8-jre8

RUN SLF4J_VER=1.7.23 \
 && curl -SLfs https://repo1.maven.org/maven2/org/slf4j/slf4j-api/${SLF4J_VER}/slf4j-api-${SLF4J_VER}.jar > $CATALINA_HOME/lib/slf4j-api-${SLF4J_VER}.jar \
 && curl -SLfs https://repo1.maven.org/maven2/org/slf4j/slf4j-jdk14/${SLF4J_VER}/slf4j-jdk14-${SLF4J_VER}.jar > $CATALINA_HOME/lib/slf4j-jdk14-${SLF4J_VER}.jar \
