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
${btn_edit}       xpath=//a[@href="/manageEnp_edit/1"]
${manageEnp}      xpath=//a[@href="/manageStudentEnp"]
${stuID}          studentIDEnp
${nameStu}        nameStuEnp
${grade}          stuGpaEnp
${creditPass}     creditPassedEnp
${creditDown}     creditDownEnp

${dropdownlist}    stuLevelEnp
${dropdownstatus}   stuStatusEnp

${login_name}     pichet
${login_pass}     123456
${stuid}          63160210
${name}           พีชญุตม์ ธนะประสพ
${grade1}         1.79
${cdp1}           111
${cda1}           108
${stuid2}         63160
${name2}          กฤษณ์ดนัย ศรีรักษา22222222222222222222222222222222
${grade2}         1.779
${cdp2}           1.5
${list1}          ตรี ปกติ
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
กดปุ่มไอคอน
    [Arguments]            ${btn}            
    [Documentation]        กดปุ่ม
    Click Link             ${btn} 
กรอกข้อมูล
    [Arguments]             ${txt}              ${input}
    [Documentation]         ใช้กรอกข้อมูล
    Input Text              ${txt}              ${input} 
เลือกจาก Dropdown ระดับ
    [Arguments]                 ${list}
    [Documentation]             เลือกจากในลิสต์
    Select From List By Label   ${dropdownlist}           ${list}
เลือกจาก Dropdown สถานภาพ
    [Arguments]                 ${list}
    [Documentation]             เลือกจากในลิสต์
    Select From List By Label   ${dropdownstatus}           ${list}


***Test Cases***
TC-PSF-04-07-01 ตรวจสอบการกรอกข้อมูลรหัสนิสิต
    เปิดหน้าจอ          ${url} 
    กดปุ่มไอคอน        ${btn_edit}
    กรอกข้อมูล          ${stuID}       ${stuid}
TC-PSF-04-07-02 ตรวจสอบการกรอกข้อมูลชื่อ-นามสกุล
    เปิดหน้าจอ          ${url} 
    กดปุ่มไอคอน         ${btn_edit}
    กรอกข้อมูล          ${nameStu}       ${name}
TC-PSF-04-07-03 ตรวจสอบการกรอกข้อมูลเกรดเฉลี่ย
    เปิดหน้าจอ          ${url} 
    กดปุ่มไอคอน         ${btn_edit}
    กรอกข้อมูล          ${grade}       ${grade1}
TC-PSF-04-07-04 ตรวจสอบการกรอกข้อมูลหน่วยกิตที่ผ่าน
    เปิดหน้าจอ           ${url} 
    กดปุ่มไอคอน         ${btn_edit}
    กรอกข้อมูล          ${creditPass}       ${cdp1}
TC-PSF-04-07-05 ตรวจสอบการกรอกข้อมูลหน่วยกิตที่ลง
    เปิดหน้าจอ           ${url} 
    กดปุ่มไอคอน          ${btn_edit}
    กรอกข้อมูล           ${creditDown}       ${cda1}
TC-PSF-04-07-06 ตรวจสอบการกรอกข้อมูลรหัสนิสิต รับไม่เกิน 8 ตัวอักษร และไม่น้อยกว่า 8ตัวอักษร
    เปิดหน้าจอ            ${url} 
    กดปุ่มไอคอน           ${btn_edit}
    กรอกข้อมูล            ${stuID}       ${stuid2}
TC-PSF-04-07-07 ตรวจสอบการกรอกข้อมูลชื่อ - นามสกุล รับไม่เกิน 50 ตัวอักษร
    เปิดหน้าจอ            ${url} 
    กดปุ่มไอคอน          ${btn_edit}
    กรอกข้อมูล            ${nameStu}       ${name2}
TC-PSF-04-07-08 ตรวจสอบการกรอกข้อมูลเกรดเฉลี่ยด้วยเลขทศนิยมมากว่า 2 ตำแหน่ง
    เปิดหน้าจอ            ${url} 
    กดปุ่มไอคอน           ${btn_edit}
    กรอกข้อมูล             ${grade}       ${grade2}
TC-PSF-04-07-09 ตรวจสอบการกรอกข้อมูลหน่วยกิตที่ผ่านด้วยเลขทศนิยม
    เปิดหน้าจอ            ${url} 
    กดปุ่มไอคอน          ${btn_edit}
    กรอกข้อมูล            ${creditPass}       ${cdp2}
