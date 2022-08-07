---------------------
-- Federated Users --
---------------------

---------------
-- Log Table --
---------------

-- Foreign Key: User
ALTER TABLE dbo.Log
   ADD CONSTRAINT FK_Log_User FOREIGN KEY (userId)
      REFERENCES dbo.Users (userId)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;

-- Foreign Key: Meal
ALTER TABLE dbo.Log
   ADD CONSTRAINT FK_Log_Meal FOREIGN KEY (mealId)
      REFERENCES dbo.Meal (mealId)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;

-- -- Foreign Key: InsulinList
-- ALTER TABLE dbo.Log
--    ADD CONSTRAINT FK_Log_InsulinList FOREIGN KEY (InsulinId)
--       REFERENCES dbo.InsulinList (InsulinId)
--       ON DELETE CASCADE
--       ON UPDATE CASCADE
-- ;

-- Foreign Key: BloodSugar
ALTER TABLE dbo.Log
   ADD CONSTRAINT FK_Log_BloodSugar FOREIGN KEY (bloodSugarId)
      REFERENCES dbo.BloodSugar (bloodSugarId)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;

----------
-- Meal --
----------

ALTER TABLE dbo.Meal
   ADD CONSTRAINT FK_Meal_Recipe FOREIGN KEY (recipeId)
      REFERENCES dbo.Recipe (recipeId)
      ON DELETE CASCADE
      ON UPDATE CASCADE

---------------------
-- Ingredient List --
---------------------

ALTER TABLE dbo.IngredientList
   ADD CONSTRAINT FK_IngredientList_Recipe FOREIGN KEY (recipeId)
      REFERENCES dbo.Recipe (recipeId)
      ON DELETE CASCADE
      ON UPDATE CASCADE

ALTER TABLE dbo.IngredientList
   ADD CONSTRAINT FK_IngredientList_Ingredient FOREIGN KEY (ingredientId)
      REFERENCES dbo.Ingredient (ingredientId)
      ON DELETE CASCADE
      ON UPDATE CASCADE
      
------------------
-- Insulin Taken --
------------------

ALTER TABLE dbo.InsulinTaken
   ADD CONSTRAINT FK_InsulinTaken_InsulinType FOREIGN KEY (insulinTypeId)
      REFERENCES dbo.Insulin (insulinTypeId)
      ON DELETE CASCADE
      ON UPDATE CASCADE

------------------
-- Insulin List --
------------------

ALTER TABLE dbo.InsulinList
   ADD CONSTRAINT FK_InsulinList_Log FOREIGN KEY (logId)
      REFERENCES dbo.Log (logId)
      ON DELETE CASCADE
      ON UPDATE CASCADE

ALTER TABLE dbo.InsulinList
   ADD CONSTRAINT FK_InsulinList_InsulinTaken FOREIGN KEY (insulinTypeId)
      REFERENCES dbo.InsulinTaken (insulinTypeId)
      ON DELETE CASCADE
      ON UPDATE CASCADE