
## Project File [_Click Notion Link_](https://www.notion.so/suphakit-panthu/JavaScript-e54d5a6b6298486daf6fb2a73eabbaf2?pvs=4#805ec3f5bd984dbd8f38baa2a38770f1)

# Multiplication-Table-Webpage

This project come from practice made by Zinglecode.

youtube https://www.youtube.com/@Zinglecode/

Thanks for the knowledge and practice.

# Overview
- This project creates a webpage that generates and displays the multiplication table for a given number. The user can input a number and click a button to see the results. The webpage uses HTML for structure, UKit for styling, and JavaScript for functionality.

# Project Structure
## The project consists of two main files:
1. index.html - The HTML file that structures the content and includes the UIkit framework for styling.
2. index.js - The JavaScript file that adds the functionality for generating and displaying the multiplication table.

# index.html
## HTML Structure
- DOCTYPE Declaration: Defines the document type and version of HTML.
- Head Section: Contains meta information, links to the UIkit CSS, and includes UIkit JavaScript.
- Body Section: Contains the main content, including input fields, buttons, and output div.

# Code Explanation
```
<!DOCTYPE html>
<html>
<head>
    <title>Index</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.3.0/dist/css/uikit.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.3.0/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.3.0/dist/js/uikit-icons.min.js"></script>
</head>
<body>
    <div class="uk-padding"></div>
        <h4 class="uk-text-lead">สูตรคูณแม่</h4>
        <p>
            <input id="number-input" class="uk-input uk-form-large" type="number"/>
        </p>
        <p>
            <button id="run-button" class="uk-button uk-button-primary uk-width-1-1">ได้แก่</button>
        </p>

        <div id="output" class="uk-card uk-card-secondary uk-card-body uk-text-large"></div>
    </div>
    <script src='index.js'></script>
</body>
</html>
```

- Meta Tags: Ensures proper character encoding and responsive design.
- UIkit Integration: Links to the UIkit CSS and JavaScript files for styling and UI components.
- Input Field: Allows the user to input a number.
- Button: Triggers the multiplication table generation.
- Output Div: Displays the generated multiplication table.
- Script Tag: References the external JavaScript file (index.js).

# index.js
## JavaScript Functionality
- This file contains the JavaScript code that dynamically generates and displays the multiplication table based on the user's input.
```
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
```

### Variable Selection:
- numberInput: Tracks the input field where the user enters a number.
- runButton: Tracks the button that triggers the multiplication table generation.
- output: Tracks the div where the generated table will be displayed.

### printMultiply Function:
- Retrieves and converts the input value to a number.
- Initializes a variable to hold the HTML for the output.
- Checks if the input number is 0 and displays an appropriate message if true.
- Loops from 1 to 12 to generate the multiplication table and appends each result to the outputHtml variable.
- Displays the generated table by updating the innerHTML of the output div.

### Event Listener:
- Adds a click event listener to the button, which triggers the printMultiply function when the button is clicked.

# Conclusion
- This project demonstrates how to create a webpage that generates and displays a multiplication table based on user input. The HTML provides the structure, UIkit handles the styling, and JavaScript adds the interactivity. By following this guide, you can understand and modify the code to suit your own needs.
