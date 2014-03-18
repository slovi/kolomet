HEROKU:
# Spring MVC and Hibernate template application

This is a template for a web application that uses Spring MVC and Hibernate. The sample code is a simple CRUD page that manipulates records for a single model object.

## Running the application locally

First build with:

    $mvn clean install

Then run it with:

    $java -jar target/dependency/webapp-runner.jar target/*.war


OPENSHIFT:

The OpenShift `jbossews` cartridge documentation can be found at:

http://openshift.github.io/documentation/oo_cartridge_guide.html#tomcat

Pristupy: 

	jenkins (https://jenkins-slovi.rhcloud.com/job/kolomet-build/: system_builder/xhS1_DZZTeNp), 
	mysql (adminH32h99S/pUsGtTcszG9N)
	phpadmin (https://kolomet-slovi.rhcloud.com/phpmyadmin/: adminH32h99S/pUsGtTcszG9N)
