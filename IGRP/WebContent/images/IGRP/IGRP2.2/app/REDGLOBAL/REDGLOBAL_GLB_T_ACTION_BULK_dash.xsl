<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_GLB_T_ACTION_BULK_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
      <html>

        <!--HOME-HEADER-->
        <xsl:call-template name="home-header"/>

         <body>

          <!--HOME TOP-->
        <xsl:call-template name="home-top-main"/>

        <!--CENTER PANE-->
        <div class="general">
        <div id="content">


         <!--HOME SIDE
        <xsl:call-template name="home-side"/> -->

        <div class="ui-layout-center">

        <xsl:call-template name="dialog-modal"/>
        <!-- END HOME TOP --><!-- GLB_T_ACTION GESTAO ACCAO BULK LISTA -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><xsl:if test="rows/content/filter/label/env_fk"><label><span><xsl:value-of select="rows/content/filter/label/env_fk"/></span><select name="{rows/content/filter/list/env_fk/@name}" class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/env_fk" /></xsl:call-template><xsl:for-each select="rows/content/filter/list/env_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/filter/label/page"><label><span><xsl:value-of select="rows/content/filter/label/page"/></span><input type="text" name="{rows/content/filter/value/page/@name}" value="{rows/content/filter/value/page}"   maxlength="30"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/page" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/filter/label/action"><label><span><xsl:value-of select="rows/content/filter/label/action"/></span><input type="text" name="{rows/content/filter/value/action/@name}" value="{rows/content/filter/value/action}"   maxlength="30"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/action" /></xsl:call-template></input></label></xsl:if><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><xsl:call-template name="filter-az"><xsl:with-param name="name" select="rows/content/filter/value/page_descr/@name" /><xsl:with-param name="value" select="rows/content/filter/value/page_descr" /><xsl:with-param name="type" select="'filter_az'" /></xsl:call-template><!--INICIO DA TABELA  --><div class="table"><table class="sortable IGRP_table"><!--CABECALHO DA TABELA --><thead><tr><xsl:if test="rows/content/table/label/page"><th   align="left"><xsl:value-of select="rows/content/table/label/page"/></th></xsl:if><xsl:if test="rows/content/table/label/page_descr"><th   align="left"><xsl:value-of select="rows/content/table/label/page_descr"/></th></xsl:if><xsl:if test="rows/content/table/label/action_descr"><th   align="left"><xsl:value-of select="rows/content/table/label/action_descr"/></th></xsl:if><xsl:if test="rows/content/table/label/version"><th   align="center"><xsl:value-of select="rows/content/table/label/version"/></th></xsl:if><xsl:if test="rows/content/table/label/status"><th   align="center"><xsl:value-of select="rows/content/table/label/status"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row[not(@total='yes')]"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="page"><td class="table_row{$pos}" align="left"><xsl:value-of select="page" /></td></xsl:if><xsl:if test="page_descr"><td class="table_row{$pos}" align="left"><xsl:value-of select="page_descr" /></td></xsl:if><xsl:if test="action_descr"><td class="table_row{$pos}" align="left"><xsl:value-of select="action_descr" /></td></xsl:if><xsl:if test="version"><td class="table_row{$pos}" align="center"><xsl:value-of select="version" /></td></xsl:if><xsl:if test="status"><td class="table_row{$pos}" align="center"><xsl:value-of select="status" /></td></xsl:if></tr></xsl:for-each></tbody><!--RODAPE DA TABELA --><tfoot><tr><xsl:if test="rows/content/table/label/page"><td align="left"></td></xsl:if><xsl:if test="rows/content/table/label/page_descr"><td align="left"></td></xsl:if><xsl:if test="rows/content/table/label/action_descr"><td align="left"></td></xsl:if><xsl:if test="rows/content/table/label/version"><td align="center"></td></xsl:if><xsl:if test="rows/content/table/label/status"><td align="center"></td></xsl:if></tr></tfoot></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=2013072913"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=2013072913"/>

</xsl:stylesheet>