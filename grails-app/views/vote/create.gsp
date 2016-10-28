<%@ page import="jukin.thingamajig.Vote" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vote.label', default: 'Vote')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-vote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index">All votes list</g:link></li>
			</ul>
		</div>
		<div id="create-vote" class="content scaffold-create" role="main">
		
			<h1>Vote on repo: ${voteInstance?.repoUrl}</h1>
			
			
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${voteInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${voteInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:form url="[resource:voteInstance, action:'save']"
				>
				<%--
				 params="[repoUrl: voteInstance?.repoUrl]"
				--%>
				 
				<fieldset class="form">
				
					<%--
					<g:render template="form"/>
					--%>
					
					<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'name', 'error')} required">
						<label for="name">
							<g:message code="vote.name.label" default="Your name" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="name" required="" value="${voteInstance?.name}"/>
					
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'voteValue', 'error')} required">
						<label for="voteValue">
							<g:message code="vote.voteValue.label" default="Your Vote" />
							<span class="required-indicator">*</span>
						</label>
						<g:select name="voteValue" from="${voteInstance.constraints.voteValue.inList}" required="" value="${voteInstance?.voteValue}" valueMessagePrefix="vote.voteValue"/>
					
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'comment', 'error')} ">
						<label for="comment">
							<g:message code="vote.comment.label" default="Comment" />
							
						</label>
						<%--
						<g:textField name="comment" value="${voteInstance?.comment}"/>
						--%>
						<g:textArea name="comment" value="${voteInstance?.comment}" rows="5" cols="40" />
					
					</div>
					
					<%--
					<g:textField type="hidden" name="repoUrl" value="${voteInstance?.repoUrl}"/>
					--%>
					<input type="hidden" name="repoUrl" value="${voteInstance?.repoUrl}" />
					
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Submit" />
				</fieldset>
			</g:form>
			
		</div>
	</body>
</html>
