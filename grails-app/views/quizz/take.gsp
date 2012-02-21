<%@ page import="heroquizz.Question" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div class="form-horizontal">



  <form class="form-horizontal">
    <fieldset>
      <legend><g:fieldValue bean="${questionInstance}" field="text"/></legend>
      <div class="control-group">

        <div class="controls">
          <ul>
          <g:each in="${questionInstance.answers}" var="a">
            <li><g:link action="answer" id="${a.id}">${a?.text?.encodeAsHTML()}</g:link></li>
          </g:each>
          </ul>
        </div>
      </div>
    </fieldset>
  </form>

</div>
</body>
</html>
