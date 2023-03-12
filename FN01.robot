*** Settings ***
Library     SeleniumLibrary
Test Teardown   close Browser

*** Variables ***
#${web_browser}    chrome
#${web_browser}    firefox 
${web_browser}    edge
${url}            http://127.0.0.1:8080/
${btn_ok}         btnok
${txt_email}      email
${txt_pass}       password


*** Keywords ***
เปิดหน้าจอ
    [Arguments]            ${url}          
    [Documentation]        กดลิ้งค์เพื่อเปิด Browser
    Open Browser           ${url}             ${web_browser}
กรอกข้อมูล
    [Arguments]            ${txt}             ${data_search}
    [Documentation]        กรอกข้อมูล
    Input Text             ${txt}             ${data_search}
กดปุ่ม
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Button           ${btn} 

***Test Cases***
# TC-PSF-01-01-01 ตรวจสอบการกรอกข้อมูล Username รับไม่เกินจำนวน 6 ตัวอักษรและไม่น้อยกว่า 6 ตัวอักษร
# 	เปิดหน้าจอ		${url}	
# 	กรอกข้อมูล		${txt_email}	        pichet
# 	กดปุ่ม          ${btn_ok}
# TC-PSF-01-01-02 ตรวจสอบการกรอกข้อมูล Username รับเกินจำนวน 6 ตัวอักษร
# 	เปิดหน้าจอ		${url}	
# 	กรอกข้อมูล		${txt_email}	        pichet01	
# 	กดปุ่ม                  ${btn_ok}
# TC-PSF-01-01-03 ตรวจสอบการกรอกข้อมูล Username รับน้อยกว่าจำนวน 6 ตัวอักษร
# 	เปิดหน้าจอ		${url}	
# 	กรอกข้อมูล		${txt_email}            piche
# 	กดปุ่ม                  ${btn_ok}
# TC-PSF-01-01-04 ตรวจสอบการกรอกข้อมูล Password รับไม่เกินจำนวน 6 ตัวอักษรและไม่น้อยกว่า 6 ตัวอักษร
#     เปิดหน้าจอ               ${url}    
#     กรอกข้อมูล               ${txt_pass}        123456
# TC-PSF-01-01-05 ตรวจสอบการกรอกข้อมูล Password รับเกินจำนวน 6 ตัวอักษร
#     เปิดหน้าจอ               ${url}    
#     กรอกข้อมูล               ${txt_pass}        1234567
# TC-PSF-01-01-06 ตรวจสอบการกรอกข้อมูล Password รับน้อยกว่าจำนวน 6 ตัวอักษร
#     เปิดหน้าจอ               ${url}    
#     กรอกข้อมูล               ${txt_pass}        12345
	
# TC-PSF-01-01-07 ตรวจสอบการกรอกข้อมูล Password รับข้อความที่กรอกไม่แสดงตัวอักษร
#         เปิดหน้าจอ                ${url}
#         กรอกข้อมูล                ${txt_pass}     123456
# TC-PSF-01-01-08 ตรวจสอบการเข้าสู่ระบบสำหรับผู้ใช้สถานะอาจารย์
#         เปิดหน้าจอ                ${url}
#         กรอกข้อมูล                ${txt_email}    pichet
#         กรอกข้อมูล                ${txt_pass}     123456
#         กดปุ่ม                    ${btn_ok}
# TC-PSF-01-01-09 ตรวจสอบการเข้าสู่ระบบสำหรับผู้ใช้สถานะเจ้าหน้าที่
#         เปิดหน้าจอ                ${url}
#         กรอกข้อมูล                ${txt_email}    somnuk
#         กรอกข้อมูล                ${txt_pass}     123456
#         กดปุ่ม                    ${btn_ok}
# TC-PSF-01-01-10 ตรวจสอบการเข้าสู่ระบบสำหรับผู้ใช้ที่ไม่มีสิทธิเข้าสู่ระบบ
#         เปิดหน้าจอ                ${url}
#         กรอกข้อมูล                ${txt_email}    suda
#         กรอกข้อมูล                ${txt_pass}     123456
#         กดปุ่ม                    ${btn_ok}
# TC-PSF-01-02-01 ตรวจสอบการกดปุ่มเข้าสู่ระบบ
#         เปิดหน้าจอ                ${url}
#         กรอกข้อมูล                ${txt_email}    somnuk
#         กรอกข้อมูล                ${txt_pass}     123456
#         กดปุ่ม                    ${btn_ok}
# TC-PSF-01-03-01 ตรวจสอบการแสดงผลชื่อผู้ใช้งาน
#         เปิดหน้าจอ                ${url}
#         กรอกข้อมูล                ${txt_email}    pichet
#         กรอกข้อมูล                ${txt_pass}     123456
#         กดปุ่ม                    ${btn_ok}
TC-PSF-01-03-02 ตรวจสอบการแสดงผลสถานะผู้ใช้งานสถานะอาจารย์
        เปิดหน้าจอ                ${url}
        กรอกข้อมูล                ${txt_email}    pichet
        กรอกข้อมูล                ${txt_pass}     123456

