function readNotification()
{
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200)
    {
    	var count = document.getElementById('count');
    	while(count.firstChild)
    	{
    		count.removeChild(count.firstChild);
    	}
    }
  };
  xhttp.open("GET",'http://localhost:3000/notification', true);
  xhttp.send();
}