package heroquizz

class QuizzAnswer {

  static belongsTo = [owner: FacebookUser]

  Quizz originalQuizz
  int score
  boolean completed
  
  Date dateCreated
  Date lastUpdated

  static hasMany = [validated: Question]

  static constraints = {
    originalQuizz nullable: false
    validated nullable: true
  }
}
