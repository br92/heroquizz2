import heroquizz.Question
import heroquizz.Answer
import heroquizz.Quizz
import heroquizz.Role
import heroquizz.User
import heroquizz.UserRole
import grails.util.GrailsUtil
import heroquizz.FacebookUser
import heroquizz.ScoreMessage

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
      new Role(authority: fbRole).save(flush: true)
      fillDemoQuizz()
    }

    def adminRole = 'ROLE_ADMIN'
    if (!Role.findByAuthority(adminRole)) {
      new Role(authority: adminRole).save(flush: true)
    }

    def userRole = 'ROLE_USER'
    if (!Role.findByAuthority(userRole)) {
      new Role(authority: userRole).save(flush: true)
    }

    if (!User.findByUsername('admin')) {
      def admin = new User(username: 'admin', password: 'admin', enabled: true).save(flush: true)
      UserRole.create(admin, Role.findByAuthority(adminRole), true)
    }
  }

  def destroy = {
  }

  private void fillDemoQuizz() {

    def quizz = new Quizz(name: 'Technique 1', description: 'Java, les bases, monitoring, performances, un peu de tout', published: true).save(flush: true)

    def question1 = new Question(quizz: quizz, text: 'A quoi sert le mot clef synchronized ?').save(flush: true)
    new Answer(text: 'Le code entouré par le mot clef synchronized ne peut pas être executé par plus d’un Thread à la fois', pointsNumber: 2, question: question1).save(flush: true)
    new Answer(text: 'Lorsque la valeur d’une variable synchronized change, toutes les variables y faisant référence sont mises à jour.', pointsNumber: -2, question: question1).save(flush: true)
    new Answer(text: 'Le mot clef synchronized permet d’indiquer à la JVM qu’elle doit rafraichir son cache à chaque mise à jour de la variable par un Thread.', pointsNumber: -1, question: question1).save(flush: true)
    new Answer(text: 'A rien, et il est d’ailleurs déprécié à partir de java 1.4.', pointsNumber: -4, question: question1).save(flush: true)

    def question2 = new Question(quizz: quizz, text: 'Pourquoi ne peut-on pas définir de méthode statique dans une interface ?').save(flush: true)
    new Answer(text: 'Car il faudrait aussi que l’interface soit statique', pointsNumber: -3, question: question2).save(flush: true)
    new Answer(text: 'Car les classes ne peuvent pas avoir de méthode static avec la même signature qu\'une de leurs classes/interfaces parents.', pointsNumber: -1, question: question2).save(flush: true)
    new Answer(text: 'Cela est un défaut de java qui sera corrigé dans Java 8.', pointsNumber: 31, question: question2).save(flush: true)
    new Answer(text: 'Car cela donnerait la possibilité d’appeler une méthode non implémentée depuis une interface', pointsNumber: 2, question: question2).save(flush: true)

    def question3 = new Question(quizz: quizz, text: 'Quelle est le rôle d\'un classloader ?').save(flush: true)
    new Answer(text: 'Un ClassLoader est forcément une classe finale.', pointsNumber: -1, question: question3).save(flush: true)
    new Answer(text: 'Le classloader par défault est utilisé par la JVM pour charger des classes en code natifs appelées dans notre application et pouvoir les utiliser ?', pointsNumber: -2, question: question3).save(flush: true)
    new Answer(text: 'Le classloader par défault est utilisé par la JVM pour charger les classes appelées dans notre application et pouvoir les utiliser.', pointsNumber: -3, question: question3).save(flush: true)
    new Answer(text: 'Il sert principalement a générer des ClassNotFoundException.', pointsNumber: -5, question: question3).save(flush: true)

    new ScoreMessage(message: """Excellent ! Java n'a pas de secret pour vous, vous maitrisez les serveurs d'application, et
    manipulez les technos et les frameworks web avec brio !
    Aucune problématique d'architecture ne vous résiste.""", minimum: 4, quizz: quizz).save(flush: true)

    new ScoreMessage(message: """Pas mal ! Votre niveau technique est satisfaisant, vous possédez les bases
    nécessaires à un bon développement et une avez une bonne connaissance générale  de JEE.""", minimum: 2, quizz: quizz).save(flush: true)

    new ScoreMessage(message: """A améliorer ! Vous pouvez améliorer votre profondeur technique et vos
    connaissances de l'écosystème JEE.""", minimum: -500, quizz: quizz).save(flush: true)






  }
}
