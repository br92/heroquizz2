<sec:ifLoggedIn>
  <ul class="nav pull-right">
    <li class="dropdown">
      <a href="#"
         class="dropdown-toggle"
         data-toggle="dropdown">
        <sec:ifAnyGranted roles="ROLE_ADMIN">
          <sec:username/>
        </sec:ifAnyGranted>

        <sec:ifAnyGranted roles="ROLE_FACEBOOK">
          <g:message code="account.menu.label" default="Your account"/> ${fbUser?.completeName}
        </sec:ifAnyGranted>
        <b class="caret"></b>
      </a>
      <ul class="dropdown-menu">
        <li>
          <g:link controller="logout"><g:message code="account.menu.logout" default="Logout"/> </g:link>
        </li>
      </ul>
    </li>
  </ul>
</sec:ifLoggedIn>