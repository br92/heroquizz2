import heroquizz.Question
import heroquizz.Answer
import heroquizz.Quizz
import heroquizz.Role
import heroquizz.User
import heroquizz.UserRole
import grails.util.GrailsUtil

class BootStrap {

  def init = { servletContext ->

    if (GrailsUtil.isDevelopmentEnv()) {
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

    def fbRole = 'ROLE_FACEBOOK'
    if (!Role.findByAuthority(fbRole)) {
      new Role(authority: fbRole).save()
    }

    def adminRole = 'ROLE_ADMIN'
    if (!Role.findByAuthority(adminRole)) {
      new Role(authority: adminRole).save()
    }

    User.findAll().each {
      it.delete(flush: true)
    }
    
    
    def userRole = 'ROLE_USER'
    if (!Role.findByAuthority(userRole)) {
      new Role(authority: userRole).save()
    }

    if (!User.findByUsername('admin')) {
      def admin = new User(username: 'admin', password: 'admin', enabled: true).save()
      UserRole.create(admin, Role.findByAuthority(adminRole), true)
      UserRole.create(admin, Role.findByAuthority(fbRole), true)
    }
  }
  def destroy = {
  }
}
