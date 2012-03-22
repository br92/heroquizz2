def dev = grails.util.GrailsUtil.isDevelopmentEnv()

modules = {
  application {
      dependsOn('jquery', 'bootstrap-responsive-css', 'bootstrap-dropdown')
      resource url: 'css/main.css'
  }

  jwplayer {
    dependsOn('jquery')
    resource url: 'js/jwplayer.js'
  }
}