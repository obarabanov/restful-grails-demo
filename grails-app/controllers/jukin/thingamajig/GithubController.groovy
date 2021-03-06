package jukin.thingamajig

import groovy.json.JsonSlurper

class GithubController {
	
	static defaultAction = "list"
	//	against GitHub's access limit
	static accessToken='f0c3134e73eef152ae784ccab218cc2935319fd3'
	

	def index = {
        redirect(action: "list")
    }

    def list() {
		
		def started = new Date()
		
		def language = 'groovy'
		//	"https://api.github.com/repositories?access_token=${accessToken}"
		def query = "https://api.github.com/search/repositories?q=language:${language}&sort=stars&order=desc&access_token=${accessToken}"
		query += '&per_page=20'
		//query += '&per_page=2' // for testing
		
        def text = queryGit( query )
		
		assert text : "whoa no github result"
		
        def reposJson = new JsonSlurper().parseText(text)
		
		int totally = 0
        reposJson.items.each { Map map ->

            totally += 1
			def full_name = map.full_name
			
            // get commits info
            def url = "https://api.github.com/repos/${full_name}/commits?access_token=${accessToken}"
			url += '&per_page=1'	// to get latest commit only
            def newText = queryGit(url)
            if (newText) {
                def commitsJson = new JsonSlurper().parseText(newText)
				def resList = commitsJson as List
				//log.trace "commits number: ${resList.size()}"
				def last = resList[0] as Map
				
                map.put 'last', last
                //map.put 'lastCommit', last.commit.author.date
                //map.put 'author', last.commit.author.name
            }

        }
		
        def finished = new Date()
		def tookTime = ( Date.getMillisOf(finished) - Date.getMillisOf(started) ) / 1000
		log.trace "Data processing took: ${tookTime} seconds, for ${totally} repos."
		
        def model = [json: reposJson.items, found: totally]
		render(view: 'index', model: model, contentType: 'text/html')

    }
	
    public static def queryGit(String urlToRead) {

        URL url;

        HttpURLConnection conn;
        BufferedReader rd;
        String line;
        String result = "";
        try {
            url = new URL(urlToRead);
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
             rd = new BufferedReader(new InputStreamReader(conn.getInputStream() ) );
            while ((line = rd.readLine()) != null) {
                result += line;
            }
            rd.close();

        } catch (IOException e) {
            e.printStackTrace();


        } catch (Exception e) {
            e.printStackTrace();

        }
        return result
    }


}
