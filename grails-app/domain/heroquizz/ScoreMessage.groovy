package heroquizz

class ScoreMessage {

  static belongsTo = [quizz: Quizz]

  int minimum

  String message
  
  static constraints = {
    message nullable: false, blank: false
  }
}
