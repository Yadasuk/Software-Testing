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
${btn_edit}       xpath=//a[@href="/manageEnp_edit/1"]
${dropdownlevel}    stuLevelEnp
${dropdownstatus}   stuStatusEnp

${manageEnp}    xpath=//a[@href="/manageStudentEnp"]  

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
    Click Link             ${manageEnp}
กดปุ่ม
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click link           ${btn}
กรอกข้อมูล
    [Arguments]             ${txt}              ${input}
    [Documentation]         ใช้กรอกข้อมูล
    Input Text              ${txt}              ${input} 
เลือกจาก Dropdown ระดับ
    [Documentation]             แสดงข้อมูล
    Get List Items              ${dropdownlevel}
เลือกจาก Dropdown สถานภาพ
    [Documentation]             แสดงข้อมูล
    Get List Items              ${dropdownstatus}


***Test Cases***
TC-PSF-04-10-01 ตรวจสอบการแสดงผลฟิลเตอร์ Dropdown ข้อมูลระดับ
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_edit}
    เลือกจาก Dropdown ระดับ  
TC-PSF-04-10-02 ตรวจสอบการแสดงผลฟิลเตอร์ Dropdown ข้อมูลสถานภาพ
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_edit}
    เลือกจาก Dropdown สถานภาพ
