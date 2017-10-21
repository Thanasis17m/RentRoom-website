
function cancelEditInfo() {

	var input_boxes = document.getElementsByClassName("edit_box");
	for(i=0; i<input_boxes.length; i++){
		input_boxes[i].style.display = "none";//we make all the input boxes hidden
	}

	var field_values = document.getElementsByClassName("field_value");
	var i;
	for(i=0; i<field_values.length; i++){
		field_values[i].style.display = "inline-block";//we make the field values visible 
	}

	var save_button = document.getElementById("save_cancel_button_div");//the save and cancel buttons disappear
	save_button.style.display = "none";

	var edit_button = document.getElementById("edit_button_div");
	edit_button.style.display = "block"; //we hide the edit button

}