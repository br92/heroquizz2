package heroquizz

class Question {
  String text
  String videoUrl
  static hasMany = [answers: Answer]
  static constraints = {
    text maxSize: 255
    videoUrl nullable: true, url: true
    answers nullable: true
  }
}
