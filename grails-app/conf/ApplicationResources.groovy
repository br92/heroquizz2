def dev = grails.util.GrailsUtil.isDevelopmentEnv()

modules = {
  application {
    resource url: 'js/application.js'
    resource url: 'css/main.css'
  }

  jwplayer {
    dependsOn('jquery')
    resource url: 'js/jwplayer.js'
  }
}