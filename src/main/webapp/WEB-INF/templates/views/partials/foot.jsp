<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class = "footer" style ="position: absolute; width: 100%; height: 312px; top: 900px; left: -1px; background: #001730;">

        <p style= " position: absolute; width: 433px; height: 29px; left: 605px; top: 57px; font-family: Roboto; 
          font-style: normal; font-weight: bold; font-size: 24px; line-height: 29px; color: #F9F9F9; z-index: 2;">
          DocuSign: It is time to agree better</p>
          
        <p style = "position: absolute; width: 744px; height: 42px; left: 408px; top: 102px; font-family: Roboto; font-style: normal;
            font-weight: normal; font-size: 18px; line-height: 21px; text-align: center; color: #F9F9F9; z-index: 2;">
              Docusign helps organizations connect and automate how they prepare, sign, act on and manage agreements
        </p>
    
        <a href ="https://developers.docusign.com/" style = "position: absolute; width: 234px; height: 20px; left: 665px; top: 206px; font-family: Roboto;
          font-style: normal; font-weight: 500; font-size: 20px; line-height: 20px; display: flex; align-items: center; text-align: center;
          color: #2EF69B;">Create Docusign Developer Account</a>
    
</div>
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
