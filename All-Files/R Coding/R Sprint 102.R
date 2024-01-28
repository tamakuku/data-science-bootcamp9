## Sprint 102 ****************************

## การใช้ Control Flow หลักๆมี 3 ตัว
## 1. การใช้ if เหมือนการใช้ IF ใน Google Sheet
## ลองประกาศตัวแปร แล้วใช้ if กับ else สร้างเงื่อนไข เพื่อ print text ที่ต้องการ
score <- 80

if (score >= 90) {
  print("Passed")}
else {print("Failed")}

## หรือสร้างเงื่อนไขมากกว่า 2 ใช้ if else คั่นเพิ่ม
if (score >= 90)
{print ("Passed")}
else if (score >= 50)
{print ("OK")}
else {print ("Enroll again")}

## หรือสามารถเขียนสูตรให้สั้นลงใช้ ifelse( )
score <- 80

ifelse(score >= 90, "Passed", "Failed")

## และเขียนแบบมากกว่า 2 เงื่อนไขได้เช่นกัน
ifelse(score >= 90, "Passed", ifelse(
  score >= 50, "OK", "Enroll againg"))

## 2. การใช้ for loop
## สร้างตัวแปรกลุ่ม แล้วใช้ for(...in...)
friends <- c("tama", "auau", "jugjug")
for (friend in friends) {print (friend)}
## และสามารถใช paste เพื่อใส่ text เพิ่มเข้าไปในตัวแปรที่ใช้ for เรียก
for (friend in friends) {print ( paste("Hi", friend) )}

## แต่ปกติจะไม่เขียนสูตรยาวๆแบบด้านบน จะเขียนสั้นๆแบบนี้ หรือ vectorization
paste("Hi", friends)
## ลองใช้กับตัวเลข ได้เช่นกัน โดยสร้างกลุ่มตัวเลข แล้วลบด้วย 2 ทั้งหมด
(nums <- c(5, 10, 15, 25))

for (num in nums) {
  print(num - 2)  
}

## ลองเขียนแบบสั้นๆ โดยบวกคืนด้วย 2 ทั้งหมด
## ทริคเล็กน้อย เราใช้ () ครอบสูตร เพื่อ print ผลลัพธ์ ของสูตรที่เขียนขึ้นมาได้พร้อมกันเลย
(nums <- nums + 2)

## 3. การใช้ while เพื่อ run process ที่ set ไว้ไปเรื่อยๆ จนกว่าหยุดตามเงื่อนไขที่สร้างไว้
## ลองสร้าง while loop แบบ infinite คือไม่มีเงื่อนไขมาทำให้ หยุด loop
while(TRUE) {
  print("Yolo")
}

## หรือใส่เงื่อนไขอื่นๆแทนค่า TRUE เช่น while(1 > 0)
while (1 > 0) {
  print("Yeah")
}

## แล้วใช้ while loop โดยใส่เงื่อนไขที่จะให้เป็น TRUE ว่า count น้อยกว่า 5
## แล้วให้ print คำว่า Yo พอกดรันมัน loop ไปเรื่อยๆไม่มีที่สิ้นสุด
while (count < 5) {
  print("Yo")
}

## ให้ประกาศตัวแปร count ซ้ำใน while loop ว่าเท่ากับ count + 1 หลังจากที่ print Yo 
## แล้วลองกด Run จะเห็นได้ว่าพอ loop จน count ถูกบวกด้วย 1 จน count มีค่ามากกว่า 5
## จึงทำให้เงื่อนไข count < 5 กลายเป็น FALSE เลยทำให้ while loop หยุดทำงาน
while (count < 5) {
  print("Yo")
  count <- count + 1
}

count <- 0
while(1 > 0) {
    print("Yeah!")
    count = count + 1
}

## การใช้งาน Function พื้นฐานใน R
## ลองสร้างตัวแปรกลุ่ม ตัวเลข แล้วหาค่าสถิติพื้นฐาน แต่ใช้ count ไม่ได้นะ
x <- c(5, 10, 20, 100)
sum(x)
mean(x)
min(x)
max(x)
sd(x)

## และสามารถสร้าง Function ขึ้นมาไว้ใช้เองได้
## ลองสร้าง Function ชื่อว่า greeting เพื่อ print คำว่า Hello World
greeting <- function() {
  print("Hello World")
}
greeting()
## แล้วลองกด ctr+enter จะเห็นได้ว่า Function ถูกสร้างเข้าไปในหน้าต่าง Environment
## จากนั้นลองพิมพ์ greeting ในหน้า Console ก็จะเป็นการเรียกใช้ Function ดังกล่าว
## มันจึง print Hello World ขึ้นมา

