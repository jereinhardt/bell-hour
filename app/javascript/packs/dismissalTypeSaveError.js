const dismissalTypeSaveError = () => {
  const saveDismissalTypeButton = document.getElementById('dismissal-save');
  const nameInput = document.getElementById('dismissal_type_name');

  saveDismissalTypeButton.addEventListener('click', (event) => {
    if (nameInput.value === "") {
      event.preventDefault();
      document.getElementById('error').innerText = "Name for dismissal type is required."
    }
  })
}

dismissalTypeSaveError();
