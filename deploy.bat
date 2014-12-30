call set JAVA_HOME=c:\Program Files\Java\jdk1.6.0_45\
call mvn versions:set versions:commit
call mvn clean deploy -Dmaven.test.skip=true -P !local,production