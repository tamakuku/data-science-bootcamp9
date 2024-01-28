## Sprint 103 ********************
## การลง Library และ เปิดใช้งาน
## เริ่มจากลง Library
install.packages(c("readr", 
                   "readxl", 
                   "googlesheets4",
                   "jsonlite",
                   "dplyr",
                   "sqldf",
                   "RSQLite"))
##จากนั้นกดเปิดใช้งาน ทุกครั้งที่เปิดโปรแกรมขึ้นมาใหม่**
library(readr)
library(readxl)
library(googlesheets4)
library(jsonlite)
library(dplyr)
library(sqldf)
library(RSQLite)

## 1. อ่านไฟล์ text ด้วย Function read_table()
## ให้ลองสร้างไฟล์ text แล้วใส่ column id กับ name แล้วใช้ เว้นวรรค
## จากนั้นกด save ไฟล์เป็น .text
## กดเรียกใช้งาน Function library(readr) ก่อน
library(readr)
## แล้วใช้ Function read_table เพื่อลองอ่านไฟล์ student ดู
read_table("student")
## จากนั้นสร้างชื่อ Data Frame นี้ขึ้นมา และลองกดเรียกดู
student <- read_table("student") 
View(student)

## 2. อ่านไฟล์ csv ด้วย Function read_csv
## เริ่มจากสร้างไฟล์ csv โดยพิมพ์ข้อมูลใช้ , แทนการเว้นวรรค
## จากนั้นกด save ไฟล์เป็น .csv 
## กดเรียกใช้งาน Function library(readr)
## แล้วทดสอบอ่านด้วย read_csv()
read_csv("student.csv")
## แล้วใส่ชื่อให้ Data Frame นี้เช่นเคย
student_02 <- read_csv("student.csv")
View(student_02)

## 3. ลองอ่านไล์ Excel ด้วย Function read_excel()
## เปิดไฟล์ Excel ที่ต้องการ จากนั้นกดเรียกใช้งาน Function library(readxl)
library(readxl)
## ลองกดอ่านไฟล์ด้วย read_excel()
## สมมติไฟล์ มีหลาย Sheet สามารถใส่ตัวเลข sheet ที่จะอ่านได้
read_excel("students.xlsx", sheet = 1)
## หรือใส่เป็นชื่อ Sheet ก็ได้
read_excel("students.xlsx", sheet = "Economics")
## จากนั้นก็ใส่ชื่อ Table เหมือนเดิม
econ_student <- read_excel("students.xlsx", sheet = "Economics")

## ลองใช้ for กับ list เพื่อ Loop อ่านไฟล์ Excel หลายๆ sheet พร้อมกัน
## สร้าง List แล้วตั้งชื่อเป็นตัวแปรที่ต้องการ ตัวอย่างใช้ชื่อ all_student
all_student <- list()
## ใช้ for (i in 1:จำนวน sheet สุดท้าย){} และใช้ [[i]] แทนค่า Column ทั้งหมด
for (i in 1:3) {
  all_student[[i]] <- read_excel("students.xlsx", sheet = i)
}
## จากนั้นลอง print ตัวแปร all_student จะขึ้นข้อมูลทุก Sheet ในหน้า Console
all_student
## หรือจะอ่านเฉพาะ Sheet ที่ต้องการให้ใส่ [[]] แล้วตามด้วยตัวเลขของ Sheet นั้นๆ
all_student[[2]]

## 4. ลองอ่านไฟล์ Google Sheet ด้วย read_sheet()
## เริ่มจากสร้าง Google Sheet ขึ้นมา แล้ว Copy Link มาประกาศเป็นตัวแปร
url <- "https://docs.google.com/spreadsheets/d/1iti3dPW35M0PcVsiITihWuhRuY-Vy7yPMuLtem89omo/edit?usp=sharing"

