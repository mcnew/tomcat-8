FROM tomcat:8-jre8

RUN SLF4J_VER=1.7.23 \
 && curl -SLfs https://repo1.maven.org/maven2/org/slf4j/slf4j-api/${SLF4J_VER}/slf4j-api-${SLF4J_VER}.jar > $CATALINA_HOME/lib/slf4j-api-${SLF4J_VER}.jar \
 && echo "3bf8f84486045ad9447ced778dbc7b2b  $CATALINA_HOME/lib/slf4j-api-${SLF4J_VER}.jar" | md5sum -c \
 && curl -SLfs https://repo1.maven.org/maven2/org/slf4j/slf4j-jdk14/${SLF4J_VER}/slf4j-jdk14-${SLF4J_VER}.jar > $CATALINA_HOME/lib/slf4j-jdk14-${SLF4J_VER}.jar \
 && echo "ddca52512ef362fca702acc366a0962f  $CATALINA_HOME/lib/slf4j-jdk14-${SLF4J_VER}.jar" | md5sum -c \
 && curl -SLfs https://repo1.maven.org/maven2/mysql/mysql-connector-java/6.0.5/mysql-connector-java-6.0.5.jar > $CATALINA_HOME/lib/mysql-connector-java-6.0.5.jar \
 && echo "e97cb8ae4e3c8030ae240272950aa954  $CATALINA_HOME/lib/mysql-connector-java-6.0.5.jar" | md5sum -c \
 && rm -rf $CATALINA_HOME/webapps/ROOT
