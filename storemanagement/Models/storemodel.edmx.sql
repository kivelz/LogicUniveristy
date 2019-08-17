
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/16/2019 15:54:04
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
IF OBJECT_ID(N'[dbo].[FK_ProductSupplier]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_ProductSupplier];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoryProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_CategoryProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_DepartmentEmployee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_DepartmentEmployee];
GO
IF OBJECT_ID(N'[dbo].[FK_UnitsProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_UnitsProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_CollectionDepartment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Departments] DROP CONSTRAINT [FK_CollectionDepartment];
GO
IF OBJECT_ID(N'[dbo].[FK_RoleEmployee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_RoleEmployee];
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
IF OBJECT_ID(N'[dbo].[Requests]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Requests];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Suppliers'
CREATE TABLE [dbo].[Suppliers] (
    [SupplierId] int IDENTITY(1,1) NOT NULL,
    [code] nvarchar(max)  NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [contact] int  NOT NULL,
    [fax] int  NOT NULL,
    [address] nvarchar(max)  NOT NULL,
    [ProductId] int  NULL
);
GO

-- Creating table 'Departments'
CREATE TABLE [dbo].[Departments] (
    [DeptId] int IDENTITY(1,1) NOT NULL,
    [dept_name] nvarchar(max)  NOT NULL,
    [contact_name] nvarchar(max)  NOT NULL,
    [phone] int  NOT NULL,
    [fax] int  NOT NULL,
    [Dept_head] int  NOT NULL,
    [CollectionId] int  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [ProductId] int IDENTITY(1,1) NOT NULL,
    [item_code] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [reorderLvl] int  NOT NULL,
    [reorderQty] int  NOT NULL,
    [balance] int  NOT NULL,
    [price] float  NOT NULL,
    [SupplierId] int  NULL,
    [CategoryId] int  NOT NULL,
    [UnitsId] int  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [CatId] int IDENTITY(1,1) NOT NULL,
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
    [EmployeeId] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [phone] int  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [sessionId] uniqueidentifier  NULL,
    [empNo] int  NOT NULL,
    [DepartmentId] int  NOT NULL,
    [RoleId] int  NOT NULL,
    [MgrId] int  NULL
);
GO

-- Creating table 'RequestItems'
CREATE TABLE [dbo].[RequestItems] (
    [ItemRequestId] int IDENTITY(1,1) NOT NULL,
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

-- Creating table 'Requests'
CREATE TABLE [dbo].[Requests] (
    [RequestId] int IDENTITY(1,1) NOT NULL,
    [createdAt] datetime  NOT NULL,
    [remarks] nvarchar(max)  NOT NULL,
    [status] nvarchar(max)  NOT NULL,
    [approvalDate] datetime  NULL,
    [deptName] nvarchar(max)  NOT NULL,
    [EmployeeId] int  NOT NULL,
    [employeeName] nvarchar(max)  NOT NULL,
    [employeeNo] int  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [RoleId] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [SupplierId] in table 'Suppliers'
ALTER TABLE [dbo].[Suppliers]
ADD CONSTRAINT [PK_Suppliers]
    PRIMARY KEY CLUSTERED ([SupplierId] ASC);
GO

-- Creating primary key on [DeptId] in table 'Departments'
ALTER TABLE [dbo].[Departments]
ADD CONSTRAINT [PK_Departments]
    PRIMARY KEY CLUSTERED ([DeptId] ASC);
GO

-- Creating primary key on [ProductId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([ProductId] ASC);
GO

-- Creating primary key on [CatId] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([CatId] ASC);
GO

-- Creating primary key on [Id] in table 'Collections'
ALTER TABLE [dbo].[Collections]
ADD CONSTRAINT [PK_Collections]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [EmployeeId] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([EmployeeId] ASC);
GO

-- Creating primary key on [ItemRequestId] in table 'RequestItems'
ALTER TABLE [dbo].[RequestItems]
ADD CONSTRAINT [PK_RequestItems]
    PRIMARY KEY CLUSTERED ([ItemRequestId] ASC);
GO

-- Creating primary key on [Id] in table 'Units'
ALTER TABLE [dbo].[Units]
ADD CONSTRAINT [PK_Units]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [RequestId] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [PK_Requests]
    PRIMARY KEY CLUSTERED ([RequestId] ASC);
GO

-- Creating primary key on [RoleId] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([RoleId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ProductId] in table 'RequestItems'
ALTER TABLE [dbo].[RequestItems]
ADD CONSTRAINT [FK_RequestItemProduct]
    FOREIGN KEY ([ProductId])
    REFERENCES [dbo].[Products]
        ([ProductId])
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
        ([EmployeeId])
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
        ([RequestId])
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
        ([EmployeeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestEmployee'
CREATE INDEX [IX_FK_RequestEmployee]
ON [dbo].[Requests]
    ([EmployeeId]);
GO

-- Creating foreign key on [SupplierId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_ProductSupplier]
    FOREIGN KEY ([SupplierId])
    REFERENCES [dbo].[Suppliers]
        ([SupplierId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductSupplier'
CREATE INDEX [IX_FK_ProductSupplier]
ON [dbo].[Products]
    ([SupplierId]);
GO

-- Creating foreign key on [CategoryId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_CategoryProduct]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[Categories]
        ([CatId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryProduct'
CREATE INDEX [IX_FK_CategoryProduct]
ON [dbo].[Products]
    ([CategoryId]);
GO

-- Creating foreign key on [DepartmentId] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK_DepartmentEmployee]
    FOREIGN KEY ([DepartmentId])
    REFERENCES [dbo].[Departments]
        ([DeptId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepartmentEmployee'
CREATE INDEX [IX_FK_DepartmentEmployee]
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

-- Creating foreign key on [CollectionId] in table 'Departments'
ALTER TABLE [dbo].[Departments]
ADD CONSTRAINT [FK_CollectionDepartment]
    FOREIGN KEY ([CollectionId])
    REFERENCES [dbo].[Collections]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CollectionDepartment'
CREATE INDEX [IX_FK_CollectionDepartment]
ON [dbo].[Departments]
    ([CollectionId]);
GO

-- Creating foreign key on [RoleId] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK_RoleEmployee]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[Roles]
        ([RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleEmployee'
CREATE INDEX [IX_FK_RoleEmployee]
ON [dbo].[Employees]
    ([RoleId]);
GO

-- Creating foreign key on [MgrId] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK_EmployeeEmployee]
    FOREIGN KEY ([MgrId])
    REFERENCES [dbo].[Employees]
        ([EmployeeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeEmployee'
CREATE INDEX [IX_FK_EmployeeEmployee]
ON [dbo].[Employees]
    ([MgrId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------