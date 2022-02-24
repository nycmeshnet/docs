---
title: "Install Status"
---
This is for installers to query the install status for a street address. This is password protected.

This uses simple matching, so just type the number and street name, e.g. "123 Smith St". Don't enter a complete address!

<form action="https://script.google.com/macros/s/AKfycbzIjF6q0PQFm2Y_YcZm9HGLU6QmNISpZWkRGbdYYZ_Oo1BvvY9MMuQfDBtyFT8vEPx4/exec">
  <label for="address">Address:</label>
  <input type="hidden" id="method" name="method" value="status">
  <input type="hidden" name="format" value="1" />
  <input type="text" name="address" value=""/>
  
  <label for="pwd">Password:</label>
  <input type="password" minlength="8" id="id" name="pwd" >
  <input type="submit" value='Get Status'>
</form>

<br/>
<br/>


