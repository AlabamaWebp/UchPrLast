
USE trade2
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'trade')      
     EXEC (N'CREATE SCHEMA trade')                                   
 GO                                                               

USE trade2
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'order1'  AND sc.name = N'trade'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'order1'  AND sc.name = N'trade'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [trade].[order1]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[trade].[order1]
(
   [OrderID] int IDENTITY(11, 1)  NOT NULL,
   [OrderStatus] nvarchar(max)  NOT NULL,
   [OrderDeliveryDate] datetime2(0)  NOT NULL,
   [OrderPickupPoint] nvarchar(max)  NOT NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'trade.order1',
        N'SCHEMA', N'trade',
        N'TABLE', N'order1'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE trade2
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'orderproduct'  AND sc.name = N'trade'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'orderproduct'  AND sc.name = N'trade'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [trade].[orderproduct]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[trade].[orderproduct]
(
   [ID] int IDENTITY(21, 1)  NOT NULL,
   [OrderID] int  NOT NULL,

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [ProductArticleNumber] nvarchar(100)  NOT NULL,
   [Quantity] nvarchar(45)  NOT NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'trade.orderproduct',
        N'SCHEMA', N'trade',
        N'TABLE', N'orderproduct'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE trade2
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'product'  AND sc.name = N'trade'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'product'  AND sc.name = N'trade'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [trade].[product]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[trade].[product]
(

   /*
   *   SSMA warning messages:
   *   M2SS0183: The following SQL clause was ignored during conversion: COLLATE utf8mb3_general_ci.
   */

   [ProductArticleNumber] nvarchar(100)  NOT NULL,
   [ProductName] nvarchar(max)  NOT NULL,
   [ProductDescription] nvarchar(max)  NOT NULL,
   [ProductCategory] nvarchar(max)  NOT NULL,
   [ProductPhoto] nvarchar(100)  NOT NULL,
   [ProductManufacturer] nvarchar(max)  NOT NULL,
   [ProductCost] decimal(19, 4)  NOT NULL,
   [ProductDiscountAmount] smallint  NULL,
   [ProductQuantityInStock] int  NOT NULL,
   [ProductStatus] nvarchar(max)  NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'trade.product',
        N'SCHEMA', N'trade',
        N'TABLE', N'product'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE trade2
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'role'  AND sc.name = N'trade'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'role'  AND sc.name = N'trade'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [trade].[role]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[trade].[role]
(
   [RoleID] int IDENTITY(4, 1)  NOT NULL,
   [RoleName] nvarchar(100)  NOT NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'trade.role',
        N'SCHEMA', N'trade',
        N'TABLE', N'role'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE trade2
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'user'  AND sc.name = N'trade'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'user'  AND sc.name = N'trade'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [trade].[user]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[trade].[user]
(
   [UserID] int IDENTITY(11, 1)  NOT NULL,
   [UserSurname] nvarchar(100)  NOT NULL,
   [UserName] nvarchar(100)  NOT NULL,
   [UserPatronymic] nvarchar(100)  NOT NULL,
   [UserLogin] nvarchar(max)  NOT NULL,
   [UserPassword] nvarchar(max)  NOT NULL,
   [UserRole] int  NOT NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'trade.`user`',
        N'SCHEMA', N'trade',
        N'TABLE', N'user'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE trade2
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_order1_OrderID'  AND sc.name = N'trade'  AND type in (N'PK'))
ALTER TABLE [trade].[order1] DROP CONSTRAINT [PK_order1_OrderID]
 GO



ALTER TABLE [trade].[order1]
 ADD CONSTRAINT [PK_order1_OrderID]
   PRIMARY KEY
   CLUSTERED ([OrderID] ASC)

GO


USE trade2
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_orderproduct_ID'  AND sc.name = N'trade'  AND type in (N'PK'))
ALTER TABLE [trade].[orderproduct] DROP CONSTRAINT [PK_orderproduct_ID]
 GO



ALTER TABLE [trade].[orderproduct]
 ADD CONSTRAINT [PK_orderproduct_ID]
   PRIMARY KEY
   CLUSTERED ([ID] ASC)

GO


USE trade2
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_product_ProductArticleNumber'  AND sc.name = N'trade'  AND type in (N'PK'))
ALTER TABLE [trade].[product] DROP CONSTRAINT [PK_product_ProductArticleNumber]
 GO



ALTER TABLE [trade].[product]
 ADD CONSTRAINT [PK_product_ProductArticleNumber]
   PRIMARY KEY
   CLUSTERED ([ProductArticleNumber] ASC)

GO


USE trade2
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_role_RoleID'  AND sc.name = N'trade'  AND type in (N'PK'))
ALTER TABLE [trade].[role] DROP CONSTRAINT [PK_role_RoleID]
 GO



ALTER TABLE [trade].[role]
 ADD CONSTRAINT [PK_role_RoleID]
   PRIMARY KEY
   CLUSTERED ([RoleID] ASC)

GO


USE trade2
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_user_UserID'  AND sc.name = N'trade'  AND type in (N'PK'))
ALTER TABLE [trade].[user] DROP CONSTRAINT [PK_user_UserID]
 GO



ALTER TABLE [trade].[user]
 ADD CONSTRAINT [PK_user_UserID]
   PRIMARY KEY
   CLUSTERED ([UserID] ASC)

GO


USE trade2
GO
IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'orderproduct'  AND sc.name = N'trade'  AND si.name = N'orderproduct_ibfk_1' AND so.type in (N'U'))
   DROP INDEX [orderproduct_ibfk_1] ON [trade].[orderproduct] 
GO
CREATE NONCLUSTERED INDEX [orderproduct_ibfk_1] ON [trade].[orderproduct]
(
   [OrderID] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE trade2
GO
IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'orderproduct'  AND sc.name = N'trade'  AND si.name = N'orderproduct_ibfk_2' AND so.type in (N'U'))
   DROP INDEX [orderproduct_ibfk_2] ON [trade].[orderproduct] 
GO
CREATE NONCLUSTERED INDEX [orderproduct_ibfk_2] ON [trade].[orderproduct]
(
   [ProductArticleNumber] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE trade2
GO
IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'user'  AND sc.name = N'trade'  AND si.name = N'UserRole' AND so.type in (N'U'))
   DROP INDEX [UserRole] ON [trade].[user] 
GO
CREATE NONCLUSTERED INDEX [UserRole] ON [trade].[user]
(
   [UserRole] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE trade2
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'orderproduct$orderproduct_ibfk_1'  AND sc.name = N'trade'  AND type in (N'F'))
ALTER TABLE [trade].[orderproduct] DROP CONSTRAINT [orderproduct$orderproduct_ibfk_1]
 GO



ALTER TABLE [trade].[orderproduct]
 ADD CONSTRAINT [orderproduct$orderproduct_ibfk_1]
 FOREIGN KEY 
   ([OrderID])
 REFERENCES 
   [trade2].[trade].[order1]     ([OrderID])
    ON DELETE CASCADE
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'orderproduct$orderproduct_ibfk_2'  AND sc.name = N'trade'  AND type in (N'F'))
ALTER TABLE [trade].[orderproduct] DROP CONSTRAINT [orderproduct$orderproduct_ibfk_2]
 GO



ALTER TABLE [trade].[orderproduct]
 ADD CONSTRAINT [orderproduct$orderproduct_ibfk_2]
 FOREIGN KEY 
   ([ProductArticleNumber])
 REFERENCES 
   [trade2].[trade].[product]     ([ProductArticleNumber])
    ON DELETE CASCADE
    ON UPDATE NO ACTION

GO


USE trade2
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'user$user_ibfk_1'  AND sc.name = N'trade'  AND type in (N'F'))
ALTER TABLE [trade].[user] DROP CONSTRAINT [user$user_ibfk_1]
 GO



ALTER TABLE [trade].[user]
 ADD CONSTRAINT [user$user_ibfk_1]
 FOREIGN KEY 
   ([UserRole])
 REFERENCES 
   [trade2].[trade].[role]     ([RoleID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE trade2
GO
ALTER TABLE  [trade].[orderproduct]
 ADD DEFAULT N'1' FOR [Quantity]
GO


USE trade2
GO
ALTER TABLE  [trade].[product]
 ADD DEFAULT NULL FOR [ProductDiscountAmount]
GO

