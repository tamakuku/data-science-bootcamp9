// HTML controls

// use document.getElementTrackId()
// Select and update content block 1
let content1 = document.getElementById('content-1');
let textHtml = '<b>ทามะ 789</b>';
// use += append new text
textHtml += ' <i>ดอทคอม!</i>';
// then use .innerHTML change this result
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

// Example event click button >>> return text
// Build button in .html file
// Select button and message elements
let pressButton = document.getElementById('press-button');
// And variable for got result from track element
let message = document.getElementById('message');

// Define function to display a message when button is clicked
function showMessage() {
    message.innerHTML = 'หยอกๆ ไม่มีวาร์ปให้หลอกจ้าาา~';
}
// And use addEventListener();
// input parameters for action event
pressButton.addEventListener('click', showMessage);
