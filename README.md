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

## 📤 Output

### 🔹 Initial Output (Header ALV)
Displays delivery header details:
- Delivery Number  
- Delivery Type  
- Customer  
- GI Date  
- Shipping Point  

👉 The **Delivery Number (VBELN)** is clickable (Hotspot)

---

### 🔹 Drill-Down Output (Item ALV)
When user clicks on a Delivery Number:
- Item details are displayed in a new ALV

Fields:
- Delivery Number  
- Item Number  
- Material Number  
- Quantity  
- Unit  

---

## 📺 Output Location

The output is displayed in:

1. SAP GUI  
2. Transaction: `SE38`  
3. Enter program: `ZMP03_ALV`  
4. Execute (F8)  

➡️ First ALV Grid (Header Data) is displayed  
➡️ Click on Delivery Number to view Item ALV  

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
| 80000012    |

---

## 📊 Sample Output

### Header ALV
| Delivery | Type | Customer | GI Date   | Shipping Point |
|----------|------|----------|-----------|----------------|
| 80000012 | LF   | 100001   | 2024-04-15| SP01           |

👉 Click on **80000012**

---

### Item ALV
| Delivery | Item | Material | Quantity | Unit |
|----------|------|----------|----------|------|
| 80000012 | 10   | MAT001   | 50       | EA   |
| 80000012 | 20   | MAT002   | 30       | EA   |

---

## 🧰 Technologies Used
- SAP ABAP  
- ALV (REUSE_ALV_GRID_DISPLAY)  
- Open SQL  
- Data Dictionary  

---

## 🏗️ Project Structure
