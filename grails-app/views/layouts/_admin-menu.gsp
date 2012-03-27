<sec:ifAllGranted roles="ROLE_ADMIN">
  <ul class="nav">
    <li class="dropdown">
      <a href="#"
         class="dropdown-toggle"
         data-toggle="dropdown">
        <g:message code="admin.menu.label" default="Manage"/>
        <b class="caret"></b>
      </a>
      <ul class="dropdown-menu">
        <li><g:link controller="quizz" action="list">Quizz</g:link></li>
        <li><g:link controller="quizzAnswer" action="list">Copies rendues</g:link></li>
      </ul>
    </li>
  </ul>
</sec:ifAllGranted>