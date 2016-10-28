
<%@ page import="jukin.thingamajig.Vote" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vote.label', default: 'Vote')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Repos List</a></li>
				<li><g:link class="create" action="create" params="[repoUrl: repoUrl]"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vote" class="content scaffold-list" role="main" style="padding-left: 10px;">
			
			<h1>Votes for GitHub repo: <a href="${repoUrl}">${repoUrl}</a></h1>
			
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:each in="${voteInstanceList}" status="i" var="voteInstance">
				
				<br/>
				Name: ${fieldValue(bean: voteInstance, field: "name")}
				voted: ${fieldValue(bean: voteInstance, field: "voteValue")}
				
				<br/>
				<br/>
			
				Comment: ${fieldValue(bean: voteInstance, field: "comment")}
				
				<br/><br/>
				
				<hr/>
			
			</g:each>
				
			
			<div class="pagination">
				<g:paginate total="${voteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
