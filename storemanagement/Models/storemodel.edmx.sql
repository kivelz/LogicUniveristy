
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/05/2019 15:02:48
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
IF OBJECT_ID(N'[dbo].[FK_DepartmentCollection]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Departments] DROP CONSTRAINT [FK_DepartmentCollection];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeRequest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Requests] DROP CONSTRAINT [FK_EmployeeRequest];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestProduct_Request]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestProduct] DROP CONSTRAINT [FK_RequestProduct_Request];
GO
IF OBJECT_ID(N'[dbo].[FK_RequestProduct_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestProduct] DROP CONSTRAINT [FK_RequestProduct_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_UnitsProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_UnitsProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeRole]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_EmployeeRole];
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
IF OBJECT_ID(N'[dbo].[Requests]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Requests];
GO
IF OBJECT_ID(N'[dbo].[Units]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Units];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
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
IF OBJECT_ID(N'[dbo].[RequestProduct]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RequestProduct];
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
    [dept_head] nvarchar(max)  NOT NULL,
    [Collection_Id] int  NOT NULL
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
    [CollectIonPoint] nvarchar(max)  NOT NULL,
    [Representive_Name] nvarchar(max)  NOT NULL
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
    [RoleId] int  NOT NULL
);
GO

-- Creating table 'Requests'
CREATE TABLE [dbo].[Requests] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [empId] int  NOT NULL,
    [deptId] int  NOT NULL,
    [approvalDate] datetime  NOT NULL,
    [remarks] nvarchar(max)  NOT NULL,
    [status] nvarchar(max)  NOT NULL,
    [qty] int  NOT NULL
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

-- Creating table 'RequestProduct'
CREATE TABLE [dbo].[RequestProduct] (
    [RequestProduct_Product_Id] int  NOT NULL,
    [Products_Id] int  NOT NULL
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

-- Creating primary key on [Id] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [PK_Requests]
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

-- Creating primary key on [RequestProduct_Product_Id], [Products_Id] in table 'RequestProduct'
ALTER TABLE [dbo].[RequestProduct]
ADD CONSTRAINT [PK_RequestProduct]
    PRIMARY KEY CLUSTERED ([RequestProduct_Product_Id], [Products_Id] ASC);
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

-- Creating foreign key on [Collection_Id] in table 'Departments'
ALTER TABLE [dbo].[Departments]
ADD CONSTRAINT [FK_DepartmentCollection]
    FOREIGN KEY ([Collection_Id])
    REFERENCES [dbo].[Collections]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepartmentCollection'
CREATE INDEX [IX_FK_DepartmentCollection]
ON [dbo].[Departments]
    ([Collection_Id]);
GO

-- Creating foreign key on [empId] in table 'Requests'
ALTER TABLE [dbo].[Requests]
ADD CONSTRAINT [FK_EmployeeRequest]
    FOREIGN KEY ([empId])
    REFERENCES [dbo].[Employees]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeRequest'
CREATE INDEX [IX_FK_EmployeeRequest]
ON [dbo].[Requests]
    ([empId]);
GO

-- Creating foreign key on [RequestProduct_Product_Id] in table 'RequestProduct'
ALTER TABLE [dbo].[RequestProduct]
ADD CONSTRAINT [FK_RequestProduct_Request]
    FOREIGN KEY ([RequestProduct_Product_Id])
    REFERENCES [dbo].[Requests]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Products_Id] in table 'RequestProduct'
ALTER TABLE [dbo].[RequestProduct]
ADD CONSTRAINT [FK_RequestProduct_Product]
    FOREIGN KEY ([Products_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RequestProduct_Product'
CREATE INDEX [IX_FK_RequestProduct_Product]
ON [dbo].[RequestProduct]
    ([Products_Id]);
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