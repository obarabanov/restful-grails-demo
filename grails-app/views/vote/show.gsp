
<%@ page import="jukin.thingamajig.Vote" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vote.label', default: 'Vote')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vote" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vote">
			
				<g:if test="${voteInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="vote.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${voteInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${voteInstance?.voteValue}">
				<li class="fieldcontain">
					<span id="voteValue-label" class="property-label"><g:message code="vote.voteValue.label" default="Vote Value" /></span>
					
						<span class="property-value" aria-labelledby="voteValue-label"><g:fieldValue bean="${voteInstance}" field="voteValue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${voteInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="vote.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${voteInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${voteInstance?.repoUrl}">
				<li class="fieldcontain">
					<span id="repoUrl-label" class="property-label"><g:message code="vote.repoUrl.label" default="Repo Url" /></span>
					
						<span class="property-value" aria-labelledby="repoUrl-label"><g:fieldValue bean="${voteInstance}" field="repoUrl"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:voteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${voteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
