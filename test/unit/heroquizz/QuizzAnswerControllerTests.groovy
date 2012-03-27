package heroquizz



import org.junit.*
import grails.test.mixin.*

@TestFor(QuizzAnswerController)
@Mock(QuizzAnswer)
class QuizzAnswerControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/quizzAnswer/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.quizzAnswerInstanceList.size() == 0
        assert model.quizzAnswerInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.quizzAnswerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.quizzAnswerInstance != null
        assert view == '/quizzAnswer/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/quizzAnswer/show/1'
        assert controller.flash.message != null
        assert QuizzAnswer.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/quizzAnswer/list'


        populateValidParams(params)
        def quizzAnswer = new QuizzAnswer(params)

        assert quizzAnswer.save() != null

        params.id = quizzAnswer.id

        def model = controller.show()

        assert model.quizzAnswerInstance == quizzAnswer
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/quizzAnswer/list'


        populateValidParams(params)
        def quizzAnswer = new QuizzAnswer(params)

        assert quizzAnswer.save() != null

        params.id = quizzAnswer.id

        def model = controller.edit()

        assert model.quizzAnswerInstance == quizzAnswer
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/quizzAnswer/list'

        response.reset()


        populateValidParams(params)
        def quizzAnswer = new QuizzAnswer(params)

        assert quizzAnswer.save() != null

        // test invalid parameters in update
        params.id = quizzAnswer.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/quizzAnswer/edit"
        assert model.quizzAnswerInstance != null

        quizzAnswer.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/quizzAnswer/show/$quizzAnswer.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        quizzAnswer.clearErrors()

        populateValidParams(params)
        params.id = quizzAnswer.id
        params.version = -1
        controller.update()

        assert view == "/quizzAnswer/edit"
        assert model.quizzAnswerInstance != null
        assert model.quizzAnswerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/quizzAnswer/list'

        response.reset()

        populateValidParams(params)
        def quizzAnswer = new QuizzAnswer(params)

        assert quizzAnswer.save() != null
        assert QuizzAnswer.count() == 1

        params.id = quizzAnswer.id

        controller.delete()

        assert QuizzAnswer.count() == 0
        assert QuizzAnswer.get(quizzAnswer.id) == null
        assert response.redirectedUrl == '/quizzAnswer/list'
    }
}
