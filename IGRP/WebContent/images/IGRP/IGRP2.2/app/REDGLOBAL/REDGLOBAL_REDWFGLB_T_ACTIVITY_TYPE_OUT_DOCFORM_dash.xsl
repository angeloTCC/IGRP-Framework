<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_REDWFGLB_T_ACTIVITY_TYPE_OUT_DOCFORM_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- REDWF.GLB_T_ACTIVITY_TYPE GESTAO ETAPA OUT_DOCFORM DOCUMENTO OUTPUT FORM -->

		  <!-- START YOUR CODE HERE -->

			<!--PAGE TITLE-->
	  <div class="box-content">

		  <xsl:call-template name="page-title">
			 <xsl:with-param name="title" select="rows/content/title" />
		  </xsl:call-template>

		  <!--NOTIFICATION MESSAGES-->
		  <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
			 <xsl:with-param name="class" select="'notification'"/>
		  </xsl:apply-templates>


		  <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data"><!--FORMULARIO --><!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span>(*) <xsl:value-of select="rows/content/form/label/acti_tp_fk"/></span><select name="{rows/content/form/list/acti_tp_fk/@name}" class="required"><xsl:for-each select="rows/content/form/list/acti_tp_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span>(*) <xsl:value-of select="rows/content/form/label/doc_tp_fk"/></span><select name="{rows/content/form/list/doc_tp_fk/@name}" class="required"><xsl:for-each select="rows/content/form/list/doc_tp_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span>(*) <xsl:value-of select="rows/content/form/label/direction"/></span><input type="text" name="{rows/content/form/value/direction/@name}" value="{rows/content/form/value/direction}"  class="required" maxlength="3" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/valid_from"/></span><input type="date" name="{rows/content/form/value/valid_from/@name}" value="{rows/content/form/value/valid_from}" class="IGRP_datepicker required date" /></label><label><span><xsl:value-of select="rows/content/form/label/valid_to"/></span><input type="date" name="{rows/content/form/value/valid_to/@name}" value="{rows/content/form/value/valid_to}" class="IGRP_datepicker date" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/status"/></span><input type="checkbox" name="{rows/content/form/value/status/@name}" value="1"  class="required"><xsl:if test="rows/content/form/value/status='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input></label><label><span><xsl:value-of select="rows/content/form/label/send_type"/></span><input type="text" name="{rows/content/form/value/send_type/@name}" value="{rows/content/form/value/send_type}"  class="" maxlength="10" /></label><label><span><xsl:value-of select="rows/content/form/label/content"/></span><textarea name="{rows/content/form/value/content/@name}"  class=""><xsl:value-of select="rows/content/form/value/content"/></textarea></label><label><span><xsl:value-of select="rows/content/form/label/gener_flag"/></span><input type="text" name="{rows/content/form/value/gener_flag/@name}" value="{rows/content/form/value/gener_flag}"  class="" maxlength="20" /></label></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v="/>



</xsl:stylesheet>