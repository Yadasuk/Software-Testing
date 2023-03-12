*** Settings ***
Library  SeleniumLibrary
Test Teardown   Close Browser


*** Keywords ***
เปิดหน้าจอเว็บ
        [Arguments]         ${URL_page}     ${web_browser}
        [Documentation]
        Open Browser            ${URL_page}             ${web_browser}
กรอกข้อมูล
        [Arguments]             ${txt_user}   ${user_name}
        [Documentation]
        Input Text      ${txt_user}   ${user_name}
เลือกเพศ
        [Arguments]         ${Select_gender}    
        [Documentation]
        Select Radio Button     gender    ${Select_gender}
เลือกตำแหน่งงาน
        [Arguments]         ${Select_position}    
        [Documentation]
        Select From List By Value        position    ${Select_position}


เลือกเงินเดือน
        [Arguments]         ${Select_money}    
        [Documentation]
        Select Checkbox         ${Select_money}
กดปุ่มยืนยัน
        [Arguments]            ${btn_ok}
        [Documentation]  
        Click Button      ${btn_ok}
*** Test Cases ***
TC-xxx-01-01 ตรวจสอบการเปิดหน้าจอเข้าสู่ระบบ Login ด้วย chrome web Browser
        เปิดหน้าจอเว็บ             http://127.0.0.1/html01/login.html      chrome
TC-xxx-01-02 ตรวจสอบการกรอกข้อมูล Username รับไม่เกิน 10 ตัวอักษร
        เปิดหน้าจอเว็บ             http://127.0.0.1/html01/login.html      chrome
        กรอกข้อมูล                email   Thai@go
TC-xxx-01-03 ตรวจสอบการกรอกข้อมูล Username รับไม่เกิน 10 ตัวอักษร Password รับไม่เกิน 10 ตัวอักษร เพื่อเข้าสู่ระบบ
        เปิดหน้าจอเว็บ             http://127.0.0.1/html01/login.html      chrome
        กรอกข้อมูล               email    Thai@go
        กรอกข้อมูล               pass     12345
TC-xxx-02-01-01 ตรวจสอบการเลือกเพศหญิง
        เปิดหน้าจอเว็บ             http://127.0.0.1/html01/member.html      chrome
        เลือกเพศ                 หญิง
TC-xxx-02-01-02 ตรวจสอบการเลือกตำแหน่งงานพนักงาน
        เปิดหน้าจอเว็บ             http://127.0.0.1/html01/member.html      chrome
        เลือกตำแหน่งงาน           พนักงาน
TC-xxx-02-01-03 ตรวจสอบการเลือกเงินเดือนมากกว่า 1 รายการคือ 5,000 บาท 15,000 บาท และ 20,000 บาท
        เปิดหน้าจอเว็บ             http://127.0.0.1/html01/member.html      chrome
        เลือกเงินเดือน             option1
        เลือกเงินเดือน             option2
        เลือกเงินเดือน             option3
        Click Button            btnLogout
