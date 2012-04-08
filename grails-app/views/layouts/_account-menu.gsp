<sec:ifLoggedIn>
  <sec:ifAnyGranted roles="ROLE_ADMIN">
    <ul class="nav pull-right">
      <li class="dropdown">
        <a href="#"
           class="dropdown-toggle"
           data-toggle="dropdown">

          <sec:username/>

          <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li>
            <g:link controller="logout"><g:message code="account.menu.logout" default="Logout"/></g:link>
          </li>
        </ul>
      </li>
    </ul>
  </sec:ifAnyGranted>
</sec:ifLoggedIn>