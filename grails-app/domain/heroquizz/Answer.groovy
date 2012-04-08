package heroquizz

class Answer {
  String text
  Integer pointsNumber

  static belongsTo = [question: Question]

  static constraints = {
    text maxSize: 512
    pointsNumber range: -10..10
  }
}
