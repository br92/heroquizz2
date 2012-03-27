<%@ page import="heroquizz.QuizzAnswer" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'quizzAnswer.label', default: 'QuizzAnswer')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<ul class="nav nav-pills">
  <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
</ul>

<div class="row">
  <div class="span12">
    <legend><g:message code="default.list.label" args="[entityName]"/></legend>

  <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
  </g:if>



  <table class="table table-bordered">
    <thead>
    <tr>

      <th><g:message code="quizzAnswer.originalQuizz.label" default="Original Quizz"/></th>

      <th><g:message code="quizzAnswer.owner.label" default="Owner"/></th>

      <g:sortableColumn property="score" title="${message(code: 'quizzAnswer.score.label', default: 'Score')}"/>

      <g:sortableColumn property="lastUpdated"
                        title="${message(code: 'quizzAnswer.lastUpdated.label', default: 'Last Updated')}"/>

      <g:sortableColumn property="completed"
                        title="${message(code: 'quizzAnswer.completed.label', default: 'Completed')}"/>
    </tr>
    </thead>
    <tbody>
    <g:each in="${quizzAnswerInstanceList}" status="i" var="quizzAnswerInstance">
      <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

        <td><g:link action="show"
                    id="${quizzAnswerInstance.id}">${quizzAnswerInstance.originalQuizz.name}</g:link></td>

        <td>${fieldValue(bean: quizzAnswerInstance, field: "owner")}</td>

        <td>${fieldValue(bean: quizzAnswerInstance, field: "score")}</td>

        <td><g:formatDate date="${quizzAnswerInstance.lastUpdated}"/></td>

        <td><g:formatBoolean boolean="${quizzAnswerInstance.completed}"/></td>

      </tr>
    </g:each>
    </tbody>
  </table>

  <div class="pagination">
    <g:paginate total="${quizzAnswerInstanceTotal}"/>
  </div>
</div>
</div>

</body>
</html>
