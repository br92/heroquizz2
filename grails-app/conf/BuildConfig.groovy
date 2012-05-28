grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6

//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.dependency.resolution = {
  // inherit Grails' default dependencies
  inherits("global") {
    // uncomment to disable ehcache
    // excludes 'ehcache'
  }
  log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
  checksums true // Whether to verify checksums on resolve

  repositories {
    inherits true // Whether to inherit repository definitions from plugins
    grailsPlugins()
    grailsHome()
    grailsCentral()
    mavenCentral()
  }
  dependencies {
    runtime 'postgresql:postgresql:8.4-702.jdbc4'
    compile 'org.springframework.social:spring-social-core:1.0.2.RELEASE'
    compile 'org.springframework.social:spring-social-facebook:1.0.1.RELEASE'
  }

  plugins {
    runtime ":hibernate:$grailsVersion"

    runtime ":jquery:1.7.1"
    runtime ":resources:1.1.6"

    runtime ':heroku:1.0'
    runtime ':spring-security-core:1.2.7.3'
    runtime ':spring-security-facebook:0.8'
    runtime ':twitter-bootstrap:2.0.2.25'
    runtime ':webxml:1.4.1'

    /*runtime ":zipped-resources:1.0"
    runtime ":cached-resources:1.0"
    runtime ":yui-minify-resources:0.1.4"
*/
    build ":tomcat:$grailsVersion"
  }
}
