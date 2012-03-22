<%@ page import="heroquizz.Answer" %>


<div class="control-group ${hasErrors(bean: answerInstance, field: 'text', 'error')} ">
  <label for="text" class="control-label">
    <g:message code="answer.text.label" default="Text"/>

  </label>

  <div class="controls">
    <g:textField name="text" maxlength="140" value="${answerInstance?.text}"/>
  </div>
</div>

<div class="control-group ${hasErrors(bean: answerInstance, field: 'pointsNumber', 'error')} required">
  <label for="pointsNumber" class="control-label">
    <g:message code="answer.pointsNumber.label" default="Points Number"/>
    <span class="required-indicator">*</span>
  </label>

  <div class="controls">
    <g:select name="pointsNumber" from="${-10..10}" class="range" required=""
              value="${fieldValue(bean: answerInstance, field: 'pointsNumber')}"/>
  </div>
</div>

<g:hiddenField name="questionId" value="${forQuestion.id}"/>
