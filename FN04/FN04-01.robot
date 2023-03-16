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
${txt_search}     searchuser
${btn_search}     btnsearch
${manageEnp}    xpath=//a[@href="/manageStudentEnp"]

${login_name}     pichet
${login_pass}     123456
${search1}       นาย ชรัญธร
${search2}       วงษ์ไทย
${search3}       58660044
${search4}       นามสกุลลลลลลลลลลลลลลลลลลลลลลลลลลลลลลลลลลลลลลลลลลลลลล




*** Keywords ***
เปิดหน้าจอ
    [Arguments]            ${url}          
    [Documentation]        เข้าสู่ระบบและเปิดหน้าจอนิสิตจบไม่ตรงแผน
    Open Browser           ${url}             ${web_browser}
    Input Text             ${txt_email}       ${login_name}
    Input Text             ${txt_pass}       ${login_pass}
    Click Button           ${btn_ok} 
    Click Link             ${manageEnp}
กรอกข้อมูล
    [Arguments]             ${txt}              ${input}
    [Documentation]         ใช้กรอกข้อมูล
    Input Text              ${txt}              ${input} 
กดปุ่ม
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Button           ${btn} 
***Test Cases***
TC-PSF-04-01-01 ตรวจสอบการกรอกข้อมูลช่องค้นหาจากชื่อ
    เปิดหน้าจอ     ${url} 
    กรอกข้อมูล     ${txt_search}            ${search1} 
    กดปุ่ม         ${btn_search}
TC-PSF-04-01-02 ตรวจสอบการกรอกข้อมูลช่องค้นหาจากนามสกุล
    เปิดหน้าจอ     ${url} 
    กรอกข้อมูล     ${txt_search}            ${search2} 
    กดปุ่ม         ${btn_search}
TC-PSF-04-01-03 ตรวจสอบการกรอกข้อมูลช่องค้นหาจากรหัสนิสิต
    เปิดหน้าจอ     ${url} 
    กรอกข้อมูล     ${txt_search}            ${search3} 
    กดปุ่ม         ${btn_search}
TC-PSF-04-01-04 ตรวจสอบการกรอกข้อมูลค้นหา รับไม่เกิน 50 ตัวอักษร
    เปิดหน้าจอ     ${url} 
    กรอกข้อมูล     ${txt_search}            ${search4} 
    กดปุ่ม         ${btn_search}