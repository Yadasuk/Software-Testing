*** Settings ***
Library     SeleniumLibrary
Test Teardown   close Browser

*** Variables ***
#${web_browser}    chrome
#${web_browser}    firefox
${web_browser}    edge
${url}            http://127.0.0.1:8080/
${manageUser}     xpath=//a[@href="/manageUser"]
${txt_email}      email
${txt_pass}       password 
${btn_ok}         btnok
${btn_cofirm}     ok
${btn_cancel}     cancel
${btn_delete}     xpath=//a[@href="/delUser/5"]

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
กดปุ่ม
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Button           ${btn}
กดปุ่มไอคอน
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Link             ${btn}

*** Test Cases ***
TC-PSF-02-12-01 ตรวจสอบการแสดงผลข้อมูลชื่อผู้ใช้ที่เลือกจากตาราง
    เปิดหน้าจอ                ${url}    
    กดปุ่มไอคอน              ${btn_delete}



