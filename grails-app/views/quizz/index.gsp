<%@ page import="heroquizz.Quizz" %>
<head>
  <meta name="layout" content="main">
</head>

<body>
<div class="row">
  <div class="span5 ctxt well whiteback">
    <img src="${resource(dir: 'images', file: 'question.jpg')}"/>
  </div>

  <div class="span5">

    <h1>Xebia Quizz</h1>
    <hr/>

    <p>Soyez certains d'avoir bien lu les <g:link action="disclaimer">conditions d'utilisation</g:link> de ce site.</p>

    <p><g:message code="quizz.choose"/></p>

    <ul class="">

    </ul>

    <div class="clearfix">

      <ul>
        <g:each in="${Quizz.findByPublished(true)}" var="quizzInstance">
          <li>
            <g:link action="take" id="${quizzInstance.id}">
              ${quizzInstance?.name?.encodeAsHTML()}
            </g:link>
          </li>
        </g:each>

      </ul>
    </div>
  </div>
</div>
</body>
