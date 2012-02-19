<%@ page import="heroquizz.Answer" %>

<g:hiddenField name="questionId" value="${questionId}"/>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="answer.text.label" default="Text" />
		
	</label>
	<g:textField name="text" maxlength="140" value="${answerInstance?.text}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'pointsNumber', 'error')} required">
	<label for="pointsNumber">
		<g:message code="answer.pointsNumber.label" default="Points Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="pointsNumber" from="${-10..10}" class="range" required="" value="${fieldValue(bean: answerInstance, field: 'pointsNumber')}"/>
</div>

