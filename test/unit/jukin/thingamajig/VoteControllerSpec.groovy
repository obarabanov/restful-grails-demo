package jukin.thingamajig



import grails.test.mixin.*
import spock.lang.*

@TestFor(VoteController)
@Mock(Vote)
class VoteControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
		
        // Populate valid properties like...
        params["name"] = 'Tester One'
        params["repoUrl"] = 'https://github.com/java-decompiler/jd-gui'
        params["voteValue"] = 'LIKE'
        params["name"] = 'something to say 1..'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.voteInstanceList
            model.voteInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.voteInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            def vote = new Vote()
            vote.validate()
            controller.save(vote)

        then:"The create view is rendered again with the correct model"
            model.voteInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            vote = new Vote(params)

            controller.saveFromUI(vote)

        then:"A redirect is issued to the /list action"
			response.status == 302
            Vote.count() == 1
			
    }

    void "Test that the show action returns the correct model"() {
        
		when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def vote = new Vote(params)
            controller.show(vote)

        then:"A 404 error is returned"
            response.status == 404
		
    }

    void "Test the update action performs an update on a valid domain instance"() {
		
		when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            controller.update(null)

        then:"A redirect made"
            response.redirectedUrl == '/votes'
            flash.message != null
			

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def vote = new Vote()
            vote.validate()
            controller.update(vote)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.voteInstance == vote
			

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            vote = new Vote(params).save(flush: true)
            controller.update(vote)

        then:"A redirect is issues to the show action"
        	response.status == 302
            response.redirectedUrl == '/votes/1'
    }

}
