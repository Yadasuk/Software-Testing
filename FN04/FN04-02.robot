*** Settings ***
Library     SeleniumLibrary
Test Teardown   close Browser

*** Variables ***
#${web_browser}    chrome
${web_browser}    firefox 
#${web_browser}    edge
${url}            http://127.0.0.1:8080/

#element
${btn_ok}         btnok
${txt_email}      email
${txt_pass}       password
${btn_search}     btnsearch
${btn_add}        btnAdd
${btn_edit}     xpath=//a[@href="/manageEnp_edit/1"]
${btn_delete}   xpath=//a[@href="/delEnp/1"]
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
    Click Button           ${btn}
กดปุ่มไอคอน
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Link             ${btn} 

***Test Cases***
TC-PSF-04-02-01 ตรวจสอบการกดปุ่มค้นหา
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_search}
TC-PSF-04-02-02 ตรวจสอบการกดปุ่มเพิ่มข้อมูล
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
TC-PSF-04-02-03 ตรวจสอบการกดปุ่มแก้ไข
    เปิดหน้าจอ           ${url} 
    กดปุ่มไอคอน         ${btn_edit}
TC-PSF-04-02-04 ตรวจสอบการกดปุ่มลบ
    เปิดหน้าจอ           ${url} 
    กดปุ่มไอคอน         ${btn_delete}
    