<%@ page import="heroquizz.Question" %>

<div class="control-group ${hasErrors(bean: questionInstance, field: 'videoUrl', 'error')}">
  <label for="videoUrl" class="control-label">
    <g:message code="question.videoUrl.label" default="Video Url"/>

  </label>

  <div class="controls">
    <g:field type="url" name="videoUrl" value="${questionInstance?.videoUrl}"/>
  </div>
</div>

<div class="control-group ${hasErrors(bean: questionInstance, field: 'text', 'error')}">
  <label for="text" class="control-label">
    <g:message code="question.text.label" default="Text"/>

  </label>

  <div class="controls">
    <g:textArea name="text" cols="40" rows="5" maxlength="255" value="${questionInstance?.text}"/>
  </div>
</div>

<g:hiddenField name="quizzId" value="${forQuizz.id}"/>



