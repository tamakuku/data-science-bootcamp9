## Sprint 101 ***************************
getwd()

## การเพิ่มตัวแปร
income <- 50000
expense <- 30000

## การทดสอบตัวแปร
saving <- income - expense

## การลบตัวแปรโดยใช้ rm()
rm(saving)
saving

## หรือต้องการลบ ตัวแปรทั้งหมด ในครั้งเดียว กดปุ่ม icon ไม้กวาด ในหน้าตาง Environment

## ใช้เครื่องหมาย # ในการใส่คอมเม้น

## การใช้ Operator ในการทดสอบตัวในแปรในสมการ
1 + 1 == 2
2 * 2 <= 4
5 >= 10
5 - 2 != 3 ## != คือ ไม่เท่ากับ
10 < 2
10 > 2

## และสามารถใช้ทดสอบกับ Text ได้ด้วย
"Hello" == "Hello"
"Hello" == "hello" ## ใน R เป็น Case sensitive

## Data Type หลักๆใน R มี 5 อย่าง
## 1. numeric
age <- 32
print(age)
class(age) ## ใช้ Class() ในการเช็ค Data Type

## 2. character
my_name <- "tama"
my_home <- "Tipthana"

print(my_name)
print(my_home)
class(my_name); class(my_home) ## ใช้ ; ในการ Run Code 2 Code พร้อมกัน

## 3. logical ตัวแปรที่เป็นเงื่อนไข เวลาเช็คผลลัพธ์จะได้เป็นไม่ TRUE ก็ FALSE
result <- 1 + 1 == 2
print(result)
class(result)

## 4. factor ตัวแปรกลุ่ม ใช้ในสถิติ คล้าย Array
## เริ่มจากลองสร้างตัวแปรแบบมีหลายๆ ข้อมูลก่อน
animals <- c("Dog", "Cat", "Cat", "Turtle")
## ลองเช็ค Class จะเห็นว่า ยังเป็นแค่ Character อยู่
print(animals)
class(animals)

## ให้ใส่ factor() ครอบตัวแปรนั้นๆ แล้วกำหนดตัวแปรเพิ่มอีกชั้น
animals <- factor(animals)
print(animals)
class(animals)

## หรือรวบสูตรให้สั้นลง แล้วกำหนดตัวแปรทีเดียวดังนี้
animals <- factor(c("Dog", "Cat", "Cat", "Turtle"))
print(animals)
class(animals)

## ความแตกต่างระหว่าง character กับ factor แล้ว print ตัวแปร
## character จะมี " " ออกมาด้ว factor ไม่มี

my_name <- "tama"
my_home <- "Tipthana"

print(my_name)
print(my_home)
class(my_name); class(my_home)

animals <- factor(c("Dog", "Cat", "Cat", "Turtle"))
print(animals)
class(animals)

## 5. date/time
Sys.time() ## จะได้ วัน และ เวลา ปัจจุบัน
time_now <- Sys.time()
class(time_now)

## การเปลี่ยน Data Type จะมี 3 สูตรหลักๆดังนี้
## as.numeric() เปลี่ยนให้เป็น ตัวเลข
## as.character() เปลี่ยนให้เป็น Text
## ตัวอย่าง กำหนดตัวแปร x เท่ากับ 100 แล้ว เช็ค class จะเห็นว่าเป็นตัวเลข
x <- 100
class(x)
## ลองใช้ as.character() ครอบ x เพื่อเปลี่ยนให้เป็น Text
char_x <- as.character(x)
char_x
class(char_x)
## แล้วลองใช้ as.numeric() ครอบ char_x เปลี่ยนให้เป็น ตัวเลข
num_x <- as.numeric(char_x)
num_x
class(num_x)

## ลองเปลี่ยน Text เป็น ตัวเลข
y <- "arkuku"
char_y <- as.numeric(y)
char_y
class(char_y)

## as.logical() เปลี่ยนค่าระหว่าง TRUE / FALSE ให้เป็น 1 กับ 0
as.logical(0) ## เฉพาะ 0 จะได้เป็น FALSE
as.logical(1)
as.logical(3) ## แต่ใช้ตัวเลขอื่นๆ ที่ไม่ใช่ 0 จะได้เป็น TRUE เหมือนกันหมด

as.numeric(TRUE)
as.numeric(FALSE)

## โครงสร้าง Data ของ R หลักๆมี 4 องค์ประกอบดังนี้
## 1. Vector คือการเอาข้อมูลมาเรียงต่อกัน(เหมือน Array)
1:10
18:27
## ใช้ seg() ในการกำหนดตัวเลขตามเงื่อนไข seg(from = ใส่ตัวเลขเริ่มต้น, to = ใส่ตัวเลขตัวสุดท้าย, by = ใส่จำนวนห่างระหว่างแต่ละตัวเลข )
seq(from = 1, to = 100, by = 5)
## ใช้ c() ในการใส่ Text เป็น Vector
friend <- c("tama", "auau", "kuku", "jugjug")
print(friend)
ages <- c(30, 31, 25, 28)
print(ages)
is_male <- c(TRUE, FALSE, TRUE, FALSE)
print(is_male)
## ข้อจำกัดของ Vector คือจะใส่ข้อมูลในแต่ละ 1 Vector ได้แค่ 1 Data Type

