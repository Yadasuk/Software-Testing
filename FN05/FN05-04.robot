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
${btn_mail}      xpath=//a[@href="/followStudentCon/1"]
${followStudent}    xpath=//a[@href="/followStudent"]
${txt_mail}       stuConReg


${login_name}     pichet
${login_pass}     123456
${text}           นิสิตลงวิชาเรียนใหม่หรือยังครับ

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
กรอกข้อมูล
    [Arguments]             ${txt}              ${input}
    [Documentation]         ใช้กรอกข้อมูล
    Input Text              ${txt}              ${input} 

***Test Cases***
TC-PSF-05-04-01 ตรวจสอบการกรอกข้อมูลแผนการเรียน
    เปิดหน้าจอ        ${url} 
    กดปุ่มไอคอน       ${btn_mail}
    กรอกข้อมูล        ${txt_mail}       ${text}
TC-PSF-05-04-02 ตรวจสอบการกรอกข้อมูลแผนการเรียน หากไม่กรอกข้อมูล
    เปิดหน้าจอ        ${url} 
    กดปุ่มไอคอน       ${btn_mail}
    กรอกข้อมูล        ${txt_mail}       ${EMPTY}








    