<%@ page import="heroquizz.ScoreMessage" %>



<div class="fieldcontain ${hasErrors(bean: scoreMessageInstance, field: 'message', 'error')} required">
	<label for="message">
		<g:message code="scoreMessage.message.label" default="Message" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="message" required="" value="${scoreMessageInstance?.message}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: scoreMessageInstance, field: 'minimum', 'error')} required">
	<label for="minimum">
		<g:message code="scoreMessage.minimum.label" default="Minimum" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="minimum" required="" value="${fieldValue(bean: scoreMessageInstance, field: 'minimum')}"/>
</div>

<g:hiddenField name="quizzId" value="${quizzId}"/>