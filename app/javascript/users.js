window.toggleButtonSensitivity = (checkBoxName, buttonName) => {
    let checkBox = document.getElementsByName(checkBoxName)[0];
    let button = document.getElementsByName(buttonName)[0];
    button.disabled = !checkBox.checked;
}
