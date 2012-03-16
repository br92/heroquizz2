package heroquizz

import com.the6hours.grails.springsecurity.facebook.FacebookAuthToken
import org.springframework.social.facebook.api.impl.FacebookTemplate
import org.springframework.social.facebook.api.FacebookProfile

class FacebookAuthService {

  void afterCreate(FacebookUser user, FacebookAuthToken token) {
    FacebookTemplate facebook = new FacebookTemplate(token.accessToken)
    FacebookProfile fbProfile = facebook.userOperations().userProfile

    user.email = fbProfile.getEmail()
    user.firstName = fbProfile.getFirstName()
    user.lastName = fbProfile.getLastName()

    user.accessToken = token.accessToken

  }
}
