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
${btn_ok}         btnok
${login_name}     pichet
${login_pass}     123456

${btn_add}        btnAdd
${txt_user}       username
${txt_pass}       password
${txt_name}       nameuser
${dropdownpos}    statusUser
${user1}          sakdaa
${pass1}          123456
${name1}          sakda5678
${user2}          sakdaa123
${pass2}          123
${name2}          กฤษณ์ดนัย ศรีรักษา222222222222222222222222222222222
${pass3}          12458
${name4}          กฤษณ์ดนัย ศรีรักษา
${position}       อาจารย์
${user3}          Mild2502
${random}         er21$5ยน๗xXa^

*** Keywords ***
เปิดหน้าจอ
    [Arguments]            ${url}          
    [Documentation]        เข้าสู่ระบบและเปิดหน้าจอนิสิตจัดการผู้ใช้งาน
    Open Browser           ${url}             ${web_browser}
    Input Text             ${txt_email}       ${login_name}
    Input Text             ${txt_pass}       ${login_pass}
    Click Button           ${btn_ok} 
    Click Link             ${manageUser} 
    Click Button           ${btn_add}
    Switch Window           locator=NEW
กรอกข้อมูล
    [Arguments]             ${txt}              ${input}
    [Documentation]         ใช้กรอกข้อมูล
    Input Text              ${txt}              ${input} 
เลือกจาก Dropdown ตำแหน่ง
    [Arguments]                 ${list}
    [Documentation]             เลือกจากในลิสต์
    Select From List By Label   ${dropdownpos}           ${list}

*** Test Cases ***
TC-PSF-02-04-01 ตรวจสอบการกรอกข้อมูลชื่อผู้ใช้
    เปิดหน้าจอ        ${url}
    กรอกข้อมูล        ${txt_user}     ${user1}
TC-PSF-02-04-02 ตรวจสอบการกรอกข้อมูลรหัสผ่าน
    เปิดหน้าจอ        ${url}
    กรอกข้อมูล        ${txt_pass}     ${pass1}
TC-PSF-02-04-03 ตรวจสอบการกรอกข้อมูลชื่อ-นามสกุล
    เปิดหน้าจอ        ${url}
    กรอกข้อมูล        ${txt_name}     ${name1}
TC-PSF-02-04-04 ตรวจสอบการกรอกข้อมูลชื่อผู้ใช้ รับไม่เกิน 6 ตัวอักษร และไม่น้อยกว่า 6 ตัวอักษร
    เปิดหน้าจอ        ${url}
    กรอกข้อมูล        ${txt_user}     ${user2}
TC-PSF-02-04-05 ตรวจสอบการกรอกข้อมูลรหัสผ่าน รับไม่เกิน 6 ตัวอักษร และไม่น้อยกว่า 6 ตัวอักษร
    เปิดหน้าจอ        ${url}
    กรอกข้อมูล        ${txt_pass}     ${pass2}
TC-PSF-02-04-06 ตรวจสอบการกรอกข้อมูลชื่อ - นามสกุล รับไม่เกิน 50 ตัวอักษร
    เปิดหน้าจอ        ${url}
    กรอกข้อมูล        ${txt_name}     ${name2}
TC-PSF-02-04-07 ตรวจสอบการหากไม่กรอกข้อมูลชื่อผู้ใช้
    เปิดหน้าจอ        ${url}
    กรอกข้อมูล        ${txt_pass}     ${pass3}
    กรอกข้อมูล        ${txt_name}     ${name4}
    เลือกจาก Dropdown ตำแหน่ง          ${position}
TC-PSF-02-04-08 ตรวจสอบการหากไม่กรอกข้อมูลรหัสผ่าน
    เปิดหน้าจอ        ${url}
    กรอกข้อมูล        ${txt_user}     ${user3}
    กรอกข้อมูล        ${txt_name}     ${name4}
    เลือกจาก Dropdown ตำแหน่ง          ${position}
TC-PSF-02-04-09 ตรวจสอบการหากไม่กรอกข้อมูลชื่อ-นามสกุล
    เปิดหน้าจอ        ${url}
    กรอกข้อมูล        ${txt_user}     ${user3}
    กรอกข้อมูล        ${txt_pass}     ${pass3}
    เลือกจาก Dropdown ตำแหน่ง          ${position}
TC-PSF-02-04-10 ตรวจสอบการหากกรอกข้อมูลชื่อผู้ใช้เป็นตัวอักษรมั่ว
    เปิดหน้าจอ        ${url}
    กรอกข้อมูล        ${txt_user}     ${random}
TC-PSF-02-04-11 ตรวจสอบการกรอกข้อมูลรหัสผ่านเป็นตัวอักษรมั่ว
    เปิดหน้าจอ        ${url}
    กรอกข้อมูล        ${txt_pass}     ${random}
TC-PSF-02-04-12 ตรวจสอบการกรอกข้อมูลชื่อ-นามสกุลเป็นตัวอักษรมั่ว
    เปิดหน้าจอ        ${url}
    กรอกข้อมูล        ${txt_name}     ${random}