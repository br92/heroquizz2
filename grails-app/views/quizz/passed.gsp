<head>
  <meta name="layout" content="main">
  <title><g:message code="app.title"/> - <g:message code="app.gratz"/></title>
</head>

<body>
<div class="row">
  <div class="span8 offset2 ctxt">

      <h1>Félicitations ! Voici la ligne d'arrivée !</h1>
    <hr/>
      <h3>Au questionnaire "${quizzAnswerInstance.originalQuizz.name}"

      Votre score final est de : ${quizzAnswerInstance.score} points.</h3>

    <hr/>
      <h3>${winMessage.message}</h3>
    <hr/>
      <g:link class="btn btn-primary" controller="quizz" action="index">
        Tenter un autre questionnaire
      </g:link>


  </div>
</div>
</body>