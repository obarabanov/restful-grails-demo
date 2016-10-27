package jukin.thingamajig

import grails.rest.Resource;

@Resource(uri='/votes', formats=['json', 'xml']) //	TODO:	REST mapping exclude DELETE
class Vote {

	String name			// voter's name
	String repoUrl
	String voteValue	// either 'LIKE' or 'DISLIKE' 
	String comment

    static constraints = {
		
		comment		nullable: true, blank: true
		//repoUrl		url: true				//	TODO:	why bootstrap fails saving it silently ?
		voteValue	inList: ['LIKE', 'DISLIKE']
		
    }
	
}
