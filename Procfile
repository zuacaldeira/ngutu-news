web:    java $JAVA_OPTS -jar target/dependency/webapp-runner.jar --port $PORT target/*.war
worker: java $JAVA_OPTS -cp target/classes:target/dependency/* main.Main
