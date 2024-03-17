USE COFFEE_DWH
-- DIMENSIONAL TABLES 


CREATE TABLE [dbo].[PRODUCT_DIM]
(
    [PRODUCT_SK] [int] identity (1,1) PRIMARY KEY ,
	[PRODUCT_ID_BK] [int] NOT NULL,
	[PRODUCT_NAME] [varchar](100) NULL,
	[DESCRIPTION] [varchar](250) NULL,
	[PRODUCT_PRICE] [FLOAT] NULL,

	[PRODUCT_TYPE_ID] [INT] NULL,
	[PRODUCT_TYPE] [varchar](50) NULL,
	[PRODUCT_CATEGORY] [varchar](50) NULL,
	

	[starting_date] [datetime] not null default (getdate()),
	[ending_date] [datetime] null ,
	[is_current] [int] not null default (1),
	[Source_Code] [int] NOT NULL )



CREATE TABLE [dbo].[CUSTOMER_DIM]
(
    [CUSTOMER_SK] [int] identity (1,1) PRIMARY KEY ,
	[CUSTOMER_ID_BK] [int] NOT NULL,
	[CUSTOMER_NAME] [varchar](50) NULL,
	[CUSTOMER_EMAIL] [varchar](50) NULL,

	[CUST_REGDATE] [date] NULL,
	[CARD_NUMBER] [varchar](15) NULL,
	[CUST_BIRTHDATE] [date] NULL,
	[CUST_GENDER] [varchar](1) NULL,
 
	[starting_date] [datetime] not null default (getdate()),
	[ending_date] [datetime] null ,
	[is_current] [int] not null default (1),
	[Source_Code] [int] NOT NULL )




CREATE TABLE [dbo].[STAFF_DIM]
(
    [STAFF_SK] [int] identity (1,1) PRIMARY KEY ,
	[STAFF_ID_BK] [int] NOT NULL unique ,
	[ST_FIRST_NAME] [varchar](50) NULL,
	[ST_LAST_NAME] [varchar](50) NULL,
	[ST_POSITION] [varchar](50) NULL,
	[ST_STARTDATE] [date] NULL,
	[ST_LOCATION] [varchar](5) NULL,

	[starting_date] [datetime] not null default (getdate()),
	[ending_date] [datetime] null ,
	[is_current] [int] not null default (1),
	[Source_Code] [int] NOT NULL )




CREATE TABLE [dbo].[SALES_OUTLET_DIM]
(
    [SALES_OUTLET_SK] [int] identity (1,1) PRIMARY KEY ,
	[SALES_OUTLET_ID_BK] [int] NOT NULL unique ,
	[SALES_OUTLET_TYPE] [varchar](20) NULL,
	[SALES_ADDRESS] [varchar](50) NULL,
	[SALES_CITY] [varchar](40) NULL,
	[SALES_TELEPHONE] [varchar](15) NULL,
	[S_POSTAL_CODE] [INT] NULL,
	[S_MANAGER_ID] [INT] NULL,

	[starting_date] [datetime] not null default (getdate()),
	[ending_date] [datetime] null ,
	[is_current] [int] not null default (1),
	[Source_Code] [int] NOT NULL )




CREATE TABLE [dbo].[SALES_DETAILS_FACT]
(
    [SALES_DETAILS_FACT_SK] [int] identity (1,1) PRIMARY KEY ,
	[PRODUCT_SK_FK] [int] null ,
	[CUSTOMER_SK_FK] [int] null,
	[STAFF_SK_FK] [int] null,
	[SALES_OUTLET_SK_FK] [int] null ,
	[Date_SK_FK] [int] null ,
	[TIME_SK_FK] [INT] NULL,
	[QUANTITY] [int] NOT NULL,
	[PRICE] [FLOAT] NOT NULL,

	[SALES_DETAILS_ID_BK] [int] NULL ,
	[TRANSACTION_ID_BK] [int] NULL  ,
	[TRANSACTION_DATE] [DATE] NULL  ,
	[TRANSACTION_TIME] [TIME] (7) NULL  ,

	[Created_at] [Datetime] not null default (getdate()),
	[Source_Code] [int] NOT NULL )

-- LAST LOAD TABLE


CREATE TABLE [dbo].[LAST_LOAD] 
(
  [id] [int] , 
  [last_details] [varchar] (20) , 
  [last_date] [datetime] , 
  [last_id] [int] )
