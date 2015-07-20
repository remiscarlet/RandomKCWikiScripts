Array.prototype.clean = function(deleteValue) {
  for (var i = 0; i < this.length; i++) {
    if (this[i] == deleteValue) {         
      this.splice(i, 1);
      i--;
    }
  }
  return this;
}


function select_input_type(){
	var formats = document.getElementsByName("file_format");
	for (var i = 0; i<formats.length; i++){
		if(formats[i].checked){
			var format = formats[i].value;
		}
	}
	switch(format){
		case "formatted csv":
			document.getElementById("file_form").accept = ".csv";
			break;
		case "eprime csv":
			document.getElementById("file_form").accept = ".csv";
			break;
		case "eprime xlsx":
			document.getElementById("file_form").accept = ".xlsx";
			break;
	}
}

function strip(html)
{
   var tmp = document.createElement("DIV");
   tmp.innerHTML = html;
   console.log(tmp.textContent);
   return tmp.textContent||tmp.innerText;
}

function exportCallback(){
	var DSNames = [];
	var html = document.getElementById("dataSetList").innerText;
	var exploded = html.split("\n").clean("");
	console.log(exploded);
}
