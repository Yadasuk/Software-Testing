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
${btn_mail}      xpath=//a[@href="/followStudentCon/1"]
${followStudent}    xpath=//a[@href="/followStudent"]
${txt_mail}       stuConReg
${txt_stuid}      studentID
${txt_name}       nameStu
${txt_level}      stuLevel
${txt_gpa}        stuGpa
${txt_status}     stuStatus
${txt_cdp}        creditPassed
${txt_cda}        creditDown
${txt_cons}       stuCon

${login_name}     pichet
${login_pass}     123456
${stuid}          58660044
${name}           นาย ชรัญธร วงษ์ไทย
${level}          ตรี พิเศษ
${gpa}            1.94
${cdp}            142
${cda}            150
${cons}           โปรสูง


*** Keywords ***
เปิดหน้าจอ
    [Arguments]            ${url}          
    [Documentation]        เข้าสู่ระบบและเปิดหน้าจอติดตามนิสิตรอการพินิจ
    Open Browser           ${url}             ${web_browser}
    Input Text             ${txt_email}       ${login_name}
    Input Text             ${txt_pass}       ${login_pass}
    Click Button           ${btn_ok} 
    Click Link             ${followStudent}
กดปุ่มไอคอน
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Link             ${btn} 
เช็คข้อมูล
    [Arguments]            ${txt}               ${show}    
    [Documentation]         เช็คข้อมูลที่แสดงใน textfield
    Textfield Value Should Be   ${txt}          ${show}

***Test Cases***
TC-PSF-05-06-01 ตรวจสอบการแสดงผลข้อมูลรหัสนิสิตที่เลือกจากตาราง                                     
    เปิดหน้าจอ        ${url}
    กดปุ่มไอคอน       ${btn_mail}
    เช็คข้อมูล         ${txt_stuid}        ${stuid}
TC-PSF-05-06-02 ตรวจสอบการแสดงผลข้อมูลชื่อ-นามสกุล ที่เลือกจากตาราง                                     
    เปิดหน้าจอ        ${url}
    กดปุ่มไอคอน       ${btn_mail}
    เช็คข้อมูล         ${txt_name}        ${name}
TC-PSF-05-06-03 ตรวจสอบการแสดงผลข้อมูลระดับที่เลือกจากตาราง                                     
    เปิดหน้าจอ        ${url}
    กดปุ่มไอคอน       ${btn_mail}
    เช็คข้อมูล         ${txt_level}        ${level}
TC-PSF-05-06-04 ตรวจสอบการแสดงผลข้อมูลเกรดเฉลี่ยที่เลือกจากตาราง   
    เปิดหน้าจอ        ${url}        
    กดปุ่มไอคอน       ${btn_mail}
    เช็คข้อมูล         ${txt_gpa}        ${gpa}                          
TC-PSF-05-06-05 ตรวจสอบการแสดงผลข้อมูลหน่วยกิตที่ผ่านที่เลือกจากตาราง   
    เปิดหน้าจอ        ${url}       
    กดปุ่มไอคอน       ${btn_mail}
    เช็คข้อมูล         ${txt_cdp}        ${cdp}                           
TC-PSF-05-06-06 ตรวจสอบการแสดงผลข้อมูลหน่วยกิตที่ลงที่เลือกจากตาราง   
    เปิดหน้าจอ        ${url}  
    กดปุ่มไอคอน       ${btn_mail}
    เช็คข้อมูล         ${txt_cda}        ${cda}                                
TC-PSF-05-06-07 ตรวจสอบการแสดงผลข้อมูลรอพิจารณาที่เลือกจากตาราง
    เปิดหน้าจอ        ${url}
    กดปุ่มไอคอน       ${btn_mail}
    เช็คข้อมูล         ${txt_cons}        ${cons}
TC-PSF-05-06-08 ตรวจสอบการแสดงผลข้อมูลกล่องกรอกข้อความ 
    เปิดหน้าจอ        ${url}            
    กดปุ่มไอคอน       ${btn_mail}
    Page Should Contain Element     ${txt_mail}                      
TC-PSF-05-06-09 ตรวจสอบการแสดงผลข้อมูลตารางการพูดคุย  
    เปิดหน้าจอ        ${url}     
    กดปุ่มไอคอน       ${btn_mail}
    Page Should Contain   ลำดับ   
    Page Should Contain   วัน เดือน ปี
    Page Should Contain   แผนการเรียน     

    