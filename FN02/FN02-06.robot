*** Settings ***
Library     SeleniumLibrary
Test Teardown   close Browser

*** Variables ***
#${web_browser}    chrome
#${web_browser}    firefox 
${web_browser}    edge
${url}            http://127.0.0.1:8080/

#element
${btn_ok}         btnok
${txt_email}      email
${txt_pass}       password
${btn_add}        btnAdd
${dropdownpos}    statusUser
${manageUser}     xpath=//a[@href="/manageUser"]

${login_name}     pichet
${login_pass}     123456

*** Keywords ***
เปิดหน้าจอ
    [Arguments]            ${url}          
    [Documentation]        เข้าสู่ระบบและเปิดหน้าจอนิสิตจัดการผู้ใช้งาน
    Open Browser           ${url}             ${web_browser}
    Input Text             ${txt_email}       ${login_name}
    Input Text             ${txt_pass}       ${login_pass}
    Click Button           ${btn_ok} 
    Click Link             ${manageUser}  
เปิดหน้าจอเพิ่มข้อมูล
    [Documentation]         ใช้เปิดหน้าจอเพิ่มข้อมูล
    Click Button           ${btn_add}
    Switch Window           locator=NEW
เลือกจาก Dropdown ตำแหน่ง
    [Documentation]             แสดงข้อมูล
    Get List Items              ${dropdownpos}

***Test Cases***
TC-PSF-02-06-01ตรวจสอบการแสดงผลฟิลเตอร์ Dropdown ข้อมูลตำแหน่ง
    เปิดหน้าจอ     ${url} 
    เปิดหน้าจอเพิ่มข้อมูล
    เลือกจาก Dropdown ตำแหน่ง  

