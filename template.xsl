<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="A4"
          page-height="29.7cm" page-width="21cm"
          margin-top="1.5cm" margin-bottom="1.5cm"
          margin-left="2cm" margin-right="2cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="A4">
        <fo:flow flow-name="xsl-region-body">

          <!-- Header with Logo and Company Details -->
<!-- SVG Logo -->
<fo:block text-align="center" space-after="10mm">
  <fo:external-graphic src="url('logo.svg')" content-width="100px"/>
</fo:block>

<fo:block font-family="DejaVu Sans" font-size="18pt" font-weight="bold" color="#003366" text-align="center" space-after="6mm">
  INVOICE
</fo:block>

          <fo:table table-layout="fixed" width="100%" font-family="DejaVu Sans" font-size="9pt">
            <fo:table-column column-width="50%"/>
            <fo:table-column column-width="50%"/>
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell>
                  <fo:block font-weight="bold">From:</fo:block>
                  <fo:block>OrderMaster Inc.</fo:block>
                  <fo:block>123 Business Road</fo:block>
                  <fo:block>City, Country</fo:block>
                  <fo:block>Email: info@ordermaster.com</fo:block>
                </fo:table-cell>
                <fo:table-cell text-align="right">
                  <fo:block font-weight="bold">Invoice No:</fo:block>
                  <fo:block>INV-001</fo:block>
                  <fo:block>Date: 2025-06-22</fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>

          <!-- Customer Info -->
          <fo:block space-before="6mm" font-weight="bold" font-size="10pt">Bill To:</fo:block>
          <fo:block font-family="DejaVu Sans" font-size="9pt">
            <fo:block>Client Company</fo:block>
            <fo:block>456 Client St.</fo:block>
            <fo:block>Other City, Country</fo:block>
            <fo:block>Email: client@example.com</fo:block>
          </fo:block>

          <!-- Invoice Table -->
          <fo:block font-weight="bold" font-size="10pt" space-before="6mm">Details:</fo:block>
          <fo:table table-layout="fixed" width="100%" font-family="DejaVu Sans" font-size="9pt" border="solid 1pt #333">
            <fo:table-column column-width="50%"/>
            <fo:table-column column-width="15%"/>
            <fo:table-column column-width="15%"/>
            <fo:table-column column-width="20%"/>
            <fo:table-header>
              <fo:table-row background-color="#4a90e2" color="white">
                <fo:table-cell padding="4pt"><fo:block font-weight="bold">Description</fo:block></fo:table-cell>
                <fo:table-cell padding="4pt"><fo:block font-weight="bold">Unit Price</fo:block></fo:table-cell>
                <fo:table-cell padding="4pt"><fo:block font-weight="bold">Quantity</fo:block></fo:table-cell>
                <fo:table-cell padding="4pt"><fo:block font-weight="bold">Total</fo:block></fo:table-cell>
              </fo:table-row>
            </fo:table-header>
            <fo:table-body>
              <xsl:for-each select="orders/order">
                <fo:table-row background-color="{position() mod 2 = 0 and '#f9f9f9' or 'white'}">
                  <fo:table-cell padding="4pt"><fo:block><xsl:value-of select="description"/></fo:block></fo:table-cell>
                  <fo:table-cell padding="4pt"><fo:block><xsl:value-of select="unit"/> $</fo:block></fo:table-cell>
                  <fo:table-cell padding="4pt"><fo:block><xsl:value-of select="quantity"/></fo:block></fo:table-cell>
                  <fo:table-cell padding="4pt"><fo:block><xsl:value-of select="unit * quantity"/></fo:block></fo:table-cell>
                </fo:table-row>
              </xsl:for-each>

              <!-- Total Summary Row -->
              <fo:table-row background-color="#e0e0e0">
                <fo:table-cell number-columns-spanned="3" padding="4pt" border-top="solid 1pt #333">
                  <fo:block font-weight="bold" text-align="right">Total:</fo:block>
                </fo:table-cell>
                <fo:table-cell padding="4pt" border-top="solid 1pt #333">
<fo:block font-weight="bold">
  <xsl:value-of select="sum(orders/order/total)"/> $
</fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>

          <fo:block font-size="9pt" font-family="DejaVu Sans" text-align="center" space-before="12mm">
            Thank you for your business!
          </fo:block>

        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>

</xsl:stylesheet>