## กดเรียกใช้งาน library(googlesheets4)
library(googlesheets4)
## ก่อนกดใช้ read_sheet() เพื่ออ่านให้ใช้ gs4_deauth() เพื่อไม่ต้อง login google ก่อนก็สามารถดูไฟล์ได้
gs4_deauth()
read_sheet(url, sheet = "student") ## สามารถใส่ชื่อ sheet ที่จะอ่านได้เหมือนกัน ในกรณีมีหลาย sheet
## จากนั้นก็ใส่ชื่อตัวแปร เป็น Data frame ได้ปกติ
df_ggsheet <- read_sheet(url, sheet = "student")
View(df_ggsheet)

## 5. อ่านไฟล์ JSON ด้วย fromJSON()
## เริ่มจากสร้างไฟล์ text แล้วใส่ข้อมูลตาม format ที่กำหนดดังนี้
## {"ใส่ชื่อ Column 1" : [ใส่ข้อมูล, ใส่ข้อมูล, ...],
## "ใส่ชื่อ Column 2" : [ใส่ข้อมูล, ใส่ข้อมูล, ...]}
## แล้วกด save ไฟล์ด้วย .JSON
## เรียกใช้งาน Function library(jsonlite)
library(jsonlite)
## จากนั้นใช้ fromJSON() เพื่ออ่านไฟล์
fromJSON("student_music.JSON")
## จะได้ข้อมูลมาเป็น List จากนั้นเปลี่ยนเป็น Dataframe แล้วใส่ชื่อประกาศเป็นตัวแปรได้ปกติ
df_student_music <- data.frame(fromJSON("student_music.JSON"))
df_student_music
View(df_student_music)

## การใช้ bind_rows เพื่อรวมไฟล์ จากหลายๆ Sheet มาต่อลงด้านล่างพร้อมกัน
## เหมือนการใช้  UNION ALL ใน SQL โดยข้อมูลในแต่ละ Column Data Type ต้องเหมือนกัน
## เริ่มจากเรียกใช้ Function library(readx1) แล้ว Review ไฟล์ที่ใช้
library(readxl)
## ใช้ read_excel() เรียกดู Sheet ทั้ง 3 พร้อมทั้งประกาศตัวแปรเป็น Data Frame
econ <- read_excel("students.xlsx", sheet = 1)
business <- read_excel("students.xlsx", sheet = 2)
data <- read_excel("students.xlsx", sheet = 3)
## จากนั้นเรียกใช้ library(dplr) ไว้สำหรับใช้ Function bind_rows โดยใส่ชื่อแต่ละ Dataframe ลงไป
library(dplyr)
bind_rows(econ, business, data)
## แล้วประกาศเป็นตัวแปรใหม่ ได้ตามปกติ
bind_student <- bind_rows(econ, business, data)
View(bind_student)

## การใช้ bind_cols เพื่อรวมข้อมูลแต่ละ sheet ตามแนวนอน หรือ row
## สร้าง Data frame ขึ้นมา 2 ชุด
df1 <- data.frame(
  id = 1:5,
  name = c("tama", "auau", "jugjug", "jingjing", "tong")
)

df2 <- data.frame(
  city = c(rep("BKK", 3), rep("Tokyo", 2)),
  country = c(rep("TH", 3), rep("JP", 2))
)
View(df1)
View(df2)
## จากนั้นกดเรียกใช้งาน library(dplyr) สำหรับใช้ Function bind_cols
library(dplyr)
df3 <- bind_cols(df1, df2)
View(df3)
## *สำคัญ bind_cols ไม่ใช่การใช้ left_join เพราะไม่ได้มี column ที่ใช้เป็น PK = FK
## เช่นลองใช้ bind_cols แต่สำหรับตำแหน่ง data frame ที่ใส่เข้าไป จะผลลัพธ์ สลับกัน
bind_cols(df2, df1)

