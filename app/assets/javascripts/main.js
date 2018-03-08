var deleteButton = document.getElementById("DeleteButton");

deleteButton.addEventListener("click", function(){
	document.getElementById('ConfirmDelete').style.display = "inline-block";
	deleteButton.style.display="none";
})