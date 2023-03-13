*** Settings ***
Library     SeleniumLibrary
Test Teardown   close Browser

*** Variables ***
${web_browser}    chrome
#${web_browser}    firefox
#${web_browser}    edge
${url}            http://127.0.0.1:8080/
${manageUser}     xpath=//a[@href="/manageUser"]
${txt_email}      email
${txt_pass}       password 
${btn_ok}         btnok
${btn_edit}       xpath=//a[@href="/manageUser_edit/1"]
${btn_save}       ok
${btn_cancel}     cancel
${txt_pass}       password
${txt_name}       nameuser

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
เปิดหน้าจอแก้ไข
    [Documentation]         ใช้เปิดหน้าจอแก้ไขข้อมูล
    Click Link              ${btn_edit}

*** Test Cases ***
TC-PSF-02-09-01 ตรวจสอบการแสดงผลข้อมูลชื่อผู้ใช้ที่เลือกจากตาราง
    เปิดหน้าจอ                ${url}  
    เปิดหน้าจอแก้ไข
TC-PSF-02-09-02 ตรวจสอบการแสดงผลข้อมูลรหัสผ่านที่เลือกจากตาราง
    เปิดหน้าจอ                ${url}  
    เปิดหน้าจอแก้ไข
TC-PSF-02-09-03 ตรวจสอบการแสดงผลข้อมูลชื่อ-นามสกุลที่เลือกจากตาราง
    เปิดหน้าจอ                ${url}  
    เปิดหน้าจอแก้ไข

