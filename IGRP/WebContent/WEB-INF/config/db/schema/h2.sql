	 --
	 --	DDL Igrp for H2 DataBase (Begin) 
	 --
	
	CREATE TABLE IF NOT EXISTS `glb_t_user` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `NAME` varchar(100) NOT NULL,
	  `EMAIL` varchar(80) NOT NULL,
	  `PASS_HASH` varchar(65) NOT NULL,
	  `USERPROFILE` varchar(20) NOT NULL DEFAULT 'USER',
	  `VALID_UNTIL` date DEFAULT NULL,
	  `REMARKS` varchar(400) DEFAULT NULL,
	  `ACTIVATION_KEY` varchar(11) DEFAULT NULL,
	  `USER_NAME` varchar(80) NOT NULL,
	  `PHOTO_ID` int(11) DEFAULT NULL,
	  `SIGNATURE_ID` int(11) DEFAULT NULL,
	  `MOBILE` varchar(20) DEFAULT NULL,
	  `PHONE` varchar(20) DEFAULT NULL,
	  `PASSWORD_RESET_TOKEN` varchar(255) DEFAULT NULL,
	  `AUTH_KEY` varchar(255) NOT NULL,
	  `STATUS` smallint(6) NOT NULL DEFAULT '10',
	  `CREATED_AT` bigint(11) NOT NULL,
	  `UPDATED_AT` bigint(11) NOT NULL,
	  
	  PRIMARY KEY (`ID`),
	  UNIQUE KEY `EMAIL` (`EMAIL`),
	  UNIQUE KEY `USER_NAME` (`USER_NAME`)
          
	    
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
	CREATE TABLE IF NOT EXISTS `glb_t_env` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `NAME` varchar(100) NOT NULL,
	  `DAD` varchar(30) NOT NULL,
	  `IMG_SRC` varchar(100) DEFAULT 'app_casacidadao.png',
	  `DESCRIPTION` varchar(500) DEFAULT NULL,
	  `ACTION_FK` int(11) DEFAULT NULL,
	  `FLG_OLD` smallint(1) DEFAULT '0',
	  `LINK_MENU` varchar(2000) DEFAULT NULL,
	  `LINK_CENTER` varchar(2000) DEFAULT NULL,
	  `APACHE_DAD` varchar(30) DEFAULT NULL,
	  `TEMPLATES` varchar(30) DEFAULT NULL,
	  `HOST` varchar(30) DEFAULT NULL,
	  `FLG_EXTERNAL` smallint(1) DEFAULT '0',
	  `STATUS` smallint(6) NOT NULL DEFAULT '1',
		PRIMARY KEY (`ID`),
		UNIQUE KEY `DAD` (`DAD`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
	CREATE TABLE IF NOT EXISTS `glb_t_action` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `ENV_FK` int(11) NOT NULL,
	  `PAGE` varchar(100) NOT NULL,
	  `ACTION` varchar(100) NOT NULL,
	  `TABLE_NAME` varchar(80) DEFAULT NULL,
	  `XSL_SRC` varchar(1000) DEFAULT NULL,
	  `IMG_SRC` varchar(100) DEFAULT NULL,
	  `PAGE_TYPE` varchar(10) DEFAULT NULL,
	  `PAGE_DESCR` varchar(100) DEFAULT NULL,
	  `ACTION_DESCR` varchar(100) DEFAULT NULL,
	  `FLG_MENU` smallint(6) DEFAULT '0',
	  `FLG_TRANSACTION` smallint(6) DEFAULT '0',
	  `SELF_ID` int(11) DEFAULT NULL,
	  `SELF_FW_ID` int(11) DEFAULT NULL,
	  `VERSION` varchar(3) DEFAULT '2.3',
	  `DB_CONNECTION` varchar(100) DEFAULT NULL,
	  `FLG_OFFLINE` smallint(6) DEFAULT '0',
	  `FLG_INTERNET` smallint(6) DEFAULT '0',
	  `STATUS` smallint(6) DEFAULT '1',
	  
	   PRIMARY KEY (`ID`),
		UNIQUE KEY `GLB_T_ACTION_UK` (`ENV_FK`,`PAGE`,`ACTION`),
		CONSTRAINT `GLB_T_ACTION_ENV_FK` FOREIGN KEY (`ENV_FK`) REFERENCES `glb_t_env` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
	  
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	CREATE TABLE IF NOT EXISTS `glb_t_config` (
	  `NAME` varchar(30) DEFAULT NULL,
	  `VALUE` varchar(4000) NOT NULL,
		UNIQUE KEY `NAME` (`NAME`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	CREATE TABLE IF NOT EXISTS `glb_t_config_env` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `PORT` int(11) DEFAULT NULL,
	  `TYPE_DB` varchar(8) NOT NULL,
	  `HOST` varchar(100) NOT NULL,
	  `NAME_DB` varchar(100) NOT NULL,
	  `USERNAME` varchar(250) NOT NULL,
	  `PASSWORD` varchar(1000) NOT NULL,
	  `CHARSET` varchar(20) NOT NULL,
	  `NAME` varchar(20) NOT NULL,
	  `ENV_FK` int(11) NOT NULL,
	  PRIMARY KEY (`ID`),
	  CONSTRAINT `CONFIG_ENV_ENV_FK` FOREIGN KEY (`ENV_FK`) REFERENCES `glb_t_env` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	CREATE TABLE IF NOT EXISTS `glb_t_organization` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `CODE` varchar(50) NOT NULL,
	  `NAME` varchar(1000) NOT NULL,
	  `SIGOF_FK` int(11) DEFAULT NULL,
	  `ENV_FK` int(11) NOT NULL,
	  `STATUS` smallint(6) NOT NULL DEFAULT '1',
	  `USER_CREATE_FK` int(11) DEFAULT NULL,
	  `SELF_FK` int(11) DEFAULT NULL,
	   PRIMARY KEY (`ID`),
		UNIQUE KEY `CODE` (`CODE`),
		UNIQUE KEY `GLB_T_ORGANIZATION_UK` (`CODE`,`ENV_FK`),
		CONSTRAINT `GLB_T_ORGANIZATION_ENV_FK` FOREIGN KEY (`ENV_FK`) REFERENCES `glb_t_env` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT `GLB_T_ORGANIZATION_SELF_FK` FOREIGN KEY (`SELF_FK`) REFERENCES `glb_t_organization` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT `GLB_T_ORG_USER_CREATE_FK` FOREIGN KEY (`USER_CREATE_FK`) REFERENCES `glb_t_user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	CREATE TABLE IF NOT EXISTS `glb_t_menu` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `DESCR` varchar(100) NOT NULL,
	  `LINK` varchar(200) DEFAULT NULL,
	  `SELF_ID` int(11) DEFAULT NULL,
	  `ENV_FK` int(11) NOT NULL,
	  `IMG_SRC` varchar(200) DEFAULT NULL,
	  `AREA` varchar(20) DEFAULT NULL,
	  `ACTION_FK` int(11) DEFAULT NULL,
	  `ORDERBY` int(11) DEFAULT NULL,
	  `STATUS` smallint(6) DEFAULT '1',
	  `CODE` varchar(20) DEFAULT NULL,
	  `FLG_BASE` smallint(6) DEFAULT '0',
	  `TARGET` varchar(20) DEFAULT '_self',
		PRIMARY KEY (`ID`),
		CONSTRAINT `GLB_T_MENU_ACTION_FK` FOREIGN KEY (`ACTION_FK`) REFERENCES `glb_t_action` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT `GLB_T_MENU_ENV_FK` FOREIGN KEY (`ENV_FK`) REFERENCES `glb_t_env` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT `GLB_T_MENU_SELF_FK` FOREIGN KEY (`SELF_ID`) REFERENCES `glb_t_menu` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
	
	CREATE TABLE IF NOT EXISTS `glb_t_profile_type` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `DESCR` varchar(50) NOT NULL,
	  `CODE` varchar(20) DEFAULT NULL,
	  `ENV_FK` int(11) DEFAULT NULL,
	  `SELF_FK` int(11) DEFAULT NULL,
	  `ORG_FK` int(11) DEFAULT NULL,
	  `STATUS` smallint(6) DEFAULT '1',
	  
	   PRIMARY KEY (`ID`),
	   UNIQUE KEY `GLB_T_PROFILE_TYPE_UK` (`CODE`,`ENV_FK`,`ORG_FK`),
	   CONSTRAINT `GLB_T_PROFILE_TYPE_ENV_FK` FOREIGN KEY (`ENV_FK`) REFERENCES `glb_t_env` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT `GLB_T_PROFILE_TYPE_ORG_FK` FOREIGN KEY (`ORG_FK`) REFERENCES `glb_t_organization` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT `GLB_T_PROF_TYPE_SELF_FK` FOREIGN KEY (`SELF_FK`) REFERENCES `glb_t_profile_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	
	CREATE TABLE IF NOT EXISTS `glb_t_transaction` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `CODE` varchar(150) NOT NULL,
	  `DESCR` varchar(250) DEFAULT NULL,
	  `ENV_FK` int(11) DEFAULT NULL,
	  `STATUS` smallint(6) NOT NULL DEFAULT '1',

	  PRIMARY KEY (`ID`),
	  UNIQUE KEY `GLB_T_TRANSACTION_UK_CODE` (`CODE`),
	  UNIQUE KEY `GLB_T_TRANSACTION_UK_ENV` (`ENV_FK`,`CODE`),
      CONSTRAINT `GLB_T_TRANSACTION_ENV_FK` FOREIGN KEY (`ENV_FK`) REFERENCES `glb_t_env` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
	CREATE TABLE IF NOT EXISTS `glb_t_profile` (
	  `PROF_TYPE_FK` int(11) NOT NULL,
	  `USER_FK` int(11) NOT NULL,
	  `TYPE` varchar(20) NOT NULL,
	  `TYPE_FK` int(11) NOT NULL,
	  `ORG_FK` int(11) NOT NULL,

	 PRIMARY KEY (`PROF_TYPE_FK`,`USER_FK`,`TYPE`,`TYPE_FK`,`ORG_FK`),
	 CONSTRAINT `GLB_T_PROFILE_ORG_FK` FOREIGN KEY (`ORG_FK`) REFERENCES `glb_t_organization` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
	 CONSTRAINT `GLB_T_PROFILE_TYPE_FK` FOREIGN KEY (`PROF_TYPE_FK`) REFERENCES `glb_t_profile_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
	 CONSTRAINT `GLB_T_PROFILE_USER_FK` FOREIGN KEY (`USER_FK`) REFERENCES `glb_t_user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
	--
	--	DDL Igrp for H2 DataBase (End)
	--
	
	
	-------------------------------- Base dados do demo Marcacao de consultas --------------------------------------	 
-- --------------------------------------------------------
--
-- Estrutura da tabela `tbl_medico`
--

CREATE TABLE  IF NOT EXISTS `tbl_medico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `morada` varchar(100) NOT NULL,
  `num_consulta_dia` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_utente`
--

CREATE TABLE  IF NOT EXISTS `tbl_utente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `morada` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `sexo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Estrutura da tabela `tbl_marcao_consulta`
--

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_marcao_consulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_medico` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `data_consulta` datetime NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `tbl_medico_fk` FOREIGN KEY (`id_medico`) REFERENCES `tbl_medico` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_utente_fk` FOREIGN KEY (`id_utente`) REFERENCES `tbl_utente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	
[SPLIT]
	
	--
	--	DML (insert) Igrp for H2 DataBase (Begin)
	--
	
	INSERT INTO `glb_t_env` (`ID`, `NAME`, `DAD`, `IMG_SRC`, `DESCRIPTION`, `ACTION_FK`, `FLG_OLD`, `LINK_MENU`, `LINK_CENTER`, `APACHE_DAD`, `TEMPLATES`, `HOST`, `FLG_EXTERNAL`, `STATUS`) 
	VALUES (1, 'igrp', 'igrp', 'app_casacidadao.png', 'IGRP Open Source', 1, 0, NULL, NULL, NULL, NULL, '', NULL, 1);
	
	INSERT INTO `glb_t_action` (`ID`,`ENV_FK`, `PAGE`, `ACTION`,  `XSL_SRC`) 
	VALUES
		(1,1, 'ListaPage', 'index', 'images/IGRP/IGRP2.3/app/igrp/listapage/ListaPage.xsl'),
		(2,1, 'Env', 'index', 'images/IGRP/IGRP2.3/app/igrp/env/Env.xsl'),
		(3,1, 'ListaEnv', 'index', 'images/IGRP/IGRP2.3/app/igrp/listaenv/ListaEnv.xsl'),
		(4,1, 'Dominio', 'index', 'images/IGRP/IGRP2.3/app/igrp/dominio/Dominio.xsl'),
		(5,1, 'NovoDominio', 'index', 'images/IGRP/IGRP2.3/app/igrp/novodominio/NovoDominio.xsl'),
		(6,1, 'PesquisarOrganica', 'index', 'images/IGRP/IGRP2.3/app/igrp/pesquisarorganica/PesquisarOrganica.xsl'),
		(7,1, 'NovaOrganica', 'index', 'images/IGRP/IGRP2.3/app/igrp/novaorganica/NovaOrganica.xsl'),
		(8,1, 'NovoMenu', 'index', 'images/IGRP/IGRP2.3/app/igrp/novomenu/NovoMenu.xsl'),
		(9,1, 'PesquisarMenu', 'index', 'images/IGRP/IGRP2.3/app/igrp/pesquisarmenu/PesquisarMenu.xsl'),
		(10,1, 'NovoPerfil', 'index', 'images/IGRP/IGRP2.3/app/igrp/novoperfil/NovoPerfil.xsl'),
		(11,1, 'PesquisarPerfil', 'index', 'images/IGRP/IGRP2.3/app/igrp/pesquisarperfil/PesquisarPerfil.xsl'),
		(12,1, 'PesquisarUtilizador', 'index', 'images/IGRP/IGRP2.3/app/igrp/pesquisarutilizador/PesquisarUtilizador.xsl'),
		(13,1, 'NovoUtilizador', 'index', 'images/IGRP/IGRP2.3/app/igrp/novoutilizador/NovoUtilizador.xsl'),
		(14,1, 'Settings', 'index', 'images/IGRP/IGRP2.3/app/igrp/settings/Settings.xsl'),
		(15,1, 'RegistarUtilizador', 'index', 'images/IGRP/IGRP2.3/app/igrp/registarutilizador/RegistarUtilizador.xsl'),
		(16,1, 'Transaccao', 'index', 'images/IGRP/IGRP2.3/app/igrp/transaccao/Transaccao.xsl'),
		(17,1, 'Page', 'index', 'images/IGRP/IGRP2.3/app/igrp/page/Page.xsl'),
		(18,1, 'MenuOrganica','index','images/IGRP/IGRP2.3/app/igrp/menuorganica/MenuOrganica.xsl'),
		(19,1, 'ErrorPage','index','images/IGRP/IGRP2.3/app/igrp/errorpage/ErrorPage.xsl'),
		(20,1, 'TransacaoOrganica','index','images/IGRP/IGRP2.3/app/igrp/transacaoorganica/TransacaoOrganica.xsl'),
		(21,1, 'EditarTransacao','index','images/IGRP/IGRP2.3/app/igrp/editartransacao/EditarTransacao.xsl');
	
	INSERT INTO `glb_t_user` (`ID`, `NAME`, `EMAIL`, `PASS_HASH`, `USERPROFILE`, `VALID_UNTIL`, `REMARKS`, `ACTIVATION_KEY`, `USER_NAME`, `PHOTO_ID`, `SIGNATURE_ID`, `MOBILE`, `PHONE`, `PASSWORD_RESET_TOKEN`, `AUTH_KEY`, `STATUS`, `CREATED_AT`, `UPDATED_AT`) 
	VALUES (1, 'Admin', 'admin@gmail.com', 'demo', 'USER', NULL, NULL, '123456789', 'demo', NULL, NULL, NULL, NULL, NULL, 'SRRKZ1a2n77nDcdLmXBJCt3HQWoRKozc', 1, 2017, 2017);

	INSERT INTO `glb_t_organization` (`ID`, `CODE`, `NAME`, `SIGOF_FK`, `ENV_FK`, `STATUS`, `USER_CREATE_FK`, `SELF_FK`) 
	VALUES (1, 'ADMS', 'Administrador', NULL, 1, 1, 1, NULL);

	INSERT INTO `glb_t_profile_type` (`ID`, `DESCR`, `CODE`, `ENV_FK`, `SELF_FK`, `ORG_FK`, `STATUS`) 
	VALUES (1, 'Administrador', 'Admin', 1, NULL, 1, 1);
	
	INSERT INTO `glb_t_menu` (`ID`, `DESCR`,`ACTION_FK`, `SELF_ID`, `LINK`, `ENV_FK`, `IMG_SRC`, `AREA`, `ORDERBY`, `STATUS`, `CODE`, `FLG_BASE`, `TARGET`) VALUES
	(1, 'Gest�o de Aplica��o', NULL, NULL,NULL, 1, NULL, NULL, NULL, 1, NULL, 1, '_self'),
	(2, 'Detalhes de Aplica��o', 3, 1,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self'),
	(3, 'Gest�o de Pagina', 1, 1,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self'),
	(4, 'Gest�o de Menu', 9, 1,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self'),
	(5, 'Par�metros Gerais', NULL, NULL,NULL, 1, NULL, NULL, NULL, 1, NULL, 1, '_self'),
	(6, 'Gest�o de Organica', 6, 5,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self'),
	(7, 'Gest�o de Perfil', 11, 5,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self'),
	(8, 'Gest�o de Utilizador', 12, 5,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self'),
	(9, 'Settings', 14, 5,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self'),	
	(10, 'Gest�o de Transa��o', 16, 1,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self');
	
	INSERT INTO `glb_t_profile` (`PROF_TYPE_FK`, `USER_FK`, `TYPE`, `TYPE_FK`, `ORG_FK`) 
	VALUES (1, 1, 'ENV', 1, 1),
		   (1, 1, 'PROF', 1, 1), 
		   (1, 1, 'MEN', 2, 1), 
		   (1, 1, 'MEN', 3, 1), 
		   (1, 1, 'MEN', 4, 1), 
		   (1, 1, 'MEN', 6, 1), 
		   (1, 1, 'MEN', 7, 1), 
		   (1, 1, 'MEN', 8, 1), 
		   (1, 1, 'MEN', 9, 1), 
		   (1, 1, 'MEN', 10, 1),
		   (1, 1, 'MEN_PROF', 2, 1), 
		   (1, 1, 'MEN_PROF', 3, 1), 
		   (1, 1, 'MEN_PROF', 4, 1), 
		   (1, 1, 'MEN_PROF', 6, 1), 
		   (1, 1, 'MEN_PROF', 7, 1), 
		   (1, 1, 'MEN_PROF', 8, 1), 
		   (1, 1, 'MEN_PROF', 9, 1), 
		   (1, 1, 'MEN_PROF', 10, 1); 
	
		   

INSERT INTO `glb_t_env` (`ID`, `NAME`, `DAD`, `IMG_SRC`, `DESCRIPTION`, `ACTION_FK`, `FLG_OLD`, `LINK_MENU`, `LINK_CENTER`, `APACHE_DAD`, `TEMPLATES`, `HOST`, `FLG_EXTERNAL`, `STATUS`)
VALUES (2, 'Marcacao de Consulta', 'marcao_consulta', '', 'App para marcacao de consulta', 0, 0, '', '', '', '', '', 0, 1);

INSERT INTO `glb_t_action` (`ID`,`ENV_FK`, `PAGE`, `ACTION`,  `XSL_SRC`,`PAGE_DESCR`,`ACTION_DESCR`) 
	VALUES
(22, 2, 'ListaMedico', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/listamedico/ListaMedico.xsl','Lista de Medicos', 'Lista de Medicos'),
(23, 2, 'RegistarMedico', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/registarmedico/RegistarMedico.xsl', 'Registar Medico', 'Registar Medico'),
(24, 2, 'MarcarConsulta', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/marcarconsulta/MarcarConsulta.xsl','Marcar Consulta', 'Marcar Consulta'),
(25, 2, 'RegistarUtente', 'index',  'images/IGRP/IGRP2.3/app/marcao_consulta/registarutente/RegistarUtente.xsl','Registar Utente', 'Registar Utente'),
(26, 2, 'ListarUtente', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/listarutente/ListarUtente.xsl', 'Listar Utente', 'Listar Utente'),
(27, 2, 'ConsultaPendente', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/consultapendente/ConsultaPendente.xsl', 'Consultas Pendentes', 'Consultas Pendentes'),
(28, 2, 'DashBoard', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/dashboard/DashBoard.xsl', 'Dash Board', 'Dash Board');

INSERT INTO `glb_t_menu` (`ID`, `DESCR`,`ACTION_FK`, `SELF_ID`, `LINK`, `ENV_FK`, `IMG_SRC`, `AREA`, `ORDERBY`, `STATUS`, `CODE`, `FLG_BASE`, `TARGET`) VALUES
(11, 'Gestao de Utente',NULL,NULL,'',2, '','', 1, 1, '', 1, ''),
(12, 'Gestao de Medico',NULL,NULL,'',2, '','', 1, 1, '', 1, ''),
(13, 'Gestao de Consultas',NULL,NULL,'',2, '', '', 1, 1, '', 1, ''),
(14, 'Registar Utente', 25,11, '', 2,'','', 0, 1, '', 0, '_self'),
(15, 'Listar Utentes', 26, 11, '', 2,'','', 0, 1, '', 0, '_self'),
(16, 'Registar Medico', 23,12, '', 2,'','', 0, 1, '', 0, '_self'),
(17, 'Listar Medicos', 22, 12, '', 2,'','', 0, 1, '', 0, '_self'),
(18, 'Marcar Consultas',24,13, '', 2,'','', 0, 1, '', 0, '_self'),
(19, 'Consultas Pendentes',27,13, '', 2,'','', 0, 1, '', 0, '_self'),
(20, 'Dash Board',28,13, '', 2,'','', 0, 1, '', 0, '_self');
		   


-- ------------------------------------------ Config demo app (App marcacao consulta) --------------------------------
INSERT INTO `glb_t_organization` (`ID`, `CODE`, `NAME`, `SIGOF_FK`, `ENV_FK`, `STATUS`, `USER_CREATE_FK`, `SELF_FK`) 
VALUES(2, 'org-m.consulta', 'Tec. Marcacao Consulta',NULL, 2, 1,1, NULL);


INSERT INTO `glb_t_profile_type` (`ID`, `DESCR`, `CODE`, `ENV_FK`, `SELF_FK`, `ORG_FK`, `STATUS`) 
	VALUES 
(2, 'Tec. Marcacao Consulta', 'Perf-m.consulta', 2,NULL, 2, 1);

INSERT INTO `glb_t_profile` (`PROF_TYPE_FK`, `USER_FK`, `TYPE`, `TYPE_FK`, `ORG_FK`) 
	VALUES 
(1, 1, 'MEN', 9, 2),
(1, 1, 'MEN', 11, 2),
(1, 1, 'MEN', 12, 2),
(1, 1, 'MEN', 13, 2),
(1, 1, 'MEN', 14, 2),
(1, 1, 'MEN', 15, 2),
(1, 1, 'MEN', 16, 2),
(1, 1, 'MEN', 17, 2),
(1, 1, 'MEN', 18, 2),
(1, 1, 'MEN', 19, 2),
(1, 1, 'MEN', 20, 2),
(2, 1, 'MEN_PROF', 9, 2),
(2, 1, 'MEN_PROF', 11, 2),
(2, 1, 'MEN_PROF', 12, 2),
(2, 1, 'MEN_PROF', 13, 2),
(2, 1, 'MEN_PROF', 14, 2),
(2, 1, 'MEN_PROF', 15, 2),
(2, 1, 'MEN_PROF', 16, 2),
(2, 1, 'MEN_PROF', 17, 2),
(2, 1, 'MEN_PROF', 18, 2),
(2, 1, 'MEN_PROF', 19, 2),
(2, 1, 'MEN_PROF', 20, 2),
(2, 1, 'ENV', 2, 2),
(2, 1, 'PROF', 2, 2);



