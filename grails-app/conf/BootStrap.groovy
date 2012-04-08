import heroquizz.Question
import heroquizz.Answer
import heroquizz.Quizz
import heroquizz.Role
import heroquizz.User
import heroquizz.UserRole
import heroquizz.ScoreMessage

class BootStrap {

  def init = { servletContext ->

    def fbRole = 'ROLE_FACEBOOK'
    if (!Role.findByAuthority(fbRole)) {
      new Role(authority: fbRole).save(flush: true)
      fillQuizzJava()
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

  private void fillQuizzJava() {

    def quizz = new Quizz(name: 'Easy Java', description: 'Java, les bases, monitoring, performances, un peu de tout', published: true).save(flush: true)

    /**
     * Question 1
     */
    def question1 = new Question(quizz: quizz, text: 'A quoi sert le mot clef synchronized ?',
        videoUrl: 'https://s3-eu-west-1.amazonaws.com/xebia-video/xebiaquizz/synchronized.flv').save(flush: true)

    new Answer(text: 'Le code entouré par le mot clef synchronized ne peut pas être executé par plus d’un Thread à la fois.',
        pointsNumber: 2, question: question1).save(flush: true)
    new Answer(text: 'Lorsque la valeur d’une variable synchronized change, toutes les variables y faisant référence sont mises à jour.',
        pointsNumber: -2, question: question1).save(flush: true)
    new Answer(text: 'Le mot clef synchronized permet d’indiquer à la JVM qu’elle doit rafraichir son cache à chaque mise à jour de la variable par un Thread.',
        pointsNumber: -1, question: question1).save(flush: true)
    new Answer(text: 'A rien, et il est d’ailleurs déprécié à partir de java 1.4.',
        pointsNumber: -4, question: question1).save(flush: true)

    /**
     * Question 2
     */
    def question2 = new Question(quizz: quizz, text: 'Pourquoi ne peut-on pas définir de méthode statique dans une interface ?',
        videoUrl: 'https://s3-eu-west-1.amazonaws.com/xebia-video/xebiaquizz/static_vs_interface.flv').save(flush: true)

    new Answer(text: 'Car il faudrait aussi que l’interface soit statique',
        pointsNumber: -3, question: question2).save(flush: true)
    new Answer(text: 'Car les classes ne peuvent pas avoir de méthode static avec la même signature qu\'une de leurs classes/interfaces parents.',
        pointsNumber: -1, question: question2).save(flush: true)
    new Answer(text: 'Cela est un défaut de java qui sera corrigé dans Java 8.',
        pointsNumber: -1, question: question2).save(flush: true)
    new Answer(text: 'Car cela donnerait la possibilité d’appeler une méthode non implémentée depuis une interface',
        pointsNumber: 2, question: question2).save(flush: true)

    /**
     * Question 3
     */
    def question3 = new Question(quizz: quizz, text: 'Quelle est la différence entre une List et un Set ?',
        videoUrl: 'https://s3-eu-west-1.amazonaws.com/xebia-video/xebiaquizz/list_vs_set.flv').save(flush: true)

    new Answer(text: 'Les éléments de Set garde leur ordre de lecture.', pointsNumber: -1, question: question3).save(flush: true)
    new Answer(text: 'List est ThreadSafe et pas Set', pointsNumber: -1, question: question3).save(flush: true)
    new Answer(text: 'Chaque élément dans un Set est unique.', pointsNumber: 3, question: question3).save(flush: true)
    new Answer(text: 'List implémente Listable.', pointsNumber: -3, question: question3).save(flush: true)

    /**
     * Question 4
     */
    def question4 = new Question(quizz: quizz, text: 'Quelle API Java permet de communiquer avec une base de données, et quelle est sa version courante ?',
        videoUrl: 'https://s3-eu-west-1.amazonaws.com/xebia-video/xebiaquizz/heroquizz-java_db_api.flv').save(flush: true)

    new Answer(text: 'Open Database Connectivity (ODBC) version 4', pointsNumber: -2, question: question4).save(flush: true)
    new Answer(text: 'Java Database Connectivity (JDBC) version 4', pointsNumber: 2, question: question4).save(flush: true)
    new Answer(text: 'Java Database Protocol (JDBP) version 3', pointsNumber: -2, question: question4).save(flush: true)
    new Answer(text: 'Java Database Connector (JDBC) version 3', pointsNumber: -2, question: question4).save(flush: true)

    /**
     * Question 5
     */
    def question5 = new Question(quizz: quizz, text: 'Quelle est la différence entre la famille des Exception et celle des Error ?',
        videoUrl: '').save(flush: true)

    new Answer(text: 'Il n’est pas possible de catcher Error.', pointsNumber: -2, question: question5).save(flush: true)
    new Answer(text: 'Error est une erreur indépendante du programme qui vient d’une situation anormale.', pointsNumber: 2, question: question5).save(flush: true)
    new Answer(text: 'Error ne contient pas la méthode printStackTrace.', pointsNumber: -3, question: question5).save(flush: true)
    new Answer(text: 'Lever une Error permet de prévenir la JVM d\'un problème pour qu’elle agisse en conséquence, comme par exemple en levant une OutOfMemoryError pour que le GC s’active.', pointsNumber: -2, question: question5).save(flush: true)

    /**
     * Question 6
     */
    def question6 = new Question(quizz: quizz, text: 'Que fait la méthode Boolean.getBoolean(String name) ?',
        videoUrl: 'https://s3-eu-west-1.amazonaws.com/xebia-video/xebiaquizz/heroquizz-6-getBoolean.flv').save(flush: true)

    new Answer(text: 'Si on lui passe les chaines "true" et "false" elle renvoit les valeurs booléennes correspondantes.', pointsNumber: -2, question: question6).save(flush: true)
    new Answer(text: 'Elle retourne VRAI true si la propriété système dont le nom est passé en paramètre existe.', pointsNumber: 2, question: question6).save(flush: true)
    new Answer(text: 'Elle retourne VRAI si la variable d\'environnement dont le nom est passé en paramètre existe.', pointsNumber: -1, question: question6).save(flush: true)
    new Answer(text: 'Elle renvoit VRAI si "name" est différent de null, et renvoit FAUX sinon.', pointsNumber: -2, question: question6).save(flush: true)

    /**
     * Question 7
     */
    def question7 = new Question(quizz: quizz, text: 'Quelles sont les différentes \'policy\' de rétention des annotations ?',
        videoUrl: 'https://s3-eu-west-1.amazonaws.com/xebia-video/xebiaquizz/heroquizz-7-annotation_retention_policies.flv').save(flush: true)

    new Answer(text: 'Source, Class, Runtime.', pointsNumber: 2, question: question7).save(flush: true)
    new Answer(text: 'Application, Session, Request.', pointsNumber: -3, question: question7).save(flush: true)
    new Answer(text: 'Compile, Provided, Runtime.', pointsNumber: -2, question: question7).save(flush: true)
    new Answer(text: 'Loading, Instanciation, Finalization .', pointsNumber: -5, question: question7).save(flush: true)

    /**
     * Question 8
     */

    def question8 = new Question(quizz: quizz, text: 'Pouvez-vous expliquer ce qu\'est un membre "synthetic" ?',
        videoUrl: 'https://s3-eu-west-1.amazonaws.com/xebia-video/xebiaquizz/heroquizz-8-synthetic.flv').save(flush: true)

    new Answer(text: 'Ce sont des membres introduits par le compilateur, non présent dans le code source.', pointsNumber: 2, question: question8).save(flush: true)
    new Answer(text: 'Les membres annotés avec @Synthetic génère automatiquement leurs getters et setters.', pointsNumber: -2, question: question8).save(flush: true)
    new Answer(text: 'Les membres synthetic ont été introduit en Java 5 pour assurer la rétro compatibilité avec l\'Api collection de java 1.4, afin de pouvoir continuer à passer des collections non génériques.', pointsNumber: -3, question: question8).save(flush: true)
    new Answer(text: 'Un membre synthetic est un membre qui ne sera pas récupéré si on sérialize puis désérialize l\'objet sur lequel il se trouve.', pointsNumber: -5, question: question8).save(flush: true)

    /**
     * Question 9
     */
    def question9 = new Question(quizz: quizz, text: 'La quelle de ces phrases est vrai concernant l\'interface Callable et Runnable ?',
        videoUrl: '').save(flush: true)

    new Answer(text: 'La classe Thread et l\'interface Runnable hérite toutes deux de Callable.', pointsNumber: -2, question: question9).save(flush: true)
    new Answer(text: 'Les deux interfaces possèdent une méthode run.', pointsNumber: -3, question: question9).save(flush: true)
    new Answer(text: 'Callable peut remonter une Exception et pas Runnable.', pointsNumber: 2, question: question9).save(flush: true)
    new Answer(text: 'La méthode execute(...) de la classe Excutor de Java 1.5 ne prend que des instances de Callable en paramètre.', pointsNumber: -3, question: question9).save(flush: true)

    /**
     * Question 10
     */
    def question10 = new Question(quizz: quizz, text: 'Qu\'est ce qu\'une copie défensive ?',
        videoUrl: 'https://s3-eu-west-1.amazonaws.com/xebia-video/xebiaquizz/heroquizz-10-defensive_copy.flv').save(flush: true)

    new Answer(text: 'Une méthode utilisée pour créer des objets immuables.', pointsNumber: 2, question: question10).save(flush: true)
    new Answer(text: 'La copie d\'une variable dans une zone protégée du garbage collector afin qu\'elle ne soit pas effacée.', pointsNumber: -5, question: question10).save(flush: true)
    new Answer(text: 'Une technique de développement pour gérer les buffers d\'entrées/sorties.', pointsNumber: -3, question: question10).save(flush: true)
    new Answer(text: 'Une manière d\'implémenter la méthode clone().', pointsNumber: -2, question: question10).save(flush: true)

    new ScoreMessage(message: """Excellent ! Java en tant que langage n'a pas de secret pour vous. Vous excellez dans le design et
      aucune problématique d'architecture ne vous résiste.""", minimum: 4, quizz: quizz).save(flush: true)

    new ScoreMessage(message: """Pas mal ! Votre niveau technique est satisfaisant, vous possédez les bases
      nécessaires à un bon développement et une avez une bonne connaissance générale du langage Java.""", minimum: 2, quizz: quizz).save(flush: true)

    new ScoreMessage(message: """A améliorer ! Vous pouvez améliorer votre profondeur technique et vos
      connaissances de l'écosystème Java.""", minimum: -500, quizz: quizz).save(flush: true)
  }
}
