*** Settings ***
Library     SeleniumLibrary
Test Teardown   close Browser

*** Variables ***
${web_browser}    chrome
#${web_browser}    firefox 
#${web_browser}    edge
${url}            http://127.0.0.1:8080/
${url_manage}     http://127.0.0.1:8080/manageUser
${txt_email}      email
${txt_pass}       password
${txt_search}     search
${btn_ok}         btnok
${btn_search}     btnsearch


*** Keywords ***
เปิดหน้าจอจัดการผู้ใช้งาน
    [Arguments]            ${url}          
    [Documentation]        ใช้เปิดหน้าจอจัดการผู้ใช้งาน 
    Open Browser           ${url}             ${web_browser}          
กรอกข้อมูล
    [Arguments]            ${txt}             ${data_search}
    [Documentation]        กรอกข้อมูล
    Input Text             ${txt}             ${data_search}
กดปุ่ม
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Button           ${btn} 

*** Test Cases ***
TC-PSF-02-01-01 ตรวจสอบการกรอกข้อมูลค้นหาจากชื่อผู้ใช้
    เปิดหน้าจอจัดการผู้ใช้งาน           ${url_manage}    
    กรอกข้อมูล                      ${txt_search}     pichet
    กดปุ่ม                        ${btn_search}   
TC-PSF-02-01-02 ตรวจสอบการกรอกข้อมูลค้นหาจากชื่อ
    เปิดหน้าจอจัดการผู้ใช้งาน           ${url_manage}    
    กรอกข้อมูล                      ${txt_search}     พิเชษ
    กดปุ่ม                        ${btn_search} 
TC-PSF-02-01-03 ตรวจสอบการกรอกข้อมูลค้นหาจากนามสกุล
    เปิดหน้าจอจัดการผู้ใช้งาน           ${url_manage}    
    กรอกข้อมูล                      ${txt_search}     วะยะลุน
    กดปุ่ม                        ${btn_search} 
TC-PSF-02-01-04 ตรวจสอบการกรอกข้อมูลค้นหา รับไม่เกิน 50 ตัวอักษร
    เปิดหน้าจอจัดการผู้ใช้งาน           ${url_manage}    
    กรอกข้อมูล                      ${txt_search}     2222222222222222222222222222222222222222222222222222
    กดปุ่ม                        ${btn_search} 
