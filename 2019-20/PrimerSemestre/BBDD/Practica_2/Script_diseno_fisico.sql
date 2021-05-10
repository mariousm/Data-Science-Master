USE [DB_acabero]
GO


/****** DROP TABLE ******/
DROP TABLE [dbo].[STG_Denuncias_Infracciones]
GO
DROP TABLE [dbo].[STG_Evitar_Aglomeracion]
GO
DROP TABLE [dbo].[STG_Llamadas112]
GO
DROP TABLE [dbo].[STG_Movilidad]
GO
DROP TABLE [dbo].[STG_Poblacion]
GO

DROP TABLE [dbo].[FACT_Llamadas112]
GO
DROP TABLE [dbo].[FACT_Mediciones]
GO
DROP TABLE [dbo].[DIM_Fecha]
GO
DROP TABLE [dbo].[DIM_Ambito_Geografico]
GO
DROP TABLE [dbo].[DIM_Grupo_Edad]
GO
DROP TABLE [dbo].[DIM_Medicion]
GO
DROP TABLE [dbo].[DIM_Tipologia]
GO

/****** Object:  Table [dbo].[STG_Denuncias_Infracciones]    Script Date: 11/12/2020 10:34:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_Denuncias_Infracciones](
	[provincia] [varchar](100) NULL,
	[identificados_ertzaintza] [float] NULL,
	[detenidos_ertzaintza] [float] NULL,
	[denuncias_ertzaintza] [float] NULL,
	[vehic_intercept_ertzaintza] [float] NULL,
	[identificados_ppll] [float] NULL,
	[detenidos_ppll] [float] NULL,
	[denuncias_ppll] [float] NULL,
	[vehic_intercept_ppll] [float] NULL,
	[fecha_final] [datetime] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[STG_Evitar_Aglomeracion]    Script Date: 11/12/2020 10:35:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_Evitar_Aglomeracion](
	[provincia] [varchar](100) NULL,
	[comunidad_autonoma] [varchar](100) NULL,
	[grupo_edad] [varchar](7) NULL,
	[porc_poblacion] [float] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[STG_Llamadas112]    Script Date: 11/12/2020 10:36:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_Llamadas112](
	[anio] [int] NULL,
	[mes] [int] NULL,
	[provincia] [varchar](100) NULL,
	[comarca] [varchar](100) NULL,
	[municipio] [varchar](100) NULL,
	[tipo] [varchar](100) NULL,
	[llamadas] [int] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[STG_Movilidad]    Script Date: 11/12/2020 10:37:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_Movilidad](
	[zonas_movilidad] [varchar](27) NULL,
	[periodo] [datetime] NULL,
	[total] [decimal](5, 2) NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[STG_Poblacion]    Script Date: 11/12/2020 10:37:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_Poblacion](
	[provincia_codigo] [varchar](2) NULL,
	[provincia_nombre] [varchar](100) NULL,
	[poblacion] [bigint] NULL,
	[periodo] [varchar](25) NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DIM_Ambito_Geografico]    Script Date: 22/11/2020 17:02:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[DIM_Ambito_Geografico](
	[pk_ambito_geografico] [int] NOT NULL,
	[provincia_codigo] [varchar](2) NOT NULL,
	[provincia_nombre] [varchar](100) NOT NULL,
	[comunidad_autonoma] [varchar](100) NULL,
	[comarca] [varchar](100) NULL,
	[municipio] [varchar](100) NULL,
 CONSTRAINT [PK_DIM_Ambito_Geografico] PRIMARY KEY CLUSTERED
(
	[pk_ambito_geografico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DIM_Fecha]    Script Date: 22/11/2020 17:02:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_Fecha](
	[pk_fecha] [int] NOT NULL,
	[anyo] [int] NOT NULL,
	[mes] [int] NOT NULL,
	[dia] [int] NOT NULL,
	[fecha] [date] NOT NULL,
 CONSTRAINT [PK_DIM_Fecha] PRIMARY KEY CLUSTERED 
(
	[pk_fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DIM_Grupo_Edad]    Script Date: 22/11/2020 17:02:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_Grupo_Edad](
	[pk_grupo_edad] [int] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[intervalo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_DIM_Grupo_Edad] PRIMARY KEY CLUSTERED 
(
	[pk_grupo_edad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DIM_Medicion]    Script Date: 22/11/2020 17:02:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_Medicion](
	[pk_medicion] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[unidad_medida] [varchar](20) NOT NULL,
 CONSTRAINT [PK_DIM_Medicion] PRIMARY KEY CLUSTERED 
(
	[pk_medicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DIM_Tipologia]    Script Date: 22/11/2020 17:02:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_Tipologia](
	[pk_tipologia] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_DIM_Tipologia] PRIMARY KEY CLUSTERED 
(
	[pk_tipologia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FACT_Llamadas112]    Script Date: 22/11/2020 17:02:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FACT_Llamadas112](
	[pk_fk_fecha] [int] NOT NULL,
	[pk_fk_ambito_geografico] [int] NOT NULL,
	[pk_fk_tipologia] [int] NOT NULL,
	[llamadas] [int] NULL,
 CONSTRAINT [PK_FACT_Llamadas112] PRIMARY KEY CLUSTERED 
(
	[pk_fk_fecha] ASC,
	[pk_fk_ambito_geografico] ASC,
	[pk_fk_tipologia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FACT_Mediciones]    Script Date: 22/11/2020 17:02:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FACT_Mediciones](
	[pk_id] [int] NOT NULL,
	[fk_fecha] [int] NOT NULL,
	[fk_ambito_geografico] [int] NOT NULL,
	[fk_grupo_edad] [int] NOT NULL,
	[fk_medicion] [int] NOT NULL,
	[valor] [decimal](17, 2) NULL,
 CONSTRAINT [PK_FACT_Mediciones] PRIMARY KEY CLUSTERED 
(
	[pk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



ALTER TABLE [dbo].[FACT_Llamadas112]  WITH CHECK ADD  CONSTRAINT [FK_FACT_Llamadas112_DIM_Ambito_Geografico] FOREIGN KEY([pk_fk_ambito_geografico])
REFERENCES [dbo].[DIM_Ambito_Geografico] ([pk_ambito_geografico])
GO

ALTER TABLE [dbo].[FACT_Llamadas112] CHECK CONSTRAINT [FK_FACT_Llamadas112_DIM_Ambito_Geografico]
GO

ALTER TABLE [dbo].[FACT_Llamadas112]  WITH CHECK ADD  CONSTRAINT [FK_FACT_Llamadas112_DIM_Fecha] FOREIGN KEY([pk_fk_fecha])
REFERENCES [dbo].[DIM_Fecha] ([pk_fecha])
GO

ALTER TABLE [dbo].[FACT_Llamadas112] CHECK CONSTRAINT [FK_FACT_Llamadas112_DIM_Fecha]
GO

ALTER TABLE [dbo].[FACT_Llamadas112]  WITH CHECK ADD  CONSTRAINT [FK_FACT_Llamadas112_DIM_Tipologia] FOREIGN KEY([pk_fk_tipologia])
REFERENCES [dbo].[DIM_Tipologia] ([pk_tipologia])
GO

ALTER TABLE [dbo].[FACT_Llamadas112] CHECK CONSTRAINT [FK_FACT_Llamadas112_DIM_Tipologia]
GO

ALTER TABLE [dbo].[FACT_Mediciones]  WITH CHECK ADD  CONSTRAINT [FK_FACT_Mediciones_DIM_Ambito_Geografico] FOREIGN KEY([fk_ambito_geografico])
REFERENCES [dbo].[DIM_Ambito_Geografico] ([pk_ambito_geografico])
GO

ALTER TABLE [dbo].[FACT_Mediciones] CHECK CONSTRAINT [FK_FACT_Mediciones_DIM_Ambito_Geografico]
GO

ALTER TABLE [dbo].[FACT_Mediciones]  WITH CHECK ADD  CONSTRAINT [FK_FACT_Mediciones_DIM_Fecha] FOREIGN KEY([fk_fecha])
REFERENCES [dbo].[DIM_Fecha] ([pk_fecha])
GO

ALTER TABLE [dbo].[FACT_Mediciones] CHECK CONSTRAINT [FK_FACT_Mediciones_DIM_Fecha]
GO

ALTER TABLE [dbo].[FACT_Mediciones]  WITH CHECK ADD  CONSTRAINT [FK_FACT_Mediciones_DIM_Grupo_Edad] FOREIGN KEY([fk_grupo_edad])
REFERENCES [dbo].[DIM_Grupo_Edad] ([pk_grupo_edad])
GO

ALTER TABLE [dbo].[FACT_Mediciones] CHECK CONSTRAINT [FK_FACT_Mediciones_DIM_Grupo_Edad]
GO

ALTER TABLE [dbo].[FACT_Mediciones]  WITH CHECK ADD  CONSTRAINT [FK_FACT_Mediciones_DIM_Medicion] FOREIGN KEY([fk_medicion])
REFERENCES [dbo].[DIM_Medicion] ([pk_medicion])
GO

ALTER TABLE [dbo].[FACT_Mediciones] CHECK CONSTRAINT [FK_FACT_Mediciones_DIM_Medicion]
GO


