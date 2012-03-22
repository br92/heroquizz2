<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>

</head>

<body>

<div class="row">
    <div class="span3">

        <div class="well" id="facebook-connect">
            <g:render template="/commons/facebook-button"/>
        </div>

        <div class="well" id="facebook-like" style="display: none;">
            <div class="fb-like" data-href="<g:createLink controller="home" absolute="true"/>" data-send="false" data-layout="box_count" data-width="450" data-show-faces="false" data-font="arial"></div>
        </div>

    </div>

    <div class="span8 well">

        <h1><g:message code="index.welcome"/></h1>

        <hr/>

        <p>
            Testez votre niveau en Java et vos connaissances agiles.
        </p>

        <p>
            Choisissez votre QCM parmi ceux qui vous sont proposés.
            Visionnez les questions en vidéo, et cochez la ou les bonnes réponses
        </p>

        <p>
            Votre score s'affichera sur votre mur Facebook et vous donnera votre niveau technique et agile.
        </p>

        <p>
            Challengez vos amis en leur envoyant un Xebia Quizz.
        </p>

        <hr/>

        <p>
            <g:link controller="quizz"><g:message code="index.enter.quizz"/></g:link>
        </p>
    </div>
</div>
</body>
</html>
