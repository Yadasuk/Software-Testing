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
${btn_add}        btnAdd
${stuID}          studentIDEnp
${nameStu}        nameStuEnp
${grade}          stuGpaEnp
${creditPass}     creditPassedEnp
${creditDown}     creditDownEnp
${dropdownlevel}    stuLevelEnp
${dropdownstatus}   stuStatusEnp
${manageEnp}    xpath=//a[@href="/manageStudentEnp"]  
${save}             ok
${cancel}           cancel

${login_name}     pichet
${login_pass}     123456
${name}           พีชญุตม์ ธนะประสพ
${cdp}            108
${cda}            111
${grade_}         1.79
${level}          ตรี พิเศษ
${status}         10

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
เปิดหน้าจอเพิ่มข้อมูล
    [Documentation]         ใช้เปิดหน้าจอเพิ่มข้อมูล
    Switch Window           locator=NEW
กรอกข้อมูล
    [Arguments]             ${txt}              ${input}
    [Documentation]         ใช้กรอกข้อมูล
    Input Text              ${txt}              ${input} 
เลือกจาก Dropdown ระดับ
    [Arguments]                 ${list}
    [Documentation]             เลือกจากในลิสต์
    Select From List By Label   ${dropdownlevel}           ${list}
เลือกจาก Dropdown สถานภาพ
    [Arguments]                 ${list}
    [Documentation]             เลือกจากในลิสต์
    Select From List By Label   ${dropdownstatus}           ${list}


***Test Cases***
TC-PSF-04-05-01 ตรวจสอบการกดปุ่มบันทึก
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${stuID}       ${stuid}
    กรอกข้อมูล     ${nameStu}       ${name}
    เลือกจาก Dropdown ระดับ   ${level}
    กรอกข้อมูล     ${grade}       ${grade_}
    เลือกจาก Dropdown สถานภาพ    ${status}
    กรอกข้อมูล     ${creditPass}       ${cdp}
    กรอกข้อมูล     ${creditDown}       ${cda}
    กดปุ่ม         ${save}
TC-PSF-04-05-02 ตรวจสอบการกดยกเลิก
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กดปุ่ม         ${cancel}