## ลองสร้าง function ที่สอง โดยใช้ paste เพื่อสร้าง function ชื่อว่า greeting_name
## ไว้แปะคำว่า Hello หน้าตัวแปรใดๆก็ตาม ที่เราสร้างขึ้นมา
greeting_name <- function(name) {
  print( paste("Hello", name) )
}
greeting_name("tama")
## อีกทั้งเราสามารถ สร้างตัวแปร ที่เป็นตัว Function 2 ตัวรวมกันได้ด้วย
func <- function() {
  greeting()
  greeting_name("tama")
}
func()

## เราสามารถ แทนค่าเป็น Default ใน Function ที่สร้างขึ้นได้
## เช่นอยากใช้ ค่าในตัวแปร name ให้เป็น tama
greeting_name <- function(name = "tama") {
  print( paste("Hello", name) )
}
greeting_name()
## และสามารถใช้ได้มากกว่า 1 ตัวแปรใน Function ที่สร้างไว้
## เช่นต้องการเพิ่มตัวแปร age เพื่อใส่อายุ
greeting_name <- function(name = "tama", age = 18) {
  print( paste("Hello", name) )
  print( paste( "Age:", age))
}
greeting_name()

## และเราสามารถแทนค่าตัวแปรใน Function เป็นค่าอื่นๆได้ทันที
greeting_name(name = "auau", age = 17)

## มาลองสร้าง Function อื่นๆเพิ่มเติม
## โดยใช้ return เพื่อสร้าง Function สำหรับบวก 2 ตัวแปรที่เป็น ตัวเลข
plus_numbers <- function(number1, number2) {
  return(number1 + number2)
}
## แล้วลอง ใช้ function plus_numbers เพื่อทดสอบ
plus_numbers(5, 10)

## ต่อมาสร้าง Function เพื่อนำตัวแปร ตัวเลข มายกกำลังด้วย 3 ตั้งเป็น Default
cube <- function(number1, number2 = 3) {
  return(number1 ** number2) ## ใช้ ** แทนการยกกำลัง
}
## ลองใช้ Function cube เพื่อทดสอบ
cube(2) ## เท่ากับ 2 ยกกำลัง 3(ค่า Default)
## หรือสามารถเปลี่ยนค่า จำนวนตัวเลขจาก 3 เป็นตัวอื่น เพื่อยกกำลังได้
cube(2, 4) ## เท่ากับ 2 ยกกำลัง 4

## ลองสร้าง Function เพื่อนับสีของลูกบอล
## สร้างตัวแปร ลูกบอล 3 สี 8 ลูก
balls <- c("red", "blue", "green", "red",
           "red", "blue", "green", "green")
## แล้วสร้าง Function count_ball ขึ้นมา
count_ball <- function(ball, color) {
  sum(balls == color)
}
## แล้วลองทดสอบ Function เพื่อนับบอลที่มีสีแดงทั้งหมด
count_ball(balls, "red")

## ลองใช้การ Loop กับ Data Frame
## ลองเรียก data set ที่มีใน R มาลองใช้งานก่อน
data()
## จากนั้นเลือก Data set มาสักอัน ตัวอย่างเลือก USArrests
View(USArrests)
## จากนั้นลองหาค่า mean ของแต่ละ Column
mean(USArrests$Murder)
mean(USArrests$Assault)
mean(USArrests$UrbanPop)
mean(USArrests$Rape)
## จะเห็นได้ว่า ต้องเขียนสูตรซ้ำๆ หลายครั้ง หากมีสัก 100 Column คงไม่ไหว
## ใช้ for + i in 1:ncol และ names และ mean ในการสร้าง print ค่าชื่อ Column และ print ค่าเฉลี่ยของแต่ละ Column
for (i in 1:ncol(USArrests)) {
  print(names (USArrests[i]) )
  print(mean (USArrests[[i]]) )
}

## และสามารถนำมาสร้างเป็น Function ชื่อ cal_mean_column เพื่อไปใช้ค่าหาเฉลี่ยของ Data Set อื่นๆได้อีกด้วย
cal_mean_column <- function(df) {
  for (i in 1:ncol(df)) {
    print(names (df[i]) )
    print(mean (df[[i]]) )
  }
}

## ลองเรียก Data Set ชื่อว่า mtcars ขึ้นมา แล้วใช้ cal_mean_column ทดสอบ Function ดู
View(mtcars)
cal_mean_column(mtcars)
## ก็จะ print ชื่อ และ ค่า mean ของทุก Column ออกมาเช่นกัน แม้จำนวน Column จะมีไม่เท่ากัน

## จริงๆ เราสามารถใช้สูตร apply ของ R ได้โดยที่ไม่ต้องเขียน Function ขึ้นมาเองยาวๆ
apply(mtcars, MARGIN = 2, mean)
## MARGIN ใส่ 1 เท่ากับเรียงตาม Row, ใส่ 2 เรียงตาม column

## และใช้ หาค่าสถิติอื่นๆได้เช่นกัน
apply(mtcars, MARGIN = 2, sum)
apply(mtcars, MARGIN = 2, sd)