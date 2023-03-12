*** Settings ***
Library     SeleniumLibrary
Test Teardown   close Browser

*** Variables ***
${web_browser}    chrome
#${web_browser}    firefox 
#${web_browser}    edge
${url}            http://127.0.0.1:8080/
${txt_email}      email
${txt_pass}       password
${btn_ok}         btnok
${pos}            position
${position}       อาจารย์

*** Keywords ***
เปิดหน้าจอ
    [Arguments]            ${url}          
    [Documentation]        ใช้เปิดหน้าจอ
    Open Browser           ${url}             ${web_browser}          
กรอกข้อมูล
    [Arguments]            ${txt}             ${data_search}
    [Documentation]        กรอกข้อมูล
    Input Text             ${txt}             ${data_search}
กดปุ่ม          
    [Documentation]        กดปุ่ม
    Click Button           ${btn_ok} 
เช็คสถานะ
    [Arguments]                 ${position}
    [Documentation]             เช็คสถานะ
    Element Should Contain      ${pos}          ${position}

    
*** Test Cases ***
TC-PSF-02-03-01 ตรวจสอบการแสดงผลข้อมูลรายชื่อผู้ใช้งานสถานะอาจารย์
        เปิดหน้าจอ            ${url} 
        กรอกข้อมูล            ${txt_email}        pichet
        กรอกข้อมูล            ${txt_pass}         123456
        กดปุ่ม                
        เช็คสถานะ            ${position}             