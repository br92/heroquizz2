<%@ page import="heroquizz.Question" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div>
  <h1>Question</h1>

  <g:form>
    <ol class="property-list question">

      <li class="fieldcontain">
        <g:fieldValue bean="${questionInstance}" field="text"/>

      </li>


      <g:if test="${questionInstance?.answers}">
        <li class="fieldcontain">
          <span id="answers-label" class="property-label"><g:message code="question.answers.label"
                                                                     default="Answers"/></span>

          <g:each in="${questionInstance.answers}" var="a">
            <span class="property-value" aria-labelledby="answers-label"><g:link action="answer"
                                                                                 id="${a.id}">"${a?.text?.encodeAsHTML()}" => ${a?.pointsNumber}</g:link></span>
          </g:each>

        </li>
      </g:if>

    </ol>

    <fieldset class="buttons">
      <g:hiddenField name="quizzId" value="${quizzInstance?.id}"/>

      <g:link class="edit" action="answer" id="${questionInstance?.id}"><g:message code="default.button.edit.label"
                                                                                   default="Edit"/></g:link>


      <g:actionSubmit class="delete" action="delete"
                      value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                      onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
    </fieldset>
  </g:form>
</div>
</body>
</html>
