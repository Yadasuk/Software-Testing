*** Settings ***
Library     SeleniumLibrary
Test Teardown   close Browser

*** Variables ***
${web_browser}    chrome
#${web_browser}    firefox 
#${web_browser}    edge
${url}            http://127.0.0.1:8080/

#element
${btn_ok}         btnok
${txt_email}      email
${txt_pass}       password


${login_name}     pichet
${login_pass}     123456
${stu_name}       นาย ชรัญธร


*** Keywords ***
เปิดหน้าจอและเข้าสู่ระบบ
    [Arguments]            ${url}          
    [Documentation]        กดลิ้งค์เพื่อเปิด Browser
    Open Browser           ${url}             ${web_browser}
    Input Text             ${txt_email}       ${login_name}
    Input Text             ${txt_pass}       ${login_pass}
    Click Button           ${btn_ok} 
กรอกข้อมูล
    [Arguments]            ${txt}             
    [Documentation]        กรอกข้อมูล
    Input Text             ${txt}             
กดปุ่ม
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Button           ${btn} 

***Test Cases***
TC-PSF-03-01-01 ตรวจสอบการกรอกข้อมูลช่องค้นหาจากชื่อ
    เปิดหน้าจอและเข้าสู่ระบบ     ${url}          

