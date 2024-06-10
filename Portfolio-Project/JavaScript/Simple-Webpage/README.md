
## Project File [_Click Notion Link_](https://www.notion.so/suphakit-panthu/JavaScript-e54d5a6b6298486daf6fb2a73eabbaf2?pvs=4#a998f9cb06f24bc4a343f4a2bc71385c)

# Simple-Webpage

This project come from practice made by Zinglecode.

youtube https://www.youtube.com/@Zinglecode/

Thanks for the knowledge and practice.

# Overview
- This project creates a simple HTML webpage that displays text, an image, and a button with an event handler using JavaScript. The HTML page is styled using CSS embedded within the HTML file. This README explains the code structure and functionality, providing a comprehensive understanding of the implementation.

# Project Structure
## The project consists of two main files:
1. index.html - The HTML file that structures the content and includes CSS for styling.
2. index.js - The JavaScript file that adds dynamic behavior to the webpage.

# index.html
## HTML Structure
- DOCTYPE Declaration: Defines the document type and version of HTML.
- Head Section: Contains meta information and internal CSS styles.
- Body Section: Contains the main content and references the JavaScript file.

# Code Explanation
```
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Index</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
            margin: 0;
        }
        .container {
            text-align: center;
        }
        .content {
            margin-bottom: 20px; /* Adds space below each content block */
            font-size: 30px; /* Increases text size */
        }
        .responsive-image {
            margin-top: 20px; /* Adds space above the image */
            margin-bottom: 20px; /* Adds space below the image */
            width: 800px;
            height: 450px;
        }
        .reference-link {
            font-size: 16px; /* Sets the font size for the link */
            margin-top: 10px; /* Adds space above the link */
            display: block; /* Makes the link display as a block element */
        }
        .spacer {
            height: 20px; /* Adds vertical space */
        }
        #press-button {
            margin-top: 20px; /* Adds space above the button */
            margin-bottom: 20px; /* Adds space below the button */
            font-size: 20px; /* Increases button text size */
            padding: 15px 30px; /* Increases button size */
        }
        #message {
            margin-top: 20px; /* Adds space above the message */
            font-size: 20px; /* Increases text size for the message */
        }
    </style>
</head>
<body>
    <div class="container">
        <div id="content-1" class="content">Content 1</div>
        <div id="content-2" class="content">Content 2</div>
        <div id="content-3" class="content">Content 3</div>

        <img src="https://pbs.twimg.com/media/E_isWKjVcAAvZxu?format=jpg&name=900x900" alt="Description of the image" class="responsive-image">
        <a href="https://x.com/avcthailand/status/1439089629177651206/photo/1" class="reference-link" target="_blank">View Source Image</a>

        <button id="press-button">กดรับวาร์ป ด่วน!!!</button>
        <p id="message"></p>
    </div>

    <script src="index.js"></script>
</body>
</html>
```

- Body Styling: Centers the content vertically and horizontally.
- Container Class: Centers text within the container.
- Content Class: Styles for content text.
- Responsive Image: Ensures the image has specific dimensions and margins.
- Reference Link: Styles for the hyperlink below the image.
- Button: Styles for the button, including size and margin.
- Message Paragraph: Styles for the message displayed after button click.

# index.js
## JavaScript Functionality
- This file contains JavaScript code that dynamically updates the HTML content and handles button click events.
```
// HTML controls

// Select and update content block 1
let content1 = document.getElementById('content-1');
let textHtml = '<b>ทามะ 789</b>';
textHtml += ' <i>ดอทคอม!</i>';
content1.innerHTML = textHtml;

// Select and update content block 2
let content2 = document.getElementById('content-2');
let textHtml2 = '<b>แฟนคลับเศร้าหนักมาก เมื่อ Yura กาโน๊ะ ประกาศอำลาวงการ!</b>';
content2.innerHTML = textHtml2;

// Select and update content block 3
let content3 = document.getElementById('content-3');
let textHtml3 = '<v>Oh~Noooo T_T</v>';
content3.innerHTML = textHtml3;

// HTML Events

// Select button and message elements
let pressButton = document.getElementById('press-button');
let message = document.getElementById('message');

// Define function to display a message when button is clicked
function showMessage() {
    message.innerHTML = 'หยอกๆ ไม่มีวาร์ปให้หลอกจ้าาา~';
}

// Add event listener to button for click event
pressButton.addEventListener('click', showMessage);
```

### HTML Controls:
- Selects elements by their ID.
- Updates the inner HTML of the selected elements with new text.

### HTML Events:
- Selects the button and message elements.
- Defines a function to display a message when the button is clicked.
- Adds an event listener to the button to trigger the function on click.

# Conclusion
- This project demonstrates how to create a simple webpage with HTML and JavaScript. The HTML provides the structure, CSS handles the styling, and JavaScript adds interactivity. By following this guide, you can understand and modify the code to suit your own needs.
