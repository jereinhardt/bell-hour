const departmentSaveError = () => {
  const saveDepartmentButton = document.getElementById('department-save');
  const nameInput = document.getElementById('department_name');

  saveDepartmentButton.addEventListener('click', (event) => {
    if (nameInput.value === "") {
      event.preventDefault();
      document.getElementById('error').innerText = "Name for department is required."
    }
  })
}

departmentSaveError();
