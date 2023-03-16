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
${txt_search}     searchuser
${btn_search}     btnsearch
${btn_mail}      xpath=//a[@href="/followStudentCon/1"]
${followStudent}    xpath=//a[@href="/followStudent"]

${login_name}     pichet
${login_pass}     123456

*** Keywords ***
เปิดหน้าจอ
    [Arguments]            ${url}          
    [Documentation]        เข้าสู่ระบบและเปิดหน้าจอติดตามนิสิตรอการพินิจ
    Open Browser           ${url}             ${web_browser}
    Input Text             ${txt_email}       ${login_name}
    Input Text             ${txt_pass}       ${login_pass}
    Click Button           ${btn_ok} 
    Click Link             ${followStudent}
กดปุ่ม
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Button           ${btn} 
กดปุ่มไอคอน
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Link          ${btn} 

***Test Cases***
TC-PSF-05-02-01 ตรวจสอบการกดปุ่มค้นหา
    เปิดหน้าจอ            ${url} 
    กดปุ่ม                ${btn_search}
TC-PSF-05-02-02 ตรวจสอบการกดปุ่มติดตาม
    เปิดหน้าจอ           ${url} 
    กดปุ่มไอคอน         ${btn_mail}



    