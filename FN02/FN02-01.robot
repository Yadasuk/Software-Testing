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

${txt_search}     search
${btn_ok}         btnok
${btn_search}     btnsearch

${login_name}     pichet
${login_pass}     123456

${username}        pichet
${name}            พิเชษ
${lastname}        วะยะลุน
${test}            2222222222222222222222222222222222222222222222222222            

*** Keywords ***
เปิดหน้าจอ
    [Arguments]            ${url}          
    [Documentation]        เข้าสู่ระบบและเปิดหน้าจอนิสิตจัดการผู้ใช้งาน
    Open Browser           ${url}             ${web_browser}
    Input Text             ${txt_email}       ${login_name}
    Input Text             ${txt_pass}       ${login_pass}
    Click Button           ${btn_ok} 
    Click Link             ${manageUser}      
กรอกข้อมูล
    [Arguments]            ${txt}             ${input}
    [Documentation]        กรอกข้อมูล
    Input Text             ${txt}             ${input}
กดปุ่ม
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Button           ${btn}


*** Test Cases ***
TC-PSF-02-01-01 ตรวจสอบการกรอกข้อมูลค้นหาจากชื่อผู้ใช้
    เปิดหน้าจอ           ${url}    
    กรอกข้อมูล           ${txt_search}     ${username}
    กดปุ่ม               ${btn_search}  
TC-PSF-02-01-02 ตรวจสอบการกรอกข้อมูลค้นหาจากชื่อ
    เปิดหน้าจอ           ${url}    
    กรอกข้อมูล           ${txt_search}     ${name}
    กดปุ่ม               ${btn_search}
TC-PSF-02-01-03 ตรวจสอบการกรอกข้อมูลค้นหาจากนามสกุล
    เปิดหน้าจอ           ${url}    
    กรอกข้อมูล           ${txt_search}     ${lastname}
    กดปุ่ม               ${btn_search}
TC-PSF-02-01-04 ตรวจสอบการกรอกข้อมูลค้นหา รับไม่เกิน 50 ตัวอักษร
    เปิดหน้าจอ           ${url}    
    กรอกข้อมูล           ${txt_search}     ${test}
    กดปุ่ม               ${btn_search}       
