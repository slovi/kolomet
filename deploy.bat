call mvn versions:set versions:commit
call mvn clean deploy -Dmaven.test.skip=true -P !local,production