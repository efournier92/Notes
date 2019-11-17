# [Databases](https://en.wikipedia.org/wiki/Database)

## Overview
A [database](https://en.wikipedia.org/wiki/Database) is a mechanism for persisting [data](https://en.wikipedia.org/wiki/Data) in an application. The way this has typically been done in the past is with [relational databases](https://en.wikipedia.org/wiki/Relational_database). [SQL](https://en.wikipedia.org/wiki/SQL) is the most common language used to manipulate a [relational database](https://en.wikipedia.org/wiki/Relational_database). Modern data-storage solutions have evolved to incnlude [NoSQL](https://en.wikipedia.org/wiki/NoSQL) databases, which have become more common. That said, [SQL-based](https://en.wikipedia.org/wiki/SQL) [relational databases](https://en.wikipedia.org/wiki/Relational_database) are the most common to this day.

## [Relational Databases](https://en.wikipedia.org/wiki/Relational_database)

### Description
[Relational databases](https://en.wikipedia.org/wiki/Relational_database) have been around since 1970. They consist of related tables, each of which contains rows and columns.

### Visual
![DB Table](https://raw.githubusercontent.com/efournier92/Notes/master/Databases/Visuals/Table.png)

### Table
A set of data with consistent attributes. These attributes usually model an object, part of one object.

#### Columns
Represent one attribute.

#### Rows
Represents one instance or the model.

#### Example
The below statement will create a new table, defining data types on 4 properties, which will be mapped to the table's columns.
```sql
CREATE TABLE Users (
  ID int Primary Key,
  LastName varchar(255),
  FirstName varchar(255),
  Birthday date,
);
```

### [Schema](https://en.wikipedia.org/wiki/Database_schema)
A 'database' refers to a collection of interrelated tables. Rules for a database, and the tables it contains, are defined within [schema](https://en.wikipedia.org/wiki/Database_schema). These rules are also written in [SQL](https://en.wikipedia.org/wiki/SQL), and serve to ensure data integrity, by defining [data types](https://www.w3schools.com/sql/sql_datatypes.asp), mandatory properties, rules around which users are allowed to read and write where, and more.

### Relationships
Different tables can be linked together using relationships. The first property in each table will be a unique identifier: these IDs are used to facilitate these linkages. Relationships can be any of the following types.

#### One-to-One
Each table holds one (or no) reference to the primary key of the other table.

#### One-to-Many
A parent table holds references to the primary keys of numerous child tables.

#### Many-to-Many
Each property in both tables can relate to any number of properties in the other table. This usually requires a third tables, to link the records together.

### [Stored Procedures](https://en.wikipedia.org/wiki/Stored_procedure)
We use a [StoredProc](https://en.wikipedia.org/wiki/Stored_procedure) to automate [DB](https://en.wikipedia.org/wiki/Database) tasks to run on periodically, or when a certain event occurs. These are scripts written in [SQL](https://en.wikipedia.org/wiki/SQL), which can be written to the database, and used to run queries, to read or change [DB](https://en.wikipedia.org/wiki/Database) data.

#### Example
The below [SProc](https://en.wikipedia.org/wiki/Stored_procedure) will return all data from our `USERS` table.
```sql
CREATE PROCEDURE SelectAllUsers
AS
SELECT * FROM USERS
GO;
```

To run the [procedure](https://en.wikipedia.org/wiki/Stored_procedure), execute the following in [SQL](https://en.wikipedia.org/wiki/SQL).
```sql
EXEC SelectAllCustomers;
```

## SQL

### Description
[SQL](https://en.wikipedia.org/wiki/SQL) is a [declarative](https://en.wikipedia.org/wiki/Declarative_programming) [programming language](https://en.wikipedia.org/wiki/Programming_language). This makes it different from most other languages you've encoutered, which use a [procedural](https://en.wikipedia.org/wiki/Procedural_programming) [paradigm](https://en.wikipedia.org/wiki/Programming_paradigm). Rather than writing [control flow](https://en.wikipedia.org/wiki/Control_flow) logic to change a program's state step-by-step, [SQL](https://en.wikipedia.org/wiki/SQL) uses a syntax that allows us to express computational logic, without explicitly defining flow. [SQL](https://en.wikipedia.org/wiki/SQL) has been commonplace since the mid-1980s, and is still the most common [DB](https://en.wikipedia.org/wiki/Database) languages, used on virtually all platforms. It comes in a variety of flavors, each of which look and work in a very similar way, much as a few features and syntaxes may differ between flavors.

### Flavors

#### [MySQL](https://www.mysql.com/)
The most common [open source](https://en.wikipedia.org/wiki/Open_source) flavor available. It can be found running on enumerable systems worldwide.

#### [T-SQL](https://en.wikipedia.org/wiki/Transact-SQL)
[Microsoft's](https://en.wikipedia.org/wiki/Microsoft) proprietary [SQL](https://en.wikipedia.org/wiki/SQL) extension. It adds functionality on top of traditional [SQL](https://en.wikipedia.org/wiki/SQL), to provide some [procedural](https://en.wikipedia.org/wiki/Procedural_programming) logic capabilities.

#### [PostgreSQL](https://www.postgresql.org/)
Another [open source](https://en.wikipedia.org/wiki/Open_source) [SQL](https://en.wikipedia.org/wiki/SQL) solution. It focuses on extensibility, is perfectly capable of handling a multitude of workloads, but still isn't as common as [MySQL](https://www.mysql.com/).

## DB Actions

### Description
To modifying data, [database](https://en.wikipedia.org/wiki/Database) systems rely on the four [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) actions.

### Create
Add a new record to a table.

### Read
Return values from certain portions of a table, without modifying them.

### Update
Change a record, in a row that already exists.

### Delete
Delete one or more rows in a table.

## [NoSQL](https://en.wikipedia.org/wiki/NoSQL) Databases

### Description
Given that [SQL](https://en.wikipedia.org/wiki/SQL) has been the norm for such a large portion of the computer industry's history, any [DB](https://en.wikipedia.org/wiki/Database) architecture that doesn't use it is called [NoSQL](https://en.wikipedia.org/wiki/NoSQL). In recent years, these have been gaining ground as better alternatives to [relational databases](https://en.wikipedia.org/wiki/Relational_database), which are notoriously brittle and prone to failure.

### MongoDB
The most common [NoSQL](https://en.wikipedia.org/wiki/NoSQL) database on the market, and is responsible for bring the [NoSQL](https://en.wikipedia.org/wiki/NoSQL) concept to public attention. Rather than tables, rows, and columns, [Mongo](https://en.wikipedia.org/wiki/MongoDB) uses [JSON-like](https://en.wikipedia.org/wiki/JSON), which are defined by [schema](https://en.wikipedia.org/wiki/Database_schema). Queries can be run [imperatively](https://en.wikipedia.org/wiki/Imperative_programming), using [JavaScript](https://en.wikipedia.org/wiki/JavaScript) and various extension [frameworks](https://en.wikipedia.org/wiki/Software_framework). Properly designed document structures can yield better performance than [SQL](https://en.wikipedia.org/wiki/SQL) databases.

#### Visualization
![Document Visualization](https://raw.githubusercontent.com/efournier92/Notes/master/Databases/Visuals/MongoDoc.png)

### [Firebase](https://firebase.google.com/)
With [Mongo's](https://en.wikipedia.org/wiki/MongoDB) increasing popularity, other companies are adopting similar structures. [Google Firebase](https://en.wikipedia.org/wiki/Firebase) writes documents to the [cloud](https://en.wikipedia.org/wiki/Cloud_computing) using a similar structure. Current trend indicate [NoSQL](https://en.wikipedia.org/wiki/NoSQL) sorts of databases are here to stay, and we'll likely be using them a lot more in the future. 

