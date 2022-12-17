<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




        </content>
        </div>
        <div class="footer">


                <p class="footLead">
                        DocuSign: It is time to agree better</p>

                        <p class="footSub">
                        Docusign helps organizations connect and automate how they prepare, sign, act on and </p>
                        <p class="footSub">
                        manage agreements
                </p>

                <div class="ctaLeft">
                <a href="https://go.docusign.com/o/sandbox/" class="cta"><span style="text-align:center">
                        Create&nbsp;developer&nbsp;account
                </span></a>
        </div>
        <div class="ctaRight">
                <a href="https://developers.docusign.com/" class="cta learnMore"><span style="text-align:center">
                        Learn&nbsp;More
                </span></a>
                </div>
                <br/>
                <br/>
        </div>


        <c:if test="${false}">
                <!-- For debugging: showing local values including session -->
                <pre>
  locals:
            ${locals}
  </pre>
        </c:if>


        <!-- Data from the server -->
        <div id="server_data" data-server-data='{"flash": "${locals.messages}"}' class="hidden"></div>
        </body>

        </html>