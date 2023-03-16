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
${btn_mail}      xpath=//a[@href="/followStudentCon/14"]
${followStudent}    xpath=//a[@href="/followStudent"]
${txt_mail}       stuConReg
${btn_save}         ok
${btn_delete}       btndelete

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
    Click Link             ${btn} 
กรอกข้อมูล
    [Arguments]             ${txt}              ${input}
    [Documentation]         ใช้กรอกข้อมูล
    Input Text              ${txt}              ${input} 

***Test Cases***
TC-PSF-05-05-01 ตรวจสอบการกดปุ่มบันทึก
    เปิดหน้าจอ        ${url}
    กดปุ่มไอคอน       ${btn_mail}
    กรอกข้อมูล        ${txt_mail}         ${text}
    กดปุ่ม            ${btn_save}
TC-PSF-05-05-02 ตรวจสอบการกดปุ่มบันทึก หากไม่กรอกข้อมูล
    เปิดหน้าจอ        ${url}
    กดปุ่มไอคอน       ${btn_mail}
    กรอกข้อมูล        ${txt_mail}         ${EMPTY}
    กดปุ่ม            ${btn_save}
TC-PSF-05-05-03 ตรวจสอบการกดปุ่มลบข้อมูล
    เปิดหน้าจอ        ${url}
    กดปุ่มไอคอน       ${btn_mail}
    กดปุ่มไอคอน            ${btn_delete}







    