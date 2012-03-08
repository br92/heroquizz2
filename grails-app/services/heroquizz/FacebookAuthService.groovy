package heroquizz

import com.the6hours.grails.springsecurity.facebook.FacebookAuthToken
import org.springframework.social.facebook.api.impl.FacebookTemplate
import org.springframework.social.facebook.api.FacebookProfile

class FacebookAuthService {

  void afterCreate(FacebookUser user, FacebookAuthToken token) {
    UserRole.create(user.user, Role.findByAuthority('ROLE_FACEBOOK'))

    FacebookTemplate facebook = new FacebookTemplate(token.accessToken)
    facebook.publish("Published from Grails beta application")
    FacebookProfile fbProfile = facebook.userOperations().userProfile
    String email = fbProfile.getEmail()
    println "FOUND EMAIL !! ${email}"

  }
}
