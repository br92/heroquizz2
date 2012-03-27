
<%@ page import="heroquizz.QuizzAnswer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"><g:var meta
		<g:set var="entityName" value="${message(code: 'quizzAnswer.label', default: 'QuizzAnswer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-quizzAnswer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-quizzAnswer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list quizzAnswer">
			
				<g:if test="${quizzAnswerInstance?.originalQuizz}">
				<li class="fieldcontain">
					<span id="originalQuizz-label" class="property-label"><g:message code="quizzAnswer.originalQuizz.label" default="Original Quizz" /></span>
					
						<span class="property-value" aria-labelledby="originalQuizz-label"><g:link controller="quizz" action="show" id="${quizzAnswerInstance?.originalQuizz?.id}">${quizzAnswerInstance?.originalQuizz?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${quizzAnswerInstance?.validated}">
				<li class="fieldcontain">
					<span id="validated-label" class="property-label"><g:message code="quizzAnswer.validated.label" default="Validated" /></span>
					
						<g:each in="${quizzAnswerInstance.validated}" var="v">
						<span class="property-value" aria-labelledby="validated-label"><g:link controller="question" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${quizzAnswerInstance?.completed}">
				<li class="fieldcontain">
					<span id="completed-label" class="property-label"><g:message code="quizzAnswer.completed.label" default="Completed" /></span>
					
						<span class="property-value" aria-labelledby="completed-label"><g:formatBoolean boolean="${quizzAnswerInstance?.completed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${quizzAnswerInstance?.createdDate}">
				<li class="fieldcontain">
					<span id="createdDate-label" class="property-label"><g:message code="quizzAnswer.createdDate.label" default="Created Date" /></span>
					
						<span class="property-value" aria-labelledby="createdDate-label"><g:formatDate date="${quizzAnswerInstance?.createdDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${quizzAnswerInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="quizzAnswer.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${quizzAnswerInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${quizzAnswerInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="quizzAnswer.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="facebookUser" action="show" id="${quizzAnswerInstance?.owner?.id}">${quizzAnswerInstance?.owner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${quizzAnswerInstance?.score}">
				<li class="fieldcontain">
					<span id="score-label" class="property-label"><g:message code="quizzAnswer.score.label" default="Score" /></span>
					
						<span class="property-value" aria-labelledby="score-label"><g:fieldValue bean="${quizzAnswerInstance}" field="score"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${quizzAnswerInstance?.id}" />
					<g:link class="edit" action="edit" id="${quizzAnswerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
