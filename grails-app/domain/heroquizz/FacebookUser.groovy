package heroquizz

import heroquizz.User
import com.the6hours.grails.springsecurity.facebook.FacebookUserDomain

class FacebookUser implements FacebookUserDomain {

  long uid
  String accessToken

  String email
  String firstName
  String lastName

  static belongsTo = [user: User]

  static hasMany = [quizzAnswers: QuizzAnswer]

  static constraints = {
    email(blank: true, nullable: true)
    lastName(blank: true, nullable: true)
    firstName(blank: true, nullable: true)
    uid unique: true
  }

  String completeName() {
    firstName + ' ' + lastName
  }
}
