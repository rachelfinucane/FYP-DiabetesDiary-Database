/***
* Database: Diabetes Diary
* Creator: Rachel Finucane C18735641
* Date Updated: 2022/04/08
* 
* 0. Drops all tables
***/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BloodSugar]') AND type in (N'U'))
DROP TABLE [dbo].[BloodSugar]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[federatedCredentials]') AND type in (N'U'))
DROP TABLE [dbo].[federatedCredentials]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ingredient]') AND type in (N'U'))
DROP TABLE [dbo].[Ingredient]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IngredientList]') AND type in (N'U'))
DROP TABLE [dbo].[IngredientList]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Insulin]') AND type in (N'U'))
DROP TABLE [dbo].[Insulin]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsulinList]') AND type in (N'U'))
DROP TABLE [dbo].[InsulinList]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsulinTaken]') AND type in (N'U'))
DROP TABLE [dbo].[InsulinTaken]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND type in (N'U'))
DROP TABLE [dbo].[Log]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Meal]') AND type in (N'U'))
DROP TABLE [dbo].[Meal]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Recipe]') AND type in (N'U'))
DROP TABLE [dbo].[Recipe]
GO