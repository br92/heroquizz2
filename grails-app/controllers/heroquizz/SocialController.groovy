package heroquizz

import org.springframework.social.facebook.api.FacebookProfile
import org.springframework.social.facebook.api.impl.FacebookTemplate
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_FACEBOOK'])
class SocialController {

  static allowedMethods = [share: "POST"]

  def springSecurityService

  def shareExam() {
    def fbUser = FacebookUser.findByUser(springSecurityService.getPrincipal())
    FacebookTemplate facebook = new FacebookTemplate(fbUser.accessToken)
    facebook.feedOperations().post('me', 'Published from HeroQuizz')
  }
}
