

function editUserInfo() { //this function helps the user edit his personal info
						//it replaces the displayed values with input text boxes
	var field_values = document.getElementsByClassName("field_value");

	var i;
	for(i=1; i<field_values.length; i++){
		field_values[i].style.display = "none";//we hide the field values that are already displayed 
	}

	var input_boxes = document.getElementsByClassName("edit_box");
	for(i=0; i<input_boxes.length; i++){
		input_boxes[i].style.display = "inline-block";//we make all the input boxes visible
		input_boxes[i].value = field_values[i+1].innerHTML;//the default value of the input is the former field value
	}

	var edit_button = document.getElementById("edit_button_div");
	edit_button.style.display = "none"; //we hide the edit button

	var save_button = document.getElementById("save_cancel_button_div");//the save and cancel buttons appear
	save_button.style.display = "inline-block";
}