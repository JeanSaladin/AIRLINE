USE [AIRLINE]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 11/02/2013 10:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reservations](
	[reservation_code] [varchar](20) NOT NULL,
	[passenger_id] [int] NOT NULL,
	[flight_id] [varchar](20) NOT NULL,
	[reservation_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reservation_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Plane]    Script Date: 11/02/2013 10:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Plane](
	[plane_id] [int] NOT NULL,
	[plane_name] [varchar](20) NOT NULL,
	[model] [varchar](30) NOT NULL,
	[hours_day] [int] NOT NULL,
	[seats] [int] NOT NULL,
	[first_class] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[plane_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PassengerType]    Script Date: 11/02/2013 10:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PassengerType](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[id]    Script Date: 11/02/2013 10:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[id](
	[plane_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightsStatus]    Script Date: 11/02/2013 10:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FlightsStatus](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Continent]    Script Date: 11/02/2013 10:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Continent](
	[continent_id] [int] NOT NULL,
	[description] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[continent_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeatsStatus]    Script Date: 11/02/2013 10:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeatsStatus](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 11/02/2013 10:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seats](
	[seat_id] [varchar](5) NULL,
	[plane_id] [int] NOT NULL,
	[status_id] [int] NOT NULL,
	[passenger_id] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Sp_Plane_Select]    Script Date: 11/02/2013 10:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Plane_Select]
as
begin
SELECT TOP 1000 [plane_id]
      ,[plane_name]
      ,[model]
      ,[hours_day]
      ,[seats]
      ,[first_class]
  FROM [AIRLINE].[dbo].[Plane]
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetPlane_Select]    Script Date: 11/02/2013 10:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_GetPlane_Select]
as
begin
select plane_id,
	  (plane_name + ' ' + model) as name   from Plane
end
GO
/****** Object:  Table [dbo].[Flights]    Script Date: 11/02/2013 10:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Flights](
	[flight_id] [int] IDENTITY(180,21) NOT NULL,
	[plane_id] [int] NOT NULL,
	[drt_airport] [varchar](60) NOT NULL,
	[drt_date] [datetime] NOT NULL,
	[arv_airport] [varchar](60) NOT NULL,
	[arv_date] [datetime] NOT NULL,
	[price] [money] NOT NULL,
	[status_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[flight_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 11/02/2013 10:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[country_id] [varchar](8) NOT NULL,
	[description] [varchar](20) NOT NULL,
	[continent_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 11/02/2013 10:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Passenger](
	[passenger_id] [int] IDENTITY(1,2) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[last_name] [varchar](20) NOT NULL,
	[birthdate] [datetime] NOT NULL,
	[country] [varchar](20) NULL,
	[adress] [varchar](50) NULL,
	[email] [varchar](40) NULL,
	[phone] [varchar](20) NULL,
	[type_id] [int] NOT NULL,
	[flight_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[passenger_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[City]    Script Date: 11/02/2013 10:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[city_id] [int] NOT NULL,
	[description] [varchar](20) NOT NULL,
	[country_id] [varchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Sp_Airport_Select]    Script Date: 11/02/2013 10:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Airport_Select]
as
begin

SELECT 
		Ci.description + ', ' +
		case(C.description)
			 when 'Republica Dominicana' then 'RD'
			 when 'Estados Unidos' then 'E.E.U.U'
			 when 'Costa de Marfil' then 'C. de Marfil'
			 when 'Corea del Norte' then 'KDD'
			 else C.description
	    end  Airport 
FROM 
		Country C
			LEFT OUTER JOIN City Ci ON C.country_id = Ci.country_id
order by
		C.description
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Agency_Select]    Script Date: 11/02/2013 10:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Agency_Select]
as
begin

SELECT C.continent_id AS continent_id,
		C.description Continent,
		Co.country_id country_id,
		Co.description Country,
		Ci.city_id city_id,
		Ci.description City
FROM 
		Continent C 
			LEFT OUTER JOIN Country Co ON C.continent_id = Co.continent_id
			LEFT OUTER JOIN City Ci ON Co.country_id = Ci.country_id
order by
		C.continent_id
end
GO
/****** Object:  ForeignKey [FK_City_id]    Script Date: 11/02/2013 10:15:28 ******/
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_id] FOREIGN KEY([country_id])
REFERENCES [dbo].[Country] ([country_id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_id]
GO
/****** Object:  ForeignKey [FK_Country_id]    Script Date: 11/02/2013 10:15:28 ******/
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_id] FOREIGN KEY([continent_id])
REFERENCES [dbo].[Continent] ([continent_id])
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [FK_Country_id]
GO
/****** Object:  ForeignKey [FK_Flight_plane]    Script Date: 11/02/2013 10:15:28 ******/
ALTER TABLE [dbo].[Flights]  WITH CHECK ADD  CONSTRAINT [FK_Flight_plane] FOREIGN KEY([plane_id])
REFERENCES [dbo].[Plane] ([plane_id])
GO
ALTER TABLE [dbo].[Flights] CHECK CONSTRAINT [FK_Flight_plane]
GO
/****** Object:  ForeignKey [FK_Flight_status]    Script Date: 11/02/2013 10:15:28 ******/
ALTER TABLE [dbo].[Flights]  WITH CHECK ADD  CONSTRAINT [FK_Flight_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[FlightsStatus] ([status_id])
GO
ALTER TABLE [dbo].[Flights] CHECK CONSTRAINT [FK_Flight_status]
GO
/****** Object:  ForeignKey [FK_Passenger_id]    Script Date: 11/02/2013 10:15:28 ******/
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_id] FOREIGN KEY([flight_id])
REFERENCES [dbo].[Flights] ([flight_id])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_id]
GO
/****** Object:  ForeignKey [FK_Passenger_type]    Script Date: 11/02/2013 10:15:28 ******/
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_type] FOREIGN KEY([type_id])
REFERENCES [dbo].[PassengerType] ([status_id])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_type]
GO
/****** Object:  ForeignKey [FK_Seats_id]    Script Date: 11/02/2013 10:15:28 ******/
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_id] FOREIGN KEY([plane_id])
REFERENCES [dbo].[Plane] ([plane_id])
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_id]
GO
/****** Object:  ForeignKey [FK_Seats_status]    Script Date: 11/02/2013 10:15:28 ******/
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[SeatsStatus] ([status_id])
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_status]
GO
