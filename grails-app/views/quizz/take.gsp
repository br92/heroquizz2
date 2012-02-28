<%@ page import="heroquizz.Question" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="canvas">
  <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div class="hero-unit">
  <p><g:fieldValue bean="${questionInstance}" field="text"/></p>

  <g:form action="take">
    <fieldset>
      <div class="clearfix">
        <div class="input">
          <ul class="inputs-list">
            <g:each in="${questionInstance.answers}" var="a">
              <li>
                <label>
                  <g:checkBox name="answer" value="${a.id}" checked="${false}"/>
                  <span>${a?.text?.encodeAsHTML()}</span>
                </label>
              </li>
            </g:each>

          </ul>
        </div>
      </div>
    </fieldset>

    <div class="actions">
      <g:submitButton name="submit" value="Valider" class="btn primary" />
    </div>
  </g:form>
</div>

</body>
</html>
