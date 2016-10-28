import jukin.thingamajig.Vote;

class BootStrap {

    def init = { servletContext ->
		
		environments {
			
			development {
				
				//	for demo purposes
				new Vote(
					name: "Tester One",
					repoUrl: 'https://github.com/java-decompiler/jd-gui',
					voteValue: 'LIKE',
					comment: "something to say 1.."
				).save( flush: true )
				
				new Vote(
					name: "Tester Two",
					repoUrl: 'https://github.com/Netflix/asgard',
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
