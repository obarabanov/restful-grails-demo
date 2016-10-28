
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
		<div id="list-vote" class="content scaffold-list" role="main">
			
			<h1>Votes for GitHub repo: <a href="${repoUrl}">${repoUrl}</a></h1>
			
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<table>
				<thead>
					<tr>
					
						<%--
						TODO:	convert into plain 'comments' list page
						--%>
					
					
						<g:sortableColumn property="name" title="${message(code: 'vote.name.label', default: 'Name')}" />
						
						<g:sortableColumn property="voteValue" title="${message(code: 'vote.voteValue.label', default: 'Vote Value')}" />
					
						<g:sortableColumn property="comment" title="${message(code: 'vote.comment.label', default: 'Comment')}" />
						
						<%--
						<g:sortableColumn property="repoUrl" title="${message(code: 'vote.repoUrl.label', default: 'Repo Url')}" />
						--%>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${voteInstanceList}" status="i" var="voteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: voteInstance, field: "name")}</td>
						
						<td>${fieldValue(bean: voteInstance, field: "voteValue")}</td>
						
						<td><textarea style="width: 100%; height: 40px;" readonly="readonly">${fieldValue(bean: voteInstance, field: "comment")}</textarea></td>
					
						<%--
						<td><g:link action="show" id="${voteInstance.id}">${fieldValue(bean: voteInstance, field: "comment")}</g:link></td>
						
						<td>${fieldValue(bean: voteInstance, field: "repoUrl")}</td>
						--%>
					
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
