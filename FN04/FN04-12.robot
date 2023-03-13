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
${btn_delete}    xpath=//a[@href="/delEnp/4"]  

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
กดปุ่มไอคอน
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Link             ${btn}

***Test Cases***
TC-PSF-04-12-01 ตรวจสอบการแสดงผลข้อมูลรหัสนิสิตที่เลือกจากตาราง
    เปิดหน้าจอ           ${url} 
    กดปุ่มไอคอน         ${btn_delete}

