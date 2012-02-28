import heroquizz.Question
import heroquizz.Answer
import heroquizz.Quizz

class BootStrap {

  def init = { servletContext ->

    def quizz1 = new Quizz(name: 'Culture générale', description: 'Tous sujets', published: true).save()

    def question1 = new Question(text: "Quelle est la couleur du cheval blanc d'Henri IV ?", quizz: quizz1).save()
    def reponse1Q1 = new Answer(text: 'Bleu', pointsNumber: -1, question: question1).save()
    def reponse2Q1 = new Answer(text: 'Blanc', pointsNumber: 1, question: question1).save()
    def reponse3Q1 = new Answer(text: 'Rouge', pointsNumber: -1, question: question1).save()

    def question2 = new Question(text: "Quelle est le nombre de proton dans un atome d'hydrogène ?", quizz: quizz1).save()
    def reponse1Q2 = new Answer(text: '1', pointsNumber: 1, question: question2).save()
    def reponse2Q2 = new Answer(text: '3', pointsNumber: -1, question: question2).save()
    def reponse3Q2 = new Answer(text: '8', pointsNumber: -1, question: question2).save()

    def question3 = new Question(text: "Quelle est l'année de naissance de Victor Hugo ?", quizz: quizz1).save()
    def reponse1Q3 = new Answer(text: '1802', pointsNumber: 1, question: question3).save()
    def reponse2Q3 = new Answer(text: '1804', pointsNumber: -1, question: question3).save()
    def reponse3Q3 = new Answer(text: '1812', pointsNumber: -1, question: question3).save()


  }
  def destroy = {
  }
}
