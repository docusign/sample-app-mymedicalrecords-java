<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</content>
</div>
<!-- The opening div for the container is in head.ejs -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.5/core.min.js"></script>

<script src="/assets/notify.min.js"></script>
<!-- see https://notifyjs.jpillora.com/ -->
<script src="/assets/eg_03.js"></script>

<c:if test="${false}">
    <!-- For debugging: showing local values including session -->
    <pre>
  locals:
            ${locals}
  </pre>
</c:if>

<!-- Data from the server -->
<div id="server_data" data-server-data='{"flash": "${locals.messages}"}'
     class="hidden"></div>
</body>
</html>
