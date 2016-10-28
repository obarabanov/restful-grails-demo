
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
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<%--
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				--%>
			</ul>
		</div>
		<div id="list-vote" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="id" title="${message(code: 'vote.id.label', default: 'id')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'vote.name.label', default: 'Name')}" />
						
						<g:sortableColumn property="voteValue" title="${message(code: 'vote.voteValue.label', default: 'Vote Value')}" />
						
						<g:sortableColumn property="comment" title="${message(code: 'vote.comment.label', default: 'Comment')}" />
					
						<g:sortableColumn property="repoUrl" title="${message(code: 'vote.repoUrl.label', default: 'Repo Url')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${voteInstanceList}" status="i" var="voteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${voteInstance.id}">${fieldValue(bean: voteInstance, field: "id")}</g:link></td>
						
						<td>${fieldValue(bean: voteInstance, field: "name")}</td>
						
						<td>${fieldValue(bean: voteInstance, field: "voteValue")}</td>
						
						<td>${fieldValue(bean: voteInstance, field: "comment")}</td>
					
						<td>${fieldValue(bean: voteInstance, field: "repoUrl")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${voteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
