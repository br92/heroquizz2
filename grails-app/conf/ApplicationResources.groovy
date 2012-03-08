def dev = grails.util.GrailsUtil.isDevelopmentEnv()

modules = {
  application {
    resource url: 'js/application.js'
  }


  fb {
    resource url:[dir: 'css/fb', file: (dev ? 'bootstrap.css' : 'bootstrap.min.css')], disposition: 'head', exclude:'minify'
  }

  jwplayer {
    dependsOn('jquery')
    resource url: 'js/jwplayer.js'
  }
}