TC-PSF-04-07-10 ตรวจสอบการกรอกข้อมูลหน่วยกิตที่ลงด้วยเลขทศนิยม
    เปิดหน้าจอ            ${url} 
    กดปุ่มไอคอน          ${btn_edit}
    กรอกข้อมูล            ${creditDown}       ${cdp2}
TC-PSF-04-07-11 ตรวจสอบการหากไม่กรอกข้อมูลรหัสนิสิต
    เปิดหน้าจอ            ${url} 
    กดปุ่มไอคอน          ${btn_edit}
    กรอกข้อมูล            ${nameStu}       ${name}
    เลือกจาก Dropdown ระดับ       ${list1}
    กรอกข้อมูล            ${grade}       ${grade1}
    เลือกจาก Dropdown สถานภาพ    ${status}
    กรอกข้อมูล            ${creditPass}       ${cda1}
    กรอกข้อมูล            ${creditDown}       ${cdp1}
TC-PSF-04-07-12 ตรวจสอบการหากไม่กรอกข้อมูลชื่อ-นามสกุล
    เปิดหน้าจอ            ${url} 
    กดปุ่มไอคอน           ${btn_edit}
    กรอกข้อมูล            ${stuID}       ${stuid}
    เลือกจาก Dropdown ระดับ       ${list1}
    กรอกข้อมูล            ${grade}       ${grade1}
    เลือกจาก Dropdown สถานภาพ    ${status}
    กรอกข้อมูล            ${creditPass}       ${cda1}
    กรอกข้อมูล            ${creditDown}       ${cdp1}
TC-PSF-04-07-13 ตรวจสอบการหากไม่เลือก Dropdown ระดับ
    เปิดหน้าจอ            ${url} 
    กดปุ่มไอคอน           ${btn_edit}
    กรอกข้อมูล            ${stuID}       ${stuid}
    กรอกข้อมูล            ${nameStu}       ${name}
    กรอกข้อมูล            ${grade}       ${grade1}
    เลือกจาก Dropdown สถานภาพ        ${status}
    กรอกข้อมูล            ${creditPass}       ${cda1}
    กรอกข้อมูล            ${creditDown}       ${cdp1}
TC-PSF-04-07-14 ตรวจสอบการหากไม่กรอกข้อมูลเกรดเฉลี่ย
    เปิดหน้าจอ            ${url} 
    กดปุ่มไอคอน          ${btn_edit}
    กรอกข้อมูล            ${stuID}       ${stuid}
    กรอกข้อมูล            ${nameStu}       ${name}
    เลือกจาก Dropdown ระดับ       ${list1}
    เลือกจาก Dropdown สถานภาพ    ${status}
    กรอกข้อมูล            ${creditPass}       ${cda1}
    กรอกข้อมูล            ${creditDown}       ${cdp1}
TC-PSF-04-07-15 ตรวจสอบการหากไม่เลือก Dropdown สถานภาพ
    เปิดหน้าจอ            ${url} 
    กดปุ่มไอคอน           ${btn_edit}
    กรอกข้อมูล            ${stuID}       ${stuid}
    กรอกข้อมูล            ${nameStu}       ${name}
    เลือกจาก Dropdown ระดับ       ${list1}
    กรอกข้อมูล            ${grade}       ${grade1}
    กรอกข้อมูล            ${creditPass}       ${cda1}
    กรอกข้อมูล            ${creditDown}       ${cdp1}
TC-PSF-04-07-16 ตรวจสอบการหากไม่กรอกข้อมูลหน่วยกิตที่ผ่าน
    เปิดหน้าจอ          ${url} 
    กดปุ่มไอคอน         ${btn_edit}
    กรอกข้อมูล          ${stuID}       ${stuid}
    กรอกข้อมูล          ${nameStu}       ${name}
    เลือกจาก Dropdown ระดับ       ${list1}
    กรอกข้อมูล            ${grade}       ${grade1}
    เลือกจาก Dropdown สถานภาพ       ${status}
    กรอกข้อมูล            ${creditDown}       ${cdp1}
TC-PSF-04-07-17 ตรวจสอบการหากไม่กรอกข้อมูลหน่วยกิตที่ลง
    เปิดหน้าจอ            ${url} 
    กดปุ่มไอคอน          ${btn_edit}
    กรอกข้อมูล            ${stuID}       ${stuid}
    กรอกข้อมูล            ${nameStu}       ${name}
    เลือกจาก Dropdown ระดับ           ${list1}
    กรอกข้อมูล            ${grade}       ${grade1}
    เลือกจาก Dropdown สถานภาพ        ${status}
    กรอกข้อมูล            ${creditPass}       ${cda1}


    