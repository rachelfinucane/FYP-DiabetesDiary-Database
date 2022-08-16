/***
* Database: Diabetes Diary
* Creator: Rachel Finucane C18735641
* Date Updated: 2022/04/08
* 
* 1. Creates all tables
***/


-- IF OBJECT_ID(N'dbo.DiaryUser', N'U') IS NULL
--     CREATE TABLE DiaryUser
-- (
--     id UNIQUEIDENTIFIER NOT NULL,
--     username VARCHAR (100) UNIQUE,
--     CONSTRAINT PK_Users_UserId PRIMARY KEY CLUSTERED (UserId)
-- );
-- GO

IF OBJECT_ID(N'dbo.Users', N'U') IS NULL
    CREATE TABLE Users
(
    userId UNIQUEIDENTIFIER NOT NULL DEFAULT newid(),
    username VARCHAR(100) NOT NULL,
    CONSTRAINT PK_DiaryUser_Id PRIMARY KEY CLUSTERED (userId)
);
GO

IF OBJECT_ID(N'dbo.FederatedCredentials', N'U') IS NULL
    CREATE TABLE FederatedCredentials
(
    federatedCredentialId UNIQUEIDENTIFIER NOT NULL DEFAULT newid(),
    userId UNIQUEIDENTIFIER NOT NULL,
    provider VARCHAR(100) NOT NULL,
    subject VARCHAR (1000) NOT NULL,
    CONSTRAINT PK_FederaredCredentials_UserId PRIMARY KEY CLUSTERED (federatedCredentialId),
    CONSTRAINT AK_Provider_Subject UNIQUE(Provider, Subject)  
);
GO

IF OBJECT_ID(N'dbo.Recipe', N'U') IS NULL
    CREATE TABLE Recipe
(
    recipeId UNIQUEIDENTIFIER NOT NULL DEFAULT newid(),
    recipeSource VARCHAR (100),
    CONSTRAINT PK_Recipe_RecipeId PRIMARY KEY CLUSTERED (recipeId)
);
GO

IF OBJECT_ID(N'dbo.Ingredient', N'U') IS NULL
CREATE TABLE Ingredient
(
    ingredientId UNIQUEIDENTIFIER NOT NULL DEFAULT newid(),
    ingredientName VARCHAR (100),
    carbs DECIMAL(7,2) -- in grams, allow up to 10kg/ 10,000g,
    CONSTRAINT PK_Ingredient_IngredientId PRIMARY KEY CLUSTERED (ingredientId)
);
GO

IF OBJECT_ID(N'dbo.IngredientList', N'U') IS NULL
CREATE TABLE IngredientList
(
    recipeId UNIQUEIDENTIFIER NOT NULL,
    ingredientId UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT PK_IngredientList_RecipeIdIngredientId PRIMARY KEY CLUSTERED (recipeId, ingredientId)
);
GO

IF OBJECT_ID(N'dbo.Log', N'U') IS NULL
CREATE TABLE Log
(
    logId UNIQUEIDENTIFIER NOT NULL DEFAULT newid(),
    userId UNIQUEIDENTIFIER NOT NULL,
    bloodSugarID UNIQUEIDENTIFIER,
    -- insulinListID UNIQUEIDENTIFIER,
    insulinTakenId UNIQUEIDENTIFIER,
    mealID UNIQUEIDENTIFIER,
    logTime SMALLDATETIME,
    CONSTRAINT PK_Log_LogId PRIMARY KEY CLUSTERED (logId) 
);
GO

IF OBJECT_ID(N'dbo.Meal', N'U') IS NULL
CREATE TABLE Meal
(
    mealId UNIQUEIDENTIFIER NOT NULL DEFAULT newid(),
    recipeId UNIQUEIDENTIFIER,
    totalCarbs DECIMAL (7,3),
    mealName VARCHAR (100),
    -- in grams, allow up to 10kg/ 10,000g
    mealWeight DECIMAL (7,2),
    CONSTRAINT PK_Meal_MealId PRIMARY KEY CLUSTERED (mealId) 
);
GO

IF OBJECT_ID(N'dbo.BloodSugar', N'U') IS NULL
CREATE TABLE BloodSugar
(
    bloodSugarId UNIQUEIDENTIFIER NOT NULL DEFAULT newid(),
    Value DECIMAL(4,1) NOT NULL,
    CONSTRAINT PK_BloodSugar_BloodSugarId PRIMARY KEY CLUSTERED (bloodSugarId) 
);
GO

-- IF OBJECT_ID(N'dbo.InsulinList', N'U') IS NULL
-- CREATE TABLE InsulinList
-- (
--     logId UNIQUEIDENTIFIER NOT NULL,
--     insulinTypeId UNIQUEIDENTIFIER NOT NULL,
--     CONSTRAINT PK_InsulinList_LogId_InsulinId PRIMARY KEY CLUSTERED (logId, insulinTypeId) 
-- );
-- GO

IF OBJECT_ID(N'dbo.InsulinTaken', N'U') IS NULL
CREATE TABLE InsulinTaken
(
    -- insulinTypeId UNIQUEIDENTIFIER NOT NULL,
    -- units DECIMAL(7, 4),
    -- CONSTRAINT PK_InsulinTaken_InsulinTypeID PRIMARY KEY CLUSTERED (insulinTypeID) 
    insulinTakenId UNIQUEIDENTIFIER PRIMARY KEY DEFAULT newid(),
    units DECIMAL(7,4) NOT NULL,
    type VARCHAR(100) NOT NULL

);
GO

-- IF OBJECT_ID(N'dbo.Insulin', N'U') IS NULL
-- CREATE TABLE Insulin
-- (
--     insulinTypeID UNIQUEIDENTIFIER NOT NULL DEFAULT newid(),
--     insulinType VARCHAR (100),
--     CONSTRAINT PK_Insulin_InsulinTypeID PRIMARY KEY CLUSTERED (insulinTypeID) 
-- );
-- GO