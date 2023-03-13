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
${stuID}          studentIDEnp
${nameStu}        nameStuEnp
${manageEnp}    xpath=//a[@href="/manageStudentEnp"]  
${save}             ok
${cancel}           cancel

${login_name}     pichet
${login_pass}     123456
${name}           ทดสอบ ระบบ


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
    Click Button          ${btn}
กดปุ่มไอคอน
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Link           ${btn}
กรอกข้อมูล
    [Arguments]             ${txt}              ${input}
    [Documentation]         ใช้กรอกข้อมูล
    Input Text              ${txt}              ${input} 

***Test Cases***
TC-PSF-04-08-01 ตรวจสอบการกดปุ่มบันทึก
    เปิดหน้าจอ          ${url} 
    กดปุ่มไอคอน         ${btn_edit}
    กรอกข้อมูล          ${nameStu}       ${name}
    กดปุ่ม              ${save}
TC-PSF-04-08-02 ตรวจสอบการกดปุ่มยกเลิก
    เปิดหน้าจอ           ${url} 
    กดปุ่มไอคอน         ${btn_edit}
    กดปุ่ม              ${cancel}
