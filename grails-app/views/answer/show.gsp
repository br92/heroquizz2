<%@ page import="heroquizz.Answer" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'answer.label', default: 'Answer')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div class="row">
  <div class="span12">
    <ul class="breadcrumb">
      <li>
        <g:link controller="quizz" action="show"
                id="${answerInstance.question.quizz.id}">${answerInstance.question.quizz.name}</g:link>
        <span class="divider">/</span>
      </li>
      <li>
        <g:link controller="question" action="show"
                id="${answerInstance.question.id}">${answerInstance.question.text.substring(0, 10)}...</g:link>
        <span class="divider">/</span>
      </li>
      <li class="active">
        <a href="#"><g:message code="default.show.label" args="[entityName]"/></a>
      </li>
    </ul>
  </div>
</div>

<div class="row">
  <div class="span12">

    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>

    <legend><g:message code="default.show.label" args="[entityName]"/></legend>
    <ol class="property-list answer">

      <g:if test="${answerInstance?.text}">
        <li class="fieldcontain">
          <span id="text-label" class="property-label"><g:message code="answer.text.label" default="Text"/></span>

          <span class="property-value" aria-labelledby="text-label"><g:fieldValue bean="${answerInstance}"
                                                                                  field="text"/></span>

        </li>
      </g:if>

      <g:if test="${answerInstance?.pointsNumber}">
        <li class="fieldcontain">
          <span id="pointsNumber-label" class="property-label"><g:message code="answer.pointsNumber.label"
                                                                          default="Points Number"/></span>

          <span class="property-value" aria-labelledby="pointsNumber-label"><g:fieldValue bean="${answerInstance}"
                                                                                          field="pointsNumber"/></span>

        </li>
      </g:if>

    </ol>
    <g:form>
      <div class="form-actions">
        <g:hiddenField name="id" value="${answerInstance?.id}"/>
        <g:link class="btn btn-primary" action="edit" id="${answerInstance?.id}"><g:message
            code="default.button.edit.label"
            default="Edit"/></g:link>
        <g:actionSubmit class="btn btn-dark" action="delete"
                        value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
      </div>
    </g:form>
  </div>
</div>
</body>
</html>
