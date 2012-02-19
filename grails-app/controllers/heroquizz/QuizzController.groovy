package heroquizz

import org.springframework.dao.DataIntegrityViolationException

class QuizzController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def index() {
    redirect(action: "list", params: params)
  }

  def list() {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [quizzInstanceList: Quizz.list(params), quizzInstanceTotal: Quizz.count()]
  }

  def create() {
    [quizzInstance: new Quizz(params)]
  }

  def save() {
    def quizzInstance = new Quizz(params)
    if (!quizzInstance.save(flush: true)) {
      render(view: "create", model: [quizzInstance: quizzInstance])
      return
    }

    flash.message = message(code: 'default.created.message', args: [message(code: 'quizz.label', default: 'Quizz'), quizzInstance.id])
    redirect(action: "show", id: quizzInstance.id)
  }

  def show() {
    def quizzInstance = Quizz.get(params.id)
    if (!quizzInstance) {
      flash.message = message(code: 'default.not.found.message', args: [message(code: 'quizz.label', default: 'Quizz'), params.id])
      redirect(action: "list")
      return
    }

    [quizzInstance: quizzInstance]
  }

  def edit() {
    def quizzInstance = Quizz.get(params.id)
    if (!quizzInstance) {
      flash.message = message(code: 'default.not.found.message', args: [message(code: 'quizz.label', default: 'Quizz'), params.id])
      redirect(action: "list")
      return
    }

    [quizzInstance: quizzInstance]
  }

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
}
