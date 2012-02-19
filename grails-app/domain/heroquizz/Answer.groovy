package heroquizz

class Answer {
  String text
  Integer pointsNumber
  static constraints = {
    text maxSize: 140
    pointsNumber range: -10..10
  }
}
