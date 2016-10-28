class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "github", action: "list")
		
		"/votes"(resources:'vote', excludes:['delete'])
		
        "/home"(view:"/index")
        "500"(view:'/error')
	}
}
