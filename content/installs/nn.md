---
title: "Network Number"
---

We have changed the way "node numbers" work and we're now using the term NN or "network number". 

Previously each install would have a number and that number would be used to configure the OmniTiks, generating an associated IP address. We only have 8192 of these addresses so we are now using unassigned lower numbers. 

Enter the install number below to get the NN that can be used to configure the rooftop antennas. This can also be used with multiple apartment installs to figure out the network number (NN) for the roof.

<form action="https://script.google.com/macros/s/AKfycbw4WgfR01CLqZcTtQi_5o7l6GXTPKJs4ep2Tpw7TdeH-uqRiuY/exec" method="nn">
  <label for="installnum">Install number:</label>
  <input type="hidden" id="method" name="method" value="nn">
  <input type="number" id="id" name="id" min="1" max="100000">
  <input type="submit">
</form>

<script language="JavaScript">
    function showInput() {
        document.getElementById('display').innerHTML = 
                    document.getElementById("user_input").value;
    }
  </script>


