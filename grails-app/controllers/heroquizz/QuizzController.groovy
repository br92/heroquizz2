package heroquizz

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_FACEBOOK'])
class QuizzController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]


  def index() {

  }

  def list() {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [quizzInstanceList: Quizz.list(params), quizzInstanceTotal: Quizz.count()]
  }

  @Secured('ROLE_ADMIN')
  def create() {
    [quizzInstance: new Quizz(params)]
  }

  @Secured('ROLE_ADMIN')
  def save() {
    def quizzInstance = new Quizz(params)
    if (!quizzInstance.save(flush: true)) {
      render(view: "create", model: [quizzInstance: quizzInstance])
      return
    }

    flash.message = message(code: 'default.created.message', args: [message(code: 'quizz.label', default: 'Quizz'), quizzInstance.id])
    redirect(action: "show", id: quizzInstance.id)
  }

  @Secured('ROLE_ADMIN')
  def show() {
    def quizzInstance = Quizz.get(params.id)
    if (!quizzInstance) {
      flash.message = message(code: 'default.not.found.message', args: [message(code: 'quizz.label', default: 'Quizz'), params.id])
      redirect(action: "list")
      return
    }

    [quizzInstance: quizzInstance]
  }

  @Secured('ROLE_ADMIN')
  def edit() {
    def quizzInstance = Quizz.get(params.id)
    if (!quizzInstance) {
      flash.message = message(code: 'default.not.found.message', args: [message(code: 'quizz.label', default: 'Quizz'), params.id])
      redirect(action: "list")
      return
    }

    [quizzInstance: quizzInstance]
  }

  @Secured('ROLE_ADMIN')
  def update() {
    def quizzInstance = Quizz.get(params.id)
    if (!quizzInstance) {
      flash.message = message(code: 'default.not.found.message', args: [message(code: 'quizz.label', default: 'Quizz'), params.id])
      redirect(action: "list")
      return
    }

    if (params.version) {
      def version = params.version.toLong()
      if (quizzInstance.version > version) {
        quizzInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
            [message(code: 'quizz.label', default: 'Quizz')] as Object[],
            "Another user has updated this Quizz while you were editing")
        render(view: "edit", model: [quizzInstance: quizzInstance])
        return
      }
    }

    quizzInstance.properties = params

    if (!quizzInstance.save(flush: true)) {
      render(view: "edit", model: [quizzInstance: quizzInstance])
      return
    }

    flash.message = message(code: 'default.updated.message', args: [message(code: 'quizz.label', default: 'Quizz'), quizzInstance.id])
    redirect(action: "show", id: quizzInstance.id)
  }

  def delete() {
    def quizzInstance = Quizz.get(params.id)
    if (!quizzInstance) {
      flash.message = message(code: 'default.not.found.message', args: [message(code: 'quizz.label', default: 'Quizz'), params.id])
      redirect(action: "list")
      return
    }

    try {
      quizzInstance.delete(flush: true)
      flash.message = message(code: 'default.deleted.message', args: [message(code: 'quizz.label', default: 'Quizz'), params.id])
      redirect(action: "list")
    }
    catch (DataIntegrityViolationException e) {
      flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'quizz.label', default: 'Quizz'), params.id])
      redirect(action: "show", id: params.id)
    }
  }

  def take() {
    Quizz theQuizz

    if (!session.currentQuizzId) {
      session.currentQuizzId = params.id
      session.currentScore = 0
      theQuizz = Quizz.get(session.currentQuizzId as Long)
      session.questionsOk = []
    } else {
      theQuizz = Quizz.get(session.currentQuizzId as Long)
    }

    if (!theQuizz) {
      render(view: 'error-canvas')
    }

    def questionList = theQuizz.questions as List
    log.debug("Questions : ${questionList}")
    log.debug("Questions ok: ${session.questionsOk}")
    def nextQuestionId = questionList*.id.find { !session.questionsOk.contains(it) }
    log.debug("Next question id : ${nextQuestionId}")

    if (nextQuestionId)
      session.currentQuestionId = nextQuestionId
    else
      redirect(action: 'passed')

    [quizzInstance: theQuizz, questionInstance: Question.get(session.currentQuestionId as Long)]
  }

  def passed() {
    session.currentQuizzId = null
  }

  def answer() {

    println "answering with params : ${params}"
    Question currentQuestion = Question.get(params.currentQuestionId as Long)

    def answerList = []
    answerList << params.answers
    answerList = answerList.flatten()
    answerList.each { userAnswer ->
      def matchedAnswer = currentQuestion.answers.find { it.id == userAnswer as Long}

      if (matchedAnswer) {
        session.currentScore = (session.currentScore as Long) + matchedAnswer.pointsNumber
        println "matched ${matchedAnswer.id} with ${userAnswer}"
      } else {
        println "NOT matched with ${userAnswer}"
      }
      session.questionsOk << currentQuestion.id
    }

    println "Score is now: ${session.currentScore}"

    redirect(action: 'take')
  }
}
