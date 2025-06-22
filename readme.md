# 🧾 Invoice PDF Generator (Apache FOP + XML + XSL-FO)

This project generates invoice PDF using **Apache FOP**, **XSL-FO**, and **XML data**.

---

## 🚀 How to Use (ENGLISH)

You **don't need to install** Apache FOP system-wide. Just download and unzip it.

### ✅ Step-by-step

1. **Download Apache FOP:**
   - [https://xmlgraphics.apache.org/fop/download.html](https://xmlgraphics.apache.org/fop/download.html)

2. **Extract the archive**, for example to `C:\fop`.

3. **Clone this repository** or download the three files:
   - `data.xml` — your order data
   - `template.xsl` — XSL-FO template
   - `logo.svg` — your company logo (optional)

4. **Open a terminal (CMD or PowerShell)** and navigate to the folder with these files.

5. Run the following command:

   
     C:\fop\fop.bat -xml "C:\path\to\your\folder\data.xml" -xsl "C:\path\to\your\folder\template.xsl" -pdf "C:\path\to\your\folder\output.pdf"

6. ✅ Done! Your PDF will be saved as output.pdf.




![image](https://github.com/user-attachments/assets/62965ec8-d2ad-4b57-9e5a-9023bc880e1e)
