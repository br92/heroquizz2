package heroquizz



import org.junit.*
import grails.test.mixin.*

@TestFor(ScoreMessageController)
@Mock(ScoreMessage)
class ScoreMessageControllerTests {


  def populateValidParams(params) {
    assert params != null
    // TODO: Populate valid properties like...
    //params["name"] = 'someValidName'
  }

  void testIndex() {
    controller.index()
    assert "/scoreMessage/list" == response.redirectedUrl
  }

  void testList() {

    def model = controller.list()

    assert model.scoreMessageInstanceList.size() == 0
    assert model.scoreMessageInstanceTotal == 0
  }

  void testCreate() {
    def model = controller.create()

    assert model.scoreMessageInstance != null
  }

  void testSave() {
    controller.save()

    assert model.scoreMessageInstance != null
    assert view == '/scoreMessage/create'

    response.reset()

    populateValidParams(params)
    controller.save()

    assert response.redirectedUrl == '/scoreMessage/show/1'
    assert controller.flash.message != null
    assert ScoreMessage.count() == 1
  }

  void testShow() {
    controller.show()

    assert flash.message != null
    assert response.redirectedUrl == '/scoreMessage/list'


    populateValidParams(params)
    def scoreMessage = new ScoreMessage(params)

    assert scoreMessage.save() != null

    params.id = scoreMessage.id

    def model = controller.show()

    assert model.scoreMessageInstance == scoreMessage
  }

  void testEdit() {
    controller.edit()

    assert flash.message != null
    assert response.redirectedUrl == '/scoreMessage/list'


    populateValidParams(params)
    def scoreMessage = new ScoreMessage(params)

    assert scoreMessage.save() != null

    params.id = scoreMessage.id

    def model = controller.edit()

    assert model.scoreMessageInstance == scoreMessage
  }

  void testUpdate() {
    controller.update()

    assert flash.message != null
    assert response.redirectedUrl == '/scoreMessage/list'

    response.reset()


    populateValidParams(params)
    def scoreMessage = new ScoreMessage(params)

    assert scoreMessage.save() != null

    // test invalid parameters in update
    params.id = scoreMessage.id
    //TODO: add invalid values to params object

    controller.update()

    assert view == "/scoreMessage/edit"
    assert model.scoreMessageInstance != null

    scoreMessage.clearErrors()

    populateValidParams(params)
    controller.update()

    assert response.redirectedUrl == "/scoreMessage/show/$scoreMessage.id"
    assert flash.message != null

    //test outdated version number
    response.reset()
    scoreMessage.clearErrors()

    populateValidParams(params)
    params.id = scoreMessage.id
    params.version = -1
    controller.update()

    assert view == "/scoreMessage/edit"
    assert model.scoreMessageInstance != null
    assert model.scoreMessageInstance.errors.getFieldError('version')
    assert flash.message != null
  }

  void testDelete() {
    controller.delete()
    assert flash.message != null
    assert response.redirectedUrl == '/scoreMessage/list'

    response.reset()

    populateValidParams(params)
    def scoreMessage = new ScoreMessage(params)

    assert scoreMessage.save() != null
    assert ScoreMessage.count() == 1

    params.id = scoreMessage.id

    controller.delete()

    assert ScoreMessage.count() == 0
    assert ScoreMessage.get(scoreMessage.id) == null
    assert response.redirectedUrl == '/scoreMessage/list'
  }
}
