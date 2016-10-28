<%@ page import="jukin.thingamajig.Vote" %>



<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="vote.comment.label" default="Comment" />
		
	</label>
	<g:textField name="comment" value="${voteInstance?.comment}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'voteValue', 'error')} required">
	<label for="voteValue">
		<g:message code="vote.voteValue.label" default="Vote Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="voteValue" from="${voteInstance.constraints.voteValue.inList}" required="" value="${voteInstance?.voteValue}" valueMessagePrefix="vote.voteValue"/>

</div>

<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="vote.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${voteInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'repoUrl', 'error')} required">
	<label for="repoUrl">
		<g:message code="vote.repoUrl.label" default="Repo Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="repoUrl" required="" value="${voteInstance?.repoUrl}"/>

</div>

