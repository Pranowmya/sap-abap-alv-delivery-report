# 🚀 SAP ABAP ALV Report – Delivery Header & Item Drilldown

## 📌 Overview
This project demonstrates an interactive ALV (ABAP List Viewer) report built using SAP ABAP.

It displays:
- Delivery Header Data from LIKP
- Delivery Item Data from LIPS

The report supports drill-down functionality, allowing users to click on a delivery number to view corresponding item details.

---

## 🎯 Objective
To build an interactive ALV report that:
- Displays delivery header data
- Enables hotspot click navigation
- Shows item-level details dynamically

---

## 🧩 Tables Used
- LIKP – Delivery Header Data  
- LIPS – Delivery Item Data  

---

## ⚙️ Report Details
**Report Name:** `ZMP03_ALV`

---

## 📥 Input
- Delivery Number (VBELN) via Select-Options

---

## 🔄 Process Flow
1. User enters delivery number(s)  
2. System fetches header data from LIKP  
3. ALV Grid is displayed  
4. User clicks on Delivery Number  
5. System fetches item data from LIPS  
6. Item ALV Grid is displayed  

---

## 💡 Key Features
- Interactive ALV Grid  
- Hotspot click functionality  
- Drill-down navigation  
- Dynamic field catalog creation  
- Optimized column width  
- Clean modular design  

---

## 🧪 Sample Input

| VBELN        |
|-------------|
| 00001402    |

---

## 📊 Sample Output

<img width="250" height="200" alt="image" src="https://github.com/user-attachments/assets/08667b71-d9b8-4790-aa50-13fa228dcf09" />
---

## 🧰 Technologies Used
- SAP ABAP  
- ALV (REUSE_ALV_GRID_DISPLAY)  
- Open SQL  
- Data Dictionary  

---

## 📈 Future Enhancements
- OO ALV (CL_GUI_ALV_GRID)  
- Filtering and sorting options  
- Excel download functionality  
- Integration with SmartForms  

---

## 🏷️ Tags
sap-abap, alv-report, sap-development, logistics, erp, abap, sap-project
