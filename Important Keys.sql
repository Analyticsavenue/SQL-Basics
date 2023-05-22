Let's create some tables to demonstrate the concepts of primary key, foreign key, candidate key
composite key, and surrogate key. 
We'll have a hypothetical scenario a library db

The Book table has a primary key BookID that uniquely identifies each book.
The ISBN column is a unique key, ensuring that each book has a unique International Standard Book Number.
The PublisherID column is a foreign key referencing the Publisher table, establishing a relationship between the two tables.

CREATE TABLE Book (
  BookID INT PRIMARY KEY,
  Title VARCHAR(100),
  Author VARCHAR(50),
  ISBN VARCHAR(13) UNIQUE,  
  Year INT,
  PublisherID INT,
  FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);
CREATE TABLE Publisher (
  PublisherID INT PRIMARY KEY,
  Name VARCHAR(100),
  Location VARCHAR(50)
);
The Borrower table has a primary key BorrowerID that uniquely identifies each borrower.
The Email column is a unique key, ensuring that each borrower has a unique email address.

CREATE TABLE Borrower (
  BorrowerID INT PRIMARY KEY,
  Name VARCHAR(100),
  Email VARCHAR(100) UNIQUE
);
The Loan table has a composite primary key consisting of both BookID and BorrowerID, which together uniquely identify each loan.
The BookID column is a foreign key referencing the Book table, establishing a relationship.
The BorrowerID column is a foreign key referencing the Borrower table, establishing a relationship.

CREATE TABLE Loan (
  BookID INT,
  BorrowerID INT,
  LoanDate DATE,
  PRIMARY KEY (BookID, BorrowerID),
  FOREIGN KEY (BookID) REFERENCES Book(BookID),
  FOREIGN KEY (BorrowerID) REFERENCES Borrower(BorrowerID)
);
CREATE TABLE Member (
  MemberID INT PRIMARY KEY,
  Name VARCHAR(100),
  Address VARCHAR(200)
);

The Member table has a surrogate key MemberID, which is a system-generated identifier that uniquely identifies each member.
These examples demonstrate how primary keys, foreign keys, candidate keys, 
composite keys, and surrogate keys are used in table creation and establishing relationships between tables in a database schema.