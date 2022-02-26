---
title: "Query"
---
This is for installers to query our install spreadsheet. This is password protected.

This uses simple matching for addresses. Type the number and street name, e.g. "123 Smith St". Don't enter a complete address!

<form action="https://script.google.com/macros/s/AKfycbwihieta9TevYOqYc6prgdYdf1BSCLQUPRBU9NN4zz9-nk27DABTBzOVl17sg3FszJx/exec">

  <label for="Search type">Search type:</label>
  <select id="type" name="type">
    <option value="address">Address</option>
    <option value="nn">NN</option>
    <option value="install">Install num</option>
  </select>

  <label for="address">Search for:</label>
  <input type="hidden" id="method" name="method" value="query">
  <input type="hidden" name="format" value="1" />
  <input type="text" name="query" value=""/>
  
  <label for="pwd">Password:</label>
  <input type="password" minlength="8" id="id" name="pwd" >
  <input type="submit" value='Enter query'>
</form>
 
<br/>
<br/>



