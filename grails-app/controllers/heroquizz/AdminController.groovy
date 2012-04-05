package heroquizz

import grails.plugins.springsecurity.Secured

class AdminController {

  @Secured('ROLE_ADMIN')
  def index() {
    return redirect(controller: 'quizz', action: 'list')
  }
}
