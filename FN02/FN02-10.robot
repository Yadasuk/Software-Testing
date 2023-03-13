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
${btn_edit}       xpath=//a[@href="/manageUser_edit/1"]
${dropdownpos}    statusUser

${manageUser}     xpath=//a[@href="/manageUser"]

${login_name}     pichet
${login_pass}     123456

*** Keywords ***
เปิดหน้าจอ
    [Arguments]            ${url}          
    [Documentation]        เข้าสู่ระบบและเปิดหน้าจอนิสิตจบไม่ตรงแผน
    Open Browser           ${url}             ${web_browser}
    Input Text             ${txt_email}       ${login_name}
    Input Text             ${txt_pass}       ${login_pass}
    Click Button           ${btn_ok} 
    Click Link             ${manageUser}
กดปุ่ม
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click link           ${btn}
กรอกข้อมูล
    [Arguments]             ${txt}              ${input}
    [Documentation]         ใช้กรอกข้อมูล
    Input Text              ${txt}              ${input} 
เลือกจาก Dropdown ตำแหน่ง
    [Documentation]             แสดงข้อมูล
    Get List Items              ${dropdownpos}

***Test Cases***
TC-PSF-02-10-01ตรวจสอบการแสดงผลฟิลเตอร์ Dropdown ข้อมูลตำแหน่ง
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_edit}
    เลือกจาก Dropdown ตำแหน่ง 

