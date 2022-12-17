<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="./partials/head.jsp"/>


<c:set var="message" value='${requestScope["message"]}' />
<c:if test='${fn:contains(message, "docusign.com/oauth/auth") }'>

    <c:redirect url="${message}" />

</c:if>
<div style="margin-top:30px!important; padding-top:30px!important; min-height: calc(100vh - 312 px); background: #001730;">

<p><strong>Oops, we have encountered a problem.</strong></p>
<p><em>Message: </em><span style="color:#00BAA1;">${done.message}</span></p>
<p><em>Dump: </em><span style="color:#00BAA1;">${done.stackTrace}</span></p>


<p>Please check your account configuration. If you are unable to resolve the problem, <a href="https://github.com/docusign/sample-app-mymedicalrecords-java/issues/new" target="_blank" rel="nofollow noopener noreferrer">open a new issue on GitHub</a>.</p>


<p><a class="startBox" href="/">Continue</a></p>
</div>
<jsp:include page="./partials/foot.jsp"/>
