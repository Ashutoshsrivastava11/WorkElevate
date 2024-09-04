-- Use the appropriate database (replace 'YourDatabaseName' with your database name)
USE YourDatabaseName;
GO

-- Create Users Table
IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL
    DROP TABLE dbo.Users;
GO

CREATE TABLE dbo.Users (
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
    Email NVARCHAR(255) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE() 
        CONSTRAINT DF_Users_UpdatedAt DEFAULT GETDATE()
);

-- Create Jobs Table
IF OBJECT_ID('dbo.Jobs', 'U') IS NOT NULL
    DROP TABLE dbo.Jobs;
GO

CREATE TABLE dbo.Jobs (
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX) NOT NULL,
    Company NVARCHAR(255),
    Location NVARCHAR(255),
    Salary DECIMAL(18, 2),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE() 
        CONSTRAINT DF_Jobs_UpdatedAt DEFAULT GETDATE()
);

-- Create Job Applications Table
IF OBJECT_ID('dbo.JobApplications', 'U') IS NOT NULL
    DROP TABLE dbo.JobApplications;
GO

CREATE TABLE dbo.JobApplications (
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
    JobId BIGINT NOT NULL,
    UserId BIGINT NOT NULL,
    CoverLetter NVARCHAR(MAX),
    AppliedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_JobApplications_Jobs FOREIGN KEY (JobId) 
        REFERENCES dbo.Jobs(Id),
    CONSTRAINT FK_JobApplications_Users FOREIGN KEY (UserId) 
        REFERENCES dbo.Users(Id)
);

-- Create Roles Table (if needed)
IF OBJECT_ID('dbo.Roles', 'U') IS NOT NULL
    DROP TABLE dbo.Roles;
GO

CREATE TABLE dbo.Roles (
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
    RoleName NVARCHAR(50) UNIQUE NOT NULL
);

-- Create User-Roles Relationship Table
IF OBJECT_ID('dbo.UserRoles', 'U') IS NOT NULL
    DROP TABLE dbo.UserRoles;
GO

CREATE TABLE dbo.UserRoles (
    UserId BIGINT NOT NULL,
    RoleId BIGINT NOT NULL,
    PRIMARY KEY (UserId, RoleId),
    CONSTRAINT FK_UserRoles_Users FOREIGN KEY (UserId) 
        REFERENCES dbo.Users(Id),
    CONSTRAINT FK_UserRoles_Roles FOREIGN KEY (RoleId) 
        REFERENCES dbo.Roles(Id)
);

-- Insert Default Roles
INSERT INTO dbo.Roles (RoleName) VALUES ('USER'), ('ADMIN');
