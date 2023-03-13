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
${btn_add}        btnAdd
${btn_save}       ok
${btn_cancel}     cancel
${txt_user}       username
${txt_pass}       password
${txt_name}       nameuser
${dropdownpos}    statusUser
${user}           test
${pass}           123
${name}           ทดสอบ
${pos}            เจ้าหน้าที่

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
กรอกข้อมูล
    [Arguments]             ${txt}              ${input}
    [Documentation]         ใช้กรอกข้อมูล
    Input Text              ${txt}              ${input} 
เลือกจาก Dropdown ตำแหน่ง
    [Arguments]                 ${list}
    [Documentation]             เลือกจากในลิสต์
    Select From List By Label   ${dropdownpos}           ${list}
กดปุ่ม
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Button           ${btn}
กดปุ่มไอคอน
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Link           ${btn}

*** Test Cases ***
TC-PSF-02-05-01 ตรวจสอบการกดปุ่มบันทึก
    เปิดหน้าจอ                ${url}  
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล        ${txt_pass}     ${pass}
    กรอกข้อมูล        ${txt_name}     ${name}
    เลือกจาก Dropdown ตำแหน่ง          ${pos}  
    กดปุ่ม                    ${btn_save}
TC-PSF-02-05-02 ตรวจสอบการกดปุ่มยกเลิก
    เปิดหน้าจอ                ${url}    
    เปิดหน้าจอเพิ่มข้อมูล
    กดปุ่ม                    ${btn_cancel}

