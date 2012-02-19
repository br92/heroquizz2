<%@ page import="heroquizz.Question" %>



<g:hiddenField name="quizzId" value="${quizzId}"/>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="question.text.label" default="Text" />
		
	</label>
	<g:textArea name="text" cols="40" rows="5" maxlength="255" value="${questionInstance?.text}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'videoUrl', 'error')} ">
	<label for="videoUrl">
		<g:message code="question.videoUrl.label" default="Video Url" />
		
	</label>
	<g:field type="url" name="videoUrl" value="${questionInstance?.videoUrl}"/>
</div>


