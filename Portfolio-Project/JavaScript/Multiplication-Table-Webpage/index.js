
// Select elements by their ID
let numberInput = document.getElementById('number-input');
let runButton = document.getElementById('run-button');
let output = document.getElementById('output');

// Function to generate and display the multiplication table
function printMultiply() {
    let number = Number(numberInput.value); // Get and convert input value to a number
    let outputHtml = ''; // Initialize variable to hold output HTML

    // Check if the input number is 0
    if (number === 0) {
        output.innerHTML = 'ไม่มีสูตรคูณแม่ 0';
        return;
    }

    // Loop to generate multiplication table
    for (let i = 1; i <= 12; i++) {
        outputHtml += '<p>';
        outputHtml += number + ' x ' + i + ' = ' + (number * i);
        outputHtml += '</p>';
    }

    // Display the generated table in the output div
    output.innerHTML = outputHtml;
}

// Add event listener to the button for the click event
runButton.addEventListener('click', printMultiply);
