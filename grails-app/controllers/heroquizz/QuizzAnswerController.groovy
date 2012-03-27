package heroquizz

import org.springframework.dao.DataIntegrityViolationException

class QuizzAnswerController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def list() {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [quizzAnswerInstanceList: QuizzAnswer.list(params), quizzAnswerInstanceTotal: QuizzAnswer.count()]
  }

  def show() {
    def quizzAnswerInstance = QuizzAnswer.get(params.id)
    if (!quizzAnswerInstance) {
      flash.message = message(code: 'default.not.found.message', args: [message(code: 'quizzAnswer.label', default: 'QuizzAnswer'), params.id])
      redirect(action: "list")
      return
    }

    [quizzAnswerInstance: quizzAnswerInstance]
  }


}
