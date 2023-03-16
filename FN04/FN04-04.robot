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
${manageEnp}      xpath=//a[@href="/manageStudentEnp"]
${stuID}          studentIDEnp
${nameStu}        nameStuEnp
${grade}          stuGpaEnp
${creditPass}     creditPassedEnp
${creditDown}     creditDownEnp
${dropdownlevel}    stuLevelEnp
${dropdownstatus}   stuStatusEnp

${login_name}     pichet
${login_pass}     123456
${stuid}          63160210
${name1}          พีชญุตม์ ธนะประสพ12
${grade1}         2.10สอง
${cdp1}           142สอง
${cda1}           150ศูนย์
${stuid2}         63160
${name2}          กฤษณ์ดนัย ศรีรักษา22222222222222222222222222222222
${grade2}         1.779
${grade3}         1.79
${cdp2}           1.5
${name3}          พีชญุตม์ ธนะประสพ
${list1}          ตรี ปกติ
${status}         10
${cdp3}           108
${cda2}           111
${name3}          พีชญุตม์ ธนะประสพ
${level}          ตรี ปกติ

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
TC-PSF-04-04-01 ตรวจสอบการกรอกข้อมูลรหัสนิสิต
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${stuID}       ${stuid}
TC-PSF-04-04-02 ตรวจสอบการกรอกข้อมูลชื่อ-นามสกุล
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${nameStu}       ${name1}
TC-PSF-04-04-03 ตรวจสอบการกรอกข้อมูลเกรดเฉลี่ย
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${grade}       ${grade1}
TC-PSF-04-04-04 ตรวจสอบการกรอกข้อมูลหน่วยกิตที่ผ่าน
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${creditPass}       ${cdp1}
TC-PSF-04-04-05 ตรวจสอบการกรอกข้อมูลหน่วยกิตที่ลง
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${creditDown}       ${cda1}
TC-PSF-04-04-06 ตรวจสอบการกรอกข้อมูลรหัสนิสิต รับไม่เกิน 8 ตัวอักษร และไม่น้อยกว่า 8 ตัวอักษร
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${stuID}       ${stuid2}
TC-PSF-04-04-07 ตรวจสอบการกรอกข้อมูลชื่อ - นามสกุล รับไม่เกิน 50 ตัวอักษร
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${nameStu}       ${name3}
TC-PSF-04-04-08 ตรวจสอบการกรอกข้อมูลเกรดเฉลี่ยด้วยเลขทศนิยมมากว่า 2 ตำแหน่ง
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${grade}       ${grade2}
TC-PSF-04-04-09 ตรวจสอบการกรอกข้อมูลหน่วยกิตที่ผ่านด้วยเลขทศนิยม
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${creditPass}       ${cdp2}
TC-PSF-04-04-10 ตรวจสอบการกรอกข้อมูลหน่วยกิตที่ลงด้วยเลขทศนิยม
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${creditDown}       ${cdp2}
TC-PSF-04-04-11 ตรวจสอบการหากไม่กรอกข้อมูลรหัสนิสิต
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${nameStu}       ${name3}
    เลือกจาก Dropdown ระดับ  ${level}
    กรอกข้อมูล     ${grade}       ${grade3}
    เลือกจาก Dropdown สถานภาพ    ${status}
    กรอกข้อมูล     ${creditPass}       ${cdp3}
    กรอกข้อมูล     ${creditDown}       ${cda2}
TC-PSF-04-04-12 ตรวจสอบการหากไม่กรอกข้อมูลชื่อ-นามสกุล
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${stuID}       ${stuid}
    เลือกจาก Dropdown ระดับ  ${level}
    กรอกข้อมูล     ${grade}       ${grade3}
    เลือกจาก Dropdown สถานภาพ    ${status}
    กรอกข้อมูล     ${creditPass}       ${cdp3}
    กรอกข้อมูล     ${creditDown}       ${cda2}
TC-PSF-04-04-13 ตรวจสอบการหากไม่เลือก Dropdown ระดับ
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${stuID}       ${stuid}
    กรอกข้อมูล     ${nameStu}       ${name3}
    กรอกข้อมูล     ${grade}       ${grade3}
    เลือกจาก Dropdown สถานภาพ    ${status}
    กรอกข้อมูล     ${creditPass}       ${cdp3}
    กรอกข้อมูล     ${creditDown}       ${cda2}
TC-PSF-04-04-14 ตรวจสอบการหากไม่กรอกข้อมูลเกรดเฉลี่ย
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${stuID}       ${stuid}
    กรอกข้อมูล     ${nameStu}       ${name3}
    เลือกจาก Dropdown ระดับ  ${level}
    เลือกจาก Dropdown สถานภาพ    ${status}
    กรอกข้อมูล     ${creditPass}       ${cdp3}
    กรอกข้อมูล     ${creditDown}       ${cda2}
TC-PSF-04-04-15 ตรวจสอบการหากไม่เลือก Dropdown สถานภาพ
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${stuID}       ${stuid}
    กรอกข้อมูล     ${nameStu}       ${name3}
    เลือกจาก Dropdown ระดับ  ${level}
    กรอกข้อมูล     ${grade}       ${grade3}
    กรอกข้อมูล     ${creditPass}       ${cdp3}
    กรอกข้อมูล     ${creditDown}       ${cda2}
TC-PSF-04-04-16 ตรวจสอบการหากไม่กรอกข้อมูลหน่วยกิตที่ผ่าน
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${stuID}       ${stuid}
    กรอกข้อมูล     ${nameStu}       ${name3}
    เลือกจาก Dropdown ระดับ  ${level}
    กรอกข้อมูล     ${grade}       ${grade3}
    เลือกจาก Dropdown สถานภาพ    ${status}
    กรอกข้อมูล     ${creditDown}       ${cda2}
TC-PSF-04-04-17 ตรวจสอบการหากไม่กรอกข้อมูลหน่วยกิตที่ลง
    เปิดหน้าจอ     ${url} 
    กดปุ่ม         ${btn_add}
    เปิดหน้าจอเพิ่มข้อมูล
    กรอกข้อมูล     ${stuID}       ${stuid}
    กรอกข้อมูล     ${nameStu}       ${name3}
    เลือกจาก Dropdown ระดับ  ${level}
    กรอกข้อมูล     ${grade}       ${grade3}
    เลือกจาก Dropdown สถานภาพ    ${status}
    กรอกข้อมูล     ${creditPass}       ${cdp3}


    