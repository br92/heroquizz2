package heroquizz

import org.springframework.dao.DataIntegrityViolationException

class ScoreMessageController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def index() {
    redirect(action: "list", params: params)
  }

  def list() {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [scoreMessageInstanceList: ScoreMessage.list(params), scoreMessageInstanceTotal: ScoreMessage.count()]
  }

  def create() {
    [scoreMessageInstance: new ScoreMessage(params), quizzId: params.id]
  }

  def save() {

    Quizz ownerQuizz = Quizz.get(params.quizzId)

    def scoreMessageInstance = new ScoreMessage(params)

    scoreMessageInstance.quizz = ownerQuizz

    if (!scoreMessageInstance.save(flush: true)) {
      render(view: "create", model: [scoreMessageInstance: scoreMessageInstance])
      return
    }

    flash.message = message(code: 'default.created.message', args: [message(code: 'scoreMessage.label', default: 'ScoreMessage'), scoreMessageInstance.id])

    redirect(action: "show", controller: 'quizz', id: ownerQuizz.id)
  }

  def show() {
    def scoreMessageInstance = ScoreMessage.get(params.id)
    if (!scoreMessageInstance) {
      flash.message = message(code: 'default.not.found.message', args: [message(code: 'scoreMessage.label', default: 'ScoreMessage'), params.id])
      redirect(action: "list")
      return
    }

    [scoreMessageInstance: scoreMessageInstance]
  }

  def edit() {
    def scoreMessageInstance = ScoreMessage.get(params.id)
    if (!scoreMessageInstance) {
      flash.message = message(code: 'default.not.found.message', args: [message(code: 'scoreMessage.label', default: 'ScoreMessage'), params.id])
      redirect(action: "list")
      return
    }

    [scoreMessageInstance: scoreMessageInstance]
  }

  def update() {
    def scoreMessageInstance = ScoreMessage.get(params.id)
    if (!scoreMessageInstance) {
      flash.message = message(code: 'default.not.found.message', args: [message(code: 'scoreMessage.label', default: 'ScoreMessage'), params.id])
      redirect(action: "list")
      return
    }

    if (params.version) {
      def version = params.version.toLong()
      if (scoreMessageInstance.version > version) {
        scoreMessageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
            [message(code: 'scoreMessage.label', default: 'ScoreMessage')] as Object[],
            "Another user has updated this ScoreMessage while you were editing")
        render(view: "edit", model: [scoreMessageInstance: scoreMessageInstance])
        return
      }
    }

    scoreMessageInstance.properties = params

    if (!scoreMessageInstance.save(flush: true)) {
      render(view: "edit", model: [scoreMessageInstance: scoreMessageInstance])
      return
    }

    flash.message = message(code: 'default.updated.message', args: [message(code: 'scoreMessage.label', default: 'ScoreMessage'), scoreMessageInstance.id])
    redirect(action: "show", id: scoreMessageInstance.id)
  }

  def delete() {
    def scoreMessageInstance = ScoreMessage.get(params.id)
    if (!scoreMessageInstance) {
      flash.message = message(code: 'default.not.found.message', args: [message(code: 'scoreMessage.label', default: 'ScoreMessage'), params.id])
      redirect(action: "list")
      return
    }

    try {
      scoreMessageInstance.delete(flush: true)
      flash.message = message(code: 'default.deleted.message', args: [message(code: 'scoreMessage.label', default: 'ScoreMessage'), params.id])
      redirect(action: "list")
    }
    catch (DataIntegrityViolationException e) {
      flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'scoreMessage.label', default: 'ScoreMessage'), params.id])
      redirect(action: "show", id: params.id)
    }
  }
}
