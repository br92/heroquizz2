<head>
  <meta name="layout" content="main">
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="row">
  <div class="span8 offset2">
    <div class="hero-unit">
      <h1>Félicitations !</h1>

      <h3>Au questionnaire "${quizzAnswerInstance.originalQuizz.name}"</h3>

      <p>Votre score final est de : ${quizzAnswerInstance.score} points.</p>

      <p>${winMessage.message}</p>

      <p><g:link controller="quizz">Tenter un autre questionnaire</g:link></p>
    </div>
  </div>
</div>
</body>