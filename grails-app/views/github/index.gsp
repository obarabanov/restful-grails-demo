<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Github Public Repos</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 54em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<div id="status" role="complementary">
            <div id="controller-list" role="navigation">
				<h1>Public Github Repos</h1>
				<h2>shown top ${found} for 'Groovy' language, sorted by stars</h2>
				<hr>
				<p>
		            <g:each in="${json}">
		                <h2>${it.full_name}</h2>
		                <span style="float:right;">stars: ${it.stargazers_count}</span>
		                ${it.description}<br/>
		                <a href="${it.html_url}">${it.html_url}</a><br/>
		                Latest <a href="${it.last?.html_url}">commit</a> made at: ${it.last?.commit.author.date} by: ${it.last?.commit.author.name}<br/>
		                
		                <br/>
		                <g:link controller="vote" action="list" params="[repoUrl: it.html_url]">Votes</g:link>
		                
		            </g:each>
	            </p>
            </div>
		</div>
	</body>
</html>
