function verify(id)
{
var http = new XMLHttpRequest();
var url = "verify"; //to servlet
var params = "id=" + id ;
http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

http.onreadystatechange = function() {//Call a function when the state changes.
    if(http.readyState == 4 && http.status == 200) {
    }
}
http.send(params);
}