<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/filter/label/rv_domain">
                    <div class="col-1-4 item" item-name="rv_domain">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/rv_domain) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/rv_domain" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/filter/label/rv_domain" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/rv_domain/@name}" value="{rows/content/filter/value/rv_domain}" class="text required" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/rv_domain"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="'table'"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/rv_domain">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/rv_domain"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/rv_low_value">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/rv_low_value"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/rv_meaning">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/rv_meaning"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/rv_table_name">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/rv_table_name"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="rv_domain">
                              <td align="left" data-row="{position()}" data-title="{../../label/rv_domain}" class="text">
                                <xsl:value-of select="rv_domain"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="rv_low_value">
                              <td align="left" data-row="{position()}" data-title="{../../label/rv_low_value}" class="text">
                                <xsl:value-of select="rv_low_value"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="rv_meaning">
                              <td align="left" data-row="{position()}" data-title="{../../label/rv_meaning}" class="text">
                                <xsl:value-of select="rv_meaning"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="rv_table_name">
                              <td align="left" data-row="{position()}" data-title="{../../label/rv_table_name}" class="text">
                                <xsl:value-of select="rv_table_name"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div><!-- END TABELA--></form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150311"/>
</xsl:stylesheet>
