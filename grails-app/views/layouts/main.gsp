<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title><g:layoutTitle default="Xebia Quizz"/></title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <g:layoutHead/>

  <r:require modules="application"/>

  <r:layoutResources/>
</head>

<body>

<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <g:link class="brand" controller="home">Xebia Quizz</g:link>

      <div class="nav-collapse">
        <g:render template="/layouts/admin-menu"/>

        <g:render template="/layouts/account-menu"/>
      </div>

    </div>
  </div>
</div>

<div class="container">

  <g:layoutBody/>

  <div class="row">
    <div class="span12">
      <hr>
      <footer>
        <p>
          © <g:link url="http://blog.xebia.fr">XebiaFr</g:link> 2012
          - Powered by <g:link url="http://www.heroku.com">Heroku</g:link> - <g:link action="credits">Crédits</g:link>
        </p>
      </footer>
    </div>
  </div>

</div>

<r:layoutResources/>

</body>
</html>