## 2. Matrix เก็บข้อมูลในแต่ละ 1 Matrix แค่ 1 Data Type เหมือน Vector
## แต่ละเป็นข้อมูลที่มี 2 มิติ คือ มี Row และ Column
## ลองสร้าง Vector ขึ้นมา
x <- 1:25
print(x)
length(x) ## ใช้ length() ในการนับจำนวนข้อมูล ที่อยู่ใน vector นั้นๆ
## ใช้ dim() ในการเปลี่ยน Vector ให้เป็น Matrix พิมพ์ dim(ตัวแปรนั้นๆ) <- (จำนวน Column, จำนวน Row)
dim(x) <- c(5,5)
print(x)
## แต่สูตรข้างบนยาว จึงใช้สูตรนี้แทน พิมพ์ matrix(ใส่ตัวเลขแรกสุด : ตัวเลขท้ายสุด ncol = จำนวน Column)
matrix(1:25, ncol = 5)
matrix(1:6, ncol = 3)

## ใช้ nrow = ใส่จำนวน Row กำหนดจำนวน Row
matrix(1:6, nrow = 1)
## ใช้ byrow = TRUE เพื่อให้เรียงลำดับตัวเลขในแนว Row
matrix(1:6, ncol = 3, byrow = TRUE)
## element wise computation การนำตัวเลข เอาไป คำนวณค่ากับตัวแปร Matrix ที่เราสร้างไว้
## ยกตัวอย่าง สร้าง Matrix m1 แล้วนำ m1 คุณด้วย 10
m1 <- matrix(1:6, nrow = 3)
print(m1)
m1 * 10

## 3. List ## การเก็บข้อมูลที่สร้างเป็น Vector หรือ Matrix เอาไว้
## ลองสร้างตัวแปร ชุดข้อมูลมาก่อน
my_name <- "Tama"
my_pets <- c("BB", "DD", "PP")
m2 <- matrix(1:25, ncol = 5)
R_is_cool <- TRUE
## แล้วใช้ list() ครอบข้อมูลตัวแปรเหล่านั้น แล้วกำหนดเป็นตัวแปรใหม่ใน List นั้นๆอีกที
my_list <- list(item1 <- my_name,
                item2 <- my_pets,
                item3 <- m2,
                item4 <- R_is_cool)
print(my_list)

## 4. DataFrame คือหัวใจสำคัญกว่า 80% ในการทำงานด้วย R
## สร้างชุดข้อมูลมา 4 ชุด
friends <- c("Win", "Namcha", "Virai", "Non", "TK")
ages <- c(20, 30, 45, 15, 23)
location <- c("BKK", "Lumpang", "Chieangmai", "Satoon", "Roied")
music_lover <- c(TRUE, FALSE, TRUE, TRUE, FALSE)

## ใช้ data.frame() ครอบชุดข้อมูลทั้งหมด เพื่อสร้างเป็น Table
data.frame(friends, ages, location, music_lover)
## และสร้างชื่อให้กับ Table นั้นๆ ได้ด้วยการกำหนดตัวแปร ปกติ
tama_df <- data.frame(friends, ages, location, music_lover)
## ใช้ Function View() เพื่อดูหน้าตา Table ได้
View(tama_df)

##สามารถสร้าง Dataframe จาก List ได้
tama_list <- list(friend_name = friends,
                  ages = ages,
                  home = location,
                  love_music = music_lover)
## แล้วนำ data.frame() ครอบชื่อ List อีกที
data.frame(tama_list)
## จากนั้นแทนค่าตัวแปร ปกติ
tama_df02 <- data.frame(tama_list)
View(tama_df02)

## การใช้ help("พิมพ์ชื่อ Fucntion") เรียกตัวช่วยคือมือการใช้ Function นั้นๆ
help("seq")


## การใช้ Subset เพื่อเรียกดูข้อมูลใน Vector หรือ Matrix ได้ 3 วิธี
## 1. ใช้ [] ดึงข้อมูลโดยกำหนด ตำแหน่ง
friends [1]
friends  [1:3]
friends [3:6]
friends [c(3,2,5)] ## ใช้ c() สำหรับดึงข้อมูล แบบไม่เรียงลำดับ

## 2. ใช้ [>, >=, !=]  สร้างเงื่อนไขในการดึงข้อมูล
ages [ ages > 30]
ages [ ages <= 45]
ages [ ages != 23]

## 3. ใช้ [พิมพ์ ชื่อ ข้อมูลที่ต้องการดึง]
## อยากรู้อายุ โดยพิมพ์ ชื่อ friend แต่ละคน
## แต่ยังไม่มี ชื่อ เชื่อมกับ อายุ
## ใช้ Function names(ใส่ตัวแปรที่จะเชื่อม) <- ใส่ตัวแปรที่จะเชื่อม
names(ages) <- friends
## แล้วลองหา Subset โดยพิมพ์ชื่อหา
ages ["Win"]
ages [c("Namcha", "TK")]

## การใช้ Subset กับ Dataframe
## ใน [] ให้ใส่ตำแหน่ง Row กับ Column
## ลองใช้ตัวอย่างจาก Dataframe ที่สร้างไว้ก็คือ tama_df
## โดยเรียกหน้าต่าง Table ขึ้นมาก่อนแล้วลองพิมพ์ทดสอบใน หน้าต่าง Console เพื่อให้เห็นภาพชัดเจน
tama_df [1, 2] ## ดูข้อมูลจาก Row 1 และ Column 3
tama_df [1:3, 4] ## ดูข้อมูลจาก Row 1 ถึง 3 และ Column 4
tama_df [1:2, 2:3] ## ดูข้อมูลจาก Row 1 ถึง 2 และ Column 2 ถึง 3

## ลองดึงแบบพิมพ์ ชื่อ
tama_df [ , "friends"] ## หากไม่ใส่จำนวน Row จะเท่ากับดึงมาทุก Row
tama_df [ , c("friends", "location")]

## ดึงแบบใส่เงื่อนไขใช้ [$]
## ไม่ใส่จำนวน Column หลังเครื่องหมาย , เท่ากับดึงมาทุก Column
tama_df [ tama_df$music_lover == TRUE, ]
tama_df [ tama_df$ages > 30, 1:3]
