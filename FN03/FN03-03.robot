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
${pos}            position
${manageEnp}    xpath=//a[@href="/manageStudentConsider"]

${user1}     pichet
${pass1}     123456
${teacher}   อาจารย์

${user2}     somnuk
${pass2}     123456
${staff}     เจ้าหน้าที่

*** Keywords ***
เปิดหน้าจอ
    [Arguments]            ${url}          
    [Documentation]        เปิดหน้าจอ
    Open Browser           ${url}             ${web_browser}
กรอกข้อมูล
    [Arguments]             ${txt}              ${input}
    [Documentation]         ใช้กรอกข้อมูล
    Input Text              ${txt}              ${input} 
กดปุ่ม
    [Documentation]        กดปุ่มเข้าสู่ระบบและเปิดหน้าจัดการนิสิตจบไม่ตรงแผน
    Click Button           ${btn_ok} 
    Click Link             ${manageEnp}
ตรวจสอบสถานะ
    [Arguments]            ${position}            
    [Documentation]        ตรวจสอบสถานะ
    Element Should Contain      ${pos}       ${position}

***Test Cases***
TC-PSF-03-03-01 ตรวจสอบการแสดงผลข้อมูลรายชื่อผู้ใช้งานสถานะอาจารย์
    เปิดหน้าจอ     ${url} 
    กรอกข้อมูล     ${txt_email}       ${user1}
    กรอกข้อมูล     ${txt_pass}       ${pass1}
    กดปุ่ม
    ตรวจสอบสถานะ  ${teacher}
TC-PSF-03-03-02 ตรวจสอบการแสดงผลข้อมูลรายชื่อผู้ใช้งานสถานะเจ้าหน้าที่
    เปิดหน้าจอ     ${url} 
    กรอกข้อมูล     ${txt_email}       ${user2}
    กรอกข้อมูล     ${txt_pass}       ${pass2}
    กดปุ่ม
    ตรวจสอบสถานะ  ${staff}
