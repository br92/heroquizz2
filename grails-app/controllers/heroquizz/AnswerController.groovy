package heroquizz

import org.springframework.dao.DataIntegrityViolationException

class AnswerController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def index() {
    redirect(action: "list", params: params)
  }

  def list() {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [answerInstanceList: Answer.list(params), answerInstanceTotal: Answer.count()]
  }

  def create() {
    if (!params.id) {
      log.warn("Can't create answer not linked to a given question id")
    }
    [answerInstance: new Answer(params), forQuestion: Question.get(params.id as Long)]
  }

  def save() {
    def answerInstance = new Answer(params)
    def owner = Question.get(params.questionId)

    answerInstance.question = owner

    if (!answerInstance.save(flush: true)) {
      render(view: "create", model: [answerInstance: answerInstance])
      return
    }
    
    flash.message = message(code: 'default.created.message', args: [message(code: 'answer.label', default: 'Answer'), answerInstance.id])
    redirect(controller: 'question', action: "show", id: params.questionId)
  }

  def show() {
    def answerInstance = Answer.get(params.id)
    if (!answerInstance) {
      flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), params.id])
      redirect(action: "list")
      return
    }

    [answerInstance: answerInstance]
  }

  def edit() {
    def answerInstance = Answer.get(params.id)
    if (!answerInstance) {
      flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), params.id])
      redirect(action: "list")
      return
    }

    [answerInstance: answerInstance, forQuestion: answerInstance.question]
  }

  def update() {
    def answerInstance = Answer.get(params.id)
    if (!answerInstance) {
      flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), params.id])
      redirect(action: "list")
      return
    }

    if (params.version) {
      def version = params.version.toLong()
      if (answerInstance.version > version) {
        answerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
            [message(code: 'answer.label', default: 'Answer')] as Object[],
            "Another user has updated this Answer while you were editing")
        render(view: "edit", model: [answerInstance: answerInstance])
        return
      }
    }

    answerInstance.properties = params

    if (!answerInstance.save(flush: true)) {
      render(view: "edit", model: [answerInstance: answerInstance])
      return
    }

    flash.message = message(code: 'default.updated.message', args: [message(code: 'answer.label', default: 'Answer'), answerInstance.id])
    redirect(action: "show", id: answerInstance.id)
  }

  def delete() {
    def answerInstance = Answer.get(params.id)
    if (!answerInstance) {
      flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), params.id])
      redirect(action: "list")
      return
    }

    def exOwnerId = answerInstance.question.id


    try {
      answerInstance.delete(flush: true)
      flash.message = message(code: 'default.deleted.message', args: [message(code: 'answer.label', default: 'Answer'), params.id])
      redirect(controller: 'question', action: 'show', id: exOwnerId)
    }
    catch (DataIntegrityViolationException e) {
      flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'answer.label', default: 'Answer'), params.id])
      redirect(action: "show", id: params.id)
    }
  }
}
