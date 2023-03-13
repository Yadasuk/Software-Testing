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
${btn_edit}       xpath=//a[@href="/manageUser_edit/1"]
${btn_save}       ok
${btn_cancel}     cancel
${txt_pass}       password
${txt_name}       nameuser
${name}           ประยวยหัว

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
กรอกข้อมูล
    [Arguments]             ${txt}              ${input}
    [Documentation]         ใช้กรอกข้อมูล
    Input Text              ${txt}              ${input} 
กดปุ่ม
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Button           ${btn}

*** Test Cases ***
TC-PSF-02-08-01 ตรวจสอบการกดปุ่มบันทึก
    เปิดหน้าจอ                ${url}  
    เปิดหน้าจอแก้ไข
    กรอกข้อมูล                ${txt_name}     ${name}
    กดปุ่ม                    ${btn_save}
TC-PSF-02-08-02 ตรวจสอบการกดปุ่มยกเลิก
    เปิดหน้าจอ                ${url}    
    เปิดหน้าจอแก้ไข
    กดปุ่ม                    ${btn_cancel}

