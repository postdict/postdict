window.answerCheck = (quizElementName, answerElementName, buttonElementName, answer) => {
    const enteredAnswer = document.getElementById(quizElementName).value;
    let button = document.getElementById(buttonElementName);
    if (enteredAnswer == answer) {
        document.getElementById(answerElementName).innerHTML = '<p><span class="answer-correct">正解！</span></p>'
    } else {
        document.getElementById(answerElementName).innerHTML = `<p><span class="answer-wrong">不正解……</span></p> <p>答え：${answer}</p>`
    }

    // Make the button insensitive because users answer only once
    button.disabled = true;
}

window.onKeyPressEvent = (event, quizElementName, answerElementName, buttonElementName, answer) => {
    const button = document.getElementById(buttonElementName);
    if (!button.disabled && event.key === 'Enter') {
        answerCheck(quizElementName, answerElementName, buttonElementName, answer);
    }
}
