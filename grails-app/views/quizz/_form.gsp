<%@ page import="heroquizz.Quizz" %>

<div class="control-group ${hasErrors(bean: quizzInstance, field: 'name', 'error')}">
  <label class="control-label" for="name">
    <g:message code="quizz.name.label" default="Name"/>
  </label>

  <div class="controls">
    <g:textField name="name" class="input-large" maxlength="100" value="${quizzInstance?.name}"/>
  </div>
</div>

<div class="control-group ${hasErrors(bean: quizzInstance, field: 'description', 'error')} ">
  <label class="control-label" for="description">
    <g:message code="quizz.description.label" default="Description"/>
  </label>

  <div class="controls">
    <g:textArea name="description" cols="40" rows="5" maxlength="255" value="${quizzInstance?.description}"/>
  </div>
</div>

