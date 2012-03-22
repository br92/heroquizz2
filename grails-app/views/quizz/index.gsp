<%@ page import="heroquizz.Quizz" %>
<head>
    <meta name="layout" content="main">
</head>

<body>
<div class="row">
    <div class="span5 ctxt">
        <img src="${resource(dir: 'images', file: 'question.jpg')}"/>
    </div>

    <div class="span5 well">

        <h1>Xebia Quizz</h1>
        <hr/>
        <p><g:message code="quizz.choose"/></p>

        <ul class="">

        </ul>

        <div class="clearfix">

            <ul>
                <g:each in="${Quizz.findByPublished(true)}" var="quizzInstance">
                    <li>
                        <span><g:link action="take"
                                      id="${quizzInstance?.id}">${quizzInstance?.name?.encodeAsHTML()}</g:link></span>
                    </li>

                </g:each>

            </ul>
        </div>
    </div>
</div>
</body>
