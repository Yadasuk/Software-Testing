*** Settings ***
Library     SeleniumLibrary
Test Teardown   close Browser

*** Variables ***
#${web_browser}    chrome
#${web_browser}    firefox 
${web_browser}    edge
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
    Click Link           ${btn}

***Test Cases***
TC-PSF-04-09-01 ตรวจสอบการแสดงผลข้อมูลรหัสนิสิตที่เลือกจากตาราง
    เปิดหน้าจอ          ${url} 
    กดปุ่มไอคอน         ${btn_edit}
TC-PSF-04-09-02 ตรวจสอบการแสดงผลข้อมูลชื่อ-นามสกุลที่เลือกจากตาราง
    เปิดหน้าจอ          ${url} 
    กดปุ่มไอคอน         ${btn_edit}   
TC-PSF-04-09-03 ตรวจสอบการแสดงผลข้อมูลเกรดเฉลี่ยที่เลือกจากตาราง 
    เปิดหน้าจอ          ${url} 
    กดปุ่มไอคอน         ${btn_edit}
TC-PSF-04-09-04 ตรวจสอบการแสดงผลข้อมูลหน่วยกิตที่ผ่านที่เลือกจากตาราง 
    เปิดหน้าจอ          ${url} 
    กดปุ่มไอคอน         ${btn_edit}        
TC-PSF-04-09-05 ตรวจสอบการแสดงผลข้อมูลหน่วยกิตที่ลงที่เลือกจากตาราง  
    เปิดหน้าจอ          ${url} 
    กดปุ่มไอคอน         ${btn_edit}                                                                                                                                                               