## การใช้ sqldf สำหรับเขียนสุตร SQL ใน R
## upload file school.csv ลงใน files
## กดเรียก library(readr) เพื่อลองอ่านไฟล์ csv
library(readr)
read.csv("school.csv")
## จากนั้นแทนค่า ไฟล์ ที่ใช้งานให้เป็น Data Frame
school <- read.csv("school.csv")
## กดเรียก library(sqldf) ไว้สำหรับใช้ Function sqldf()
library(sqldf)
## แล้วลองกดเรียกดูข้อมูล โดยใช้ syntax เหมือกันกับ SQL
sqldf("select * from school;")
## ลองหา ค่าเฉลี่ย ใน column student
sqldf("select 
      avg(student)
      from school")
## หรือดึงข้อมูลมาเฉพาะ Column ที่ต้องการ
sqldf("select
          school_id,
          school_name,
          country
      from school")
## หรือ Fliter เฉพาะ country ที่เป็น USA
sqldf("select
          *
      from school
      where country = 'USA'")
## และสามารถแทนค่าเป็น Data Frame ได้เช่นเคย
USA_student <- sqldf("select
          *
      from school
      where country = 'USA'")
View(USA_student)


## การอ่านไฟล์ Data Base จาก SQL
## เริ่มจาก upload ไฟล์ chinook.db
## กดเรียกใช้ library(RSQLite) สำหรับใช้งาน Function ต่างๆ
library(RSQLite)
## โดย Step ในการเรียกดูข้อมูลจากไฟล์ .db มี 3 step
## 1. open connection เพื่อเชื่อมต่อกับไฟล์ .db
## โดยใช้ Function dbConnect(SQLite(, "ใส่ชื่อไฟล์ .db"))
dbConnect(SQLite(), "chinook.db")
## แล้วประกาศเป็นตัวแปร ตามปกติ
Conn <- dbConnect(SQLite(), "chinook.db")

## 2. get data หรือการใช้งาน Function ต่างๆเพื่อเรียกดูข้อมูลในไฟล์ .db
## ลองกดดูข้อมูลว่ามี Table อะไรบ้าง
dbListTables(Conn)
## ลองกดดูว่าใน Table ที่เลือก มี Column อะไรบ้าง
dbListFields(Conn, "customers")
## จากนั้น ดึงข้อมูล โดยใช้สูตร adGetQuery(ใส่ชื่อตัวแปรที่เชื่อมไว้, "ใส่ syntax SQL"))
## สมมติลองดึงข้อมูลลูกค้า ที่ country อยู่ใน USA
## แล้วประกาศเป็นตัวแปร เก็บเป็น Data Frame ไว้ใช้งานใน R ได้
customer_USA <- dbGetQuery(Conn, "select *
                  from customers
                  where country = 'USA'")
View(customer_USA)

## 3. close connection ปิดการเชื่อม แล้วจะไม่สามารถ Run Function ใน step ที่ 2 ได้เลย
dbDisconnect(Conn)

## การ save ไฟล์ ข้อมูลที่อยู่ใน หน้าต่าง environment ไว้ใช้งาน มี 2 วิธี
## 1. save ข้อมูลที่มีทั้งหมด โดยใช้ save.image(file = "ใส่ชื่อไฟล์.rds")
save.image(file = "save_all_environment.rds")
## จากนั้นกดเปิดไฟล์ ที่ save ไว้โดยใช้ load(file = "ใส่ชื่อไฟล์.rds")
load(file = "save_all_environment.rds")
## 2. save เฉพาะข้อมูลที่ต้องการในโดยใช้ saveRDS(ใส่ชื่อตัวแปรที่สร้างไว้, file = "ใส่ชื่อไฟล์.rds")
saveRDS(customer_USA, file = "customer_USA.rds")
## จากนั้นกดเปิดไฟล์ที่ save ไว้ได้โดยใช้ readRDS("ใส่ชื่อไฟล์.rds")
readRDS("customer_USA.rds")
## แล้วต้อง สร้างเป็นตัวแปร เก็บไว้ใน environment อีกครั้ง
customer_USA <- readRDS("customer_USA.rds")
