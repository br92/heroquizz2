<%@ page import="heroquizz.Quizz; heroquizz.Question" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="main">
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div class="hero-unit">

  <p><g:message code="quizz.choose"/></p>

  <ul class="">

  </ul>

  <div class="clearfix">

    <ul>
      <g:each in="${Quizz.findByPublished(true)}" var="quizzInstance">
        <li>
          <span><g:link action="take" id="${quizzInstance?.id}">${quizzInstance?.name?.encodeAsHTML()}</g:link></span>
        </li>

      </g:each>

    </ul>
  </div>
</div>
</div>

</body>
</html>
