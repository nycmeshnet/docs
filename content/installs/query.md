---
title: "Query"
---
This is for installers to query our install spreadsheet. This is password protected.

This uses simple matching for addresses. Type the number and street name, e.g. "123 Smith St". Don't enter a complete address! For NN, install number and email it uses exact matches.

<form action="https://script.google.com/macros/s/AKfycbzzuk0hRRK6Q-Ck6rhdkF-NRLyNi3j61uSBMyf0PNjcfFBXcp3-RZENXr2nS1zf8_OX/exec">

  <label for="Search type">Search type:</label>
  <select id="type" name="type">
    <option value="address">Address</option>
    <option value="email">Email</option>
    <option value="nn">NN</option>
    <option value="install">Install num</option>
  </select>
  <br/>
  <br/>
  <label for="address">Search for:</label>
  <input type="hidden" id="method" name="method" value="query">
  <input type="hidden" name="format" value="1" />
  <input type="text" name="query" value=""/>
  <br/>
  <br/>
  <label for="pwd">Password:</label>
  <input type="password" minlength="8" id="id" name="pwd" >
  <br/>
  <br/>
  <input type="submit" value='Enter query'>
</form>



