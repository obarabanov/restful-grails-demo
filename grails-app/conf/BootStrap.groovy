import jukin.thingamajig.Vote;

class BootStrap {

    def init = { servletContext ->
		
		environments {
			
			development {
				
				//	for demo purposes
				new Vote(
					name: "Tester One",
					repoUrl: 'http://localhost:8080/jukin-thingamajig/votes',
					voteValue: 'LIKE',
					comment: "something to say 1.."
				).save( flush: true )
				
				new Vote(
					name: "Tester Two",
					repoUrl: 'http://localhost:8080/jukin-thingamajig/votes',
					voteValue: 'DISLIKE',
					comment: "comment goes here.."
				).save( flush: true )
				
				println "Demo data saved."
		
			}
			
			test {
			}
			
			production {
			}

		}

    }
	
    def destroy = {
    }
}
