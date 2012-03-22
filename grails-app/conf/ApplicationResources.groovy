def dev = grails.util.GrailsUtil.isDevelopmentEnv()

modules = {
  application {
    resource url: 'js/application.js'
  }

  jwplayer {
    dependsOn('jquery')
    resource url: 'js/jwplayer.js'
  }

  'common-css' {
    dependsOn('bootstrap-css')
    resource url: 'css/main.css'
  }
}