class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "github", action: "list")
        //"/"(view:"/index")
        "500"(view:'/error')
	}
}
