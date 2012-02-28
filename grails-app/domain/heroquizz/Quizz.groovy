package heroquizz

class Quizz {

  String name
  String description
  boolean published

  static hasMany = [questions: Question]

  static constraints = {
    name maxSize: 100
    description maxSize: 255
    questions nullable: true
  }
}
