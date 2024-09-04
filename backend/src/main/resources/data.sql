-- Insert initial roles if applicable
INSERT INTO Roles (RoleName) VALUES ('USER');
INSERT INTO Roles (RoleName) VALUES ('ADMIN');

-- Insert default users with hashed passwords
-- Ensure that the password hashes are generated and valid
INSERT INTO Users (Email, PasswordHash, FirstName, LastName, Role) VALUES
('admin@example.com', '$2a$10$e1QLu/6C.pdU5/r7F.O/pOa1MRnhNSJlLEhPBuE8m.3xkzIn/z7cC', 'Admin', 'User', 'ADMIN'),
('user@example.com', '$2a$10$5sTqk19.y3T8v4yLZXWj0uXQdS6L5z4cy8Lm5FZ6sZ55PbyFtuhFG', 'John', 'Doe', 'USER');

-- Insert sample job postings with Indian locations and companies
INSERT INTO Jobs (Title, Description, Company, Location, Salary) VALUES
('Software Engineer', 'Develop and maintain software applications.', 'Tata Consultancy Services', 'Mumbai, Maharashtra', 1200000.00),
('Product Manager', 'Manage the product lifecycle from conception to launch.', 'Infosys', 'Bengaluru, Karnataka', 1400000.00);

-- Insert initial job categories relevant to the Indian job market
INSERT INTO JobCategories (CategoryName) VALUES ('Engineering');
INSERT INTO JobCategories (CategoryName) VALUES ('Product Management');
INSERT INTO JobCategories (CategoryName) VALUES ('Finance');
INSERT INTO JobCategories (CategoryName) VALUES ('Marketing');

-- Insert sample job applications if applicable
INSERT INTO Applications (UserId, JobId, ApplicationDate) VALUES
((SELECT id FROM Users WHERE Email = 'user@example.com'), (SELECT id FROM Jobs WHERE Title = 'Software Engineer'), CURRENT_DATE);
