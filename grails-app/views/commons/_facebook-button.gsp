<div id="fb-root"></div>

<script>
  window.fbAsyncInit = function () {
    FB.init({
      appId:'${grailsApplication.config.grails.plugins.springsecurity.facebook.appId}',
      channelUrl : '${resource(file:"/channel.html", absolute:"true")}',
      status:true,
      cookie:true,
      xfbml:true,
      oauth:true
    });

    FB.Event.subscribe('auth.login', function (response) {
      <g:if test="${controller}">
      window.location.href = '<g:createLink controller="${controller}"/>';
      </g:if>
      $('#facebook-connect').hide();
    });
  };


  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/fr_FR/all.js#xfbml=1&appId=<%= grailsApplication.config.grails.plugins.springsecurity.facebook.appId %>";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
</script>

<div class="fb-login-button" data-show-faces="true" data-width="200" data-max-rows="2"></div>
