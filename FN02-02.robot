*** Settings ***
Library     SeleniumLibrary
Test Teardown   close Browser

*** Variables ***
${web_browser}    chrome
#${web_browser}    firefox 
#${web_browser}    edge
${url_manage}     http://127.0.0.1:8080/manageUser
${btn_search}     btnsearch
${btn_add}        btnAdd
${btn_edit}       btnedit
${btn_delete}     btndelete


*** Keywords ***
เปิดหน้าจอ
    [Arguments]            ${browser}          
    [Documentation]        ใช้เปิดหน้าจอ
    Open Browser           ${url_manage}           ${browser}          

*** Test Cases ***
TC-PSF-02-02-01 ตรวจสอบการกดปุ่มค้นหา
    เปิดหน้าจอ                ${web_browser}    
    Click Button            ${btn_search}
TC-PSF-02-02-02 ตรวจสอบการกดปุ่มเพิ่มข้อมูล
    เปิดหน้าจอ                ${web_browser}    
    Click Button            ${btn_add}
TC-PSF-02-02-03 ตรวจสอบการกดปุ่มแก้ไข
    เปิดหน้าจอ                ${web_browser}    
    Click Link           ${btn_edit}
TC-PSF-02-02-04 ตรวจสอบการกดปุ่มลบ
    เปิดหน้าจอ                ${web_browser}    
    Click Link            ${btn_delete}
