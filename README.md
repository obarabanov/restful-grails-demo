About
------

This is a Grails-based RESTful web app demoing techs and functionality listed below:

Tech stack
----------
* Groovy / Grails
* GORM
* Grails support for domains as REST resources
* GitHub REST API


## User Stories - Basic
Don't ask me why, but the CTO loves to periodically check the top rated (in stars) **'groovy'** repositories on **Github**,
and view its latest commit – all on one simple page – with maybe 20 entries. 

It just has to be really simple and work, but it would be good to impress the boss. 

Requirements:

* when the application starts, the default URL should go to the main page (github/list)
* page load time must be less than 10 seconds. A good solution is less than 7 seconds.

## User Stories - Advanced
The CTO wants to involve the engineering team in finding interesting Groovy projects. Of the top 20 projects in Github,
he wants the Engineering team to be able to see them and vote on the projects.

The voting mechanism should be a simple like / dislike vote
with a textarea for the engineer to write why the repo was liked or disliked. This should be displayed as a comment stream attached to
each repo. The CTO also wants to see this implemented as a REST API.

The solution should fit into the Grails framework and employ Grails best practices. The embedded h2 database
should be used for the persistence layer.

Testing
------

There is a basic set of functional tests that must pass in order to submit an answer.
To run the functional tests, make sure you are in the project root and run:

```./grailsw test-app functional:```

