
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/06/2019 22:37:00
-- Generated from EDMX file: C:\Users\kivel\source\repos\storemanagement\storemanagement\Models\storemodel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Test];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ProductCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_ProductCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeDepartment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_EmployeeDepartment];
GO
IF OBJECT_ID(N'[dbo].[FK_UnitsProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_UnitsProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeRole]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_EmployeeRole];
GO
IF OBJECT_ID(N'[dbo].[FK_DepartmentCollection_Department]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DepartmentCollection] DROP CONSTRAINT [FK_DepartmentCollection_Department];
GO
IF OBJECT_ID(N'[dbo].[FK_DepartmentCollection_Collection]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DepartmentCollection] DROP CONSTRAINT [FK_DepartmentCollection_Collection];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestItemProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestItems] DROP CONSTRAINT [FK_RequestItemProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestItemEmployee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestItems] DROP CONSTRAINT [FK_RequestItemEmployee];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestItemRequest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestItems] DROP CONSTRAINT [FK_RequestItemRequest];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestEmployee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Requests] DROP CONSTRAINT [FK_RequestEmployee];
GO
IF OBJECT_ID(N'[dbo].[FK_Manager_inherits_Employee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employees_Manager] DROP CONSTRAINT [FK_Manager_inherits_Employee];
GO
IF OBJECT_ID(N'[dbo].[FK_StoreClerk_inherits_Employee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employees_StoreClerk] DROP CONSTRAINT [FK_StoreClerk_inherits_Employee];
GO
IF OBJECT_ID(N'[dbo].[FK_Supervisor_inherits_Employee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employees_Supervisor] DROP CONSTRAINT [FK_Supervisor_inherits_Employee];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Suppliers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Suppliers];
GO
IF OBJECT_ID(N'[dbo].[Departments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Departments];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Collections]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Collections];
GO
IF OBJECT_ID(N'[dbo].[Employees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employees];
GO
IF OBJECT_ID(N'[dbo].[RequestItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RequestItems];
GO
IF OBJECT_ID(N'[dbo].[Units]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Units];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO
IF OBJECT_ID(N'[dbo].[Requests]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Requests];
GO
IF OBJECT_ID(N'[dbo].[Employees_Manager]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employees_Manager];
GO
IF OBJECT_ID(N'[dbo].[Employees_StoreClerk]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employees_StoreClerk];
GO
IF OBJECT_ID(N'[dbo].[Employees_Supervisor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employees_Supervisor];
GO
IF OBJECT_ID(N'[dbo].[DepartmentCollection]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DepartmentCollection];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Suppliers'
CREATE TABLE [dbo].[Suppliers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [code] nvarchar(max)  NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [contact] int  NOT NULL,
    [fax] int  NOT NULL,
    [address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Departments'
CREATE TABLE [dbo].[Departments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [dept_name] nvarchar(max)  NOT NULL,
    [contact_name] nvarchar(max)  NOT NULL,
    [phone] int  NOT NULL,
    [fax] int  NOT NULL,
    [dept_head] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [item_code] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [CategoryId] int  NOT NULL,
    [reorderLvl] int  NOT NULL,
    [reorderQty] int  NOT NULL,
    [balance] int  NOT NULL,
    [UnitsId] int  NOT NULL,
    [price] float  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Collections'
CREATE TABLE [dbo].[Collections] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CollectIonPoint] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [phone] int  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [DepartmentId] int  NOT NULL,
    [RoleId] int  NOT NULL,
    [sessionId] uniqueidentifier  NULL,
    [empNo] int  NOT NULL
);
GO

-- Creating table 'RequestItems'
CREATE TABLE [dbo].[RequestItems] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [empId] int  NOT NULL,
    [qty] int  NOT NULL,
    [productDesc] nvarchar(max)  NOT NULL,
    [productCat] nvarchar(max)  NOT NULL,
    [ProductId] int  NOT NULL,
    [EmployeeId] int  NOT NULL,
    [RequestId] int  NOT NULL
);
GO

-- Creating table 'Units'
CREATE TABLE [dbo].[Units] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [qty] int  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [roleName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Requests'
CREATE TABLE [dbo].[Requests] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [createdAt] datetime  NOT NULL,
    [remarks] nvarchar(max)  NOT NULL,
    [status] nvarchar(max)  NOT NULL,
    [approvalDate] datetime  NULL,
    [deptName] nvarchar(max)  NOT NULL,
    [EmployeeId] int  NOT NULL
);
GO

-- Creating table 'Employees_Manager'
CREATE TABLE [dbo].[Employees_Manager] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Employees_StoreClerk'
CREATE TABLE [dbo].[Employees_StoreClerk] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Employees_Supervisor'
CREATE TABLE [dbo].[Employees_Supervisor] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'DepartmentCollection'
CREATE TABLE [dbo].[DepartmentCollection] (
    [Departments_Id] int  NOT NULL,
    [Collections_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Suppliers'
ALTER TABLE [dbo].[Suppliers]
ADD CONSTRAINT [PK_Suppliers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Departments'
ALTER TABLE [dbo].[Departments]
ADD CONSTRAINT [PK_Departments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Collections'
ALTER TABLE [dbo].[Collections]
ADD CONSTRAINT [PK_Collections]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RequestItems'
ALTER TABLE [dbo].[RequestItems]
ADD CONSTRAINT [PK_RequestItems]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Units'
ALTER TABLE [dbo].[Units]
ADD CONSTRAINT [PK_Units]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [PK_Requests]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Employees_Manager'
ALTER TABLE [dbo].[Employees_Manager]
ADD CONSTRAINT [PK_Employees_Manager]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Employees_StoreClerk'
ALTER TABLE [dbo].[Employees_StoreClerk]
ADD CONSTRAINT [PK_Employees_StoreClerk]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Employees_Supervisor'
ALTER TABLE [dbo].[Employees_Supervisor]
ADD CONSTRAINT [PK_Employees_Supervisor]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Departments_Id], [Collections_Id] in table 'DepartmentCollection'
ALTER TABLE [dbo].[DepartmentCollection]
ADD CONSTRAINT [PK_DepartmentCollection]
    PRIMARY KEY CLUSTERED ([Departments_Id], [Collections_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CategoryId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_ProductCategory]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductCategory'
CREATE INDEX [IX_FK_ProductCategory]
ON [dbo].[Products]
    ([CategoryId]);
GO

-- Creating foreign key on [DepartmentId] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK_EmployeeDepartment]
    FOREIGN KEY ([DepartmentId])
    REFERENCES [dbo].[Departments]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeDepartment'
CREATE INDEX [IX_FK_EmployeeDepartment]
ON [dbo].[Employees]
    ([DepartmentId]);
GO

-- Creating foreign key on [UnitsId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_UnitsProduct]
    FOREIGN KEY ([UnitsId])
    REFERENCES [dbo].[Units]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UnitsProduct'
CREATE INDEX [IX_FK_UnitsProduct]
ON [dbo].[Products]
    ([UnitsId]);
GO

-- Creating foreign key on [RoleId] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK_EmployeeRole]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeRole'
CREATE INDEX [IX_FK_EmployeeRole]
ON [dbo].[Employees]
    ([RoleId]);
GO

-- Creating foreign key on [Departments_Id] in table 'DepartmentCollection'
ALTER TABLE [dbo].[DepartmentCollection]
ADD CONSTRAINT [FK_DepartmentCollection_Department]
    FOREIGN KEY ([Departments_Id])
    REFERENCES [dbo].[Departments]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Collections_Id] in table 'DepartmentCollection'
ALTER TABLE [dbo].[DepartmentCollection]
ADD CONSTRAINT [FK_DepartmentCollection_Collection]
    FOREIGN KEY ([Collections_Id])
    REFERENCES [dbo].[Collections]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepartmentCollection_Collection'
CREATE INDEX [IX_FK_DepartmentCollection_Collection]
ON [dbo].[DepartmentCollection]
    ([Collections_Id]);
GO

-- Creating foreign key on [ProductId] in table 'RequestItems'
ALTER TABLE [dbo].[RequestItems]
ADD CONSTRAINT [FK_RequestItemProduct]
    FOREIGN KEY ([ProductId])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestItemProduct'
CREATE INDEX [IX_FK_RequestItemProduct]
ON [dbo].[RequestItems]
    ([ProductId]);
GO

-- Creating foreign key on [EmployeeId] in table 'RequestItems'
ALTER TABLE [dbo].[RequestItems]
ADD CONSTRAINT [FK_RequestItemEmployee]
    FOREIGN KEY ([EmployeeId])
    REFERENCES [dbo].[Employees]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestItemEmployee'
CREATE INDEX [IX_FK_RequestItemEmployee]
ON [dbo].[RequestItems]
    ([EmployeeId]);
GO

-- Creating foreign key on [RequestId] in table 'RequestItems'
ALTER TABLE [dbo].[RequestItems]
ADD CONSTRAINT [FK_RequestItemRequest]
    FOREIGN KEY ([RequestId])
    REFERENCES [dbo].[Requests]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestItemRequest'
CREATE INDEX [IX_FK_RequestItemRequest]
ON [dbo].[RequestItems]
    ([RequestId]);
GO

-- Creating foreign key on [EmployeeId] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [FK_RequestEmployee]
    FOREIGN KEY ([EmployeeId])
    REFERENCES [dbo].[Employees]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestEmployee'
CREATE INDEX [IX_FK_RequestEmployee]
ON [dbo].[Requests]
    ([EmployeeId]);
GO

-- Creating foreign key on [Id] in table 'Employees_Manager'
ALTER TABLE [dbo].[Employees_Manager]
ADD CONSTRAINT [FK_Manager_inherits_Employee]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Employees]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Employees_StoreClerk'
ALTER TABLE [dbo].[Employees_StoreClerk]
ADD CONSTRAINT [FK_StoreClerk_inherits_Employee]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Employees]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Employees_Supervisor'
ALTER TABLE [dbo].[Employees_Supervisor]
ADD CONSTRAINT [FK_Supervisor_inherits_Employee]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Employees]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------