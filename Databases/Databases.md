# [Databases](https://en.wikipedia.org/wiki/Database)

## Contents

- [Overview](#overview)
- [Relational Databases](#relational-databases)
  - [Relationships](#relationships)
  - [Tables](#tables)
  - [Schema](#schema)
  - [SQL](#sql)
  - [DB Actions](#db-actions)
- [Non-Relational Databases](#non-relational-databases)
  - [MongoDB](#mongodb)
  - [Firebase](#firebase)

## Overview

A [database](https://en.wikipedia.org/wiki/Database) is a mechanism for persisting [data](https://en.wikipedia.org/wiki/Data) in an application. The way this has traditional been done is via [relational databasing](https://en.wikipedia.org/wiki/Relational_database). [SQL](https://en.wikipedia.org/wiki/SQL) is the most common language used to interact with a [relational database](https://en.wikipedia.org/wiki/Relational_database). Modern data-storage solutions have evolved to include non-relational, [NoSQL](https://en.wikipedia.org/wiki/NoSQL) databases, which are gaining popularity. That said, [SQL-based](https://en.wikipedia.org/wiki/SQL) [relational databases](https://en.wikipedia.org/wiki/Relational_database) are still the most common in 2020.

## [Relational Databases](https://en.wikipedia.org/wiki/Relational_database)

### Description

Have been around since 1970. They consist of related tables, each of which contains rows and columns.

### Tables

A set of data with consistent attributes. These attributes usually model an object, or part of one object.

#### Visual

![DB Table](https://raw.githubusercontent.com/efournier92/Notes/master/Databases/Visuals/Table.png)

#### Columns

Represent one of the table's properties.

#### Rows

Represents one object instance, with properties on the table.

#### Example

The below statement will create a new table, defining data types on four object properties, to be mapped to the table's columns.
```sql
CREATE TABLE USERS (
  Id        INT NOT NULL,
  LastName  VARCHAR(255),
  FirstName VARCHAR(255) NOT NULL,
  Birthday  DATE,
);
```

### [Schema](https://en.wikipedia.org/wiki/Database_schema)

Rules can be defined on a database, and on the tables it contains. These are defined in [schema](https://en.wikipedia.org/wiki/Database_schema). These rules are written in [SQL](https://en.wikipedia.org/wiki/SQL), and serve to ensure data integrity, by defining properties such as [data types](https://www.w3schools.com/sql/sql_datatypes.asp), mandatory properties, and user access rules. Above, we define some basic schema concerning the expected [data type](https://www.w3schools.com/sql/sql_datatypes.asp) for each property, and which columns cannot be [`NULL`](https://en.wikipedia.org/wiki/Null_(SQL)).

### Relationships

Different tables can be linked together using relationships. The first property in each table will be a unique identifier: these IDs are used to facilitate such linkages. Relationships can be any of the following.

#### One-to-One

Each table holds one (or no) reference to the primary key of the other table.

#### One-to-Many

A parent table holds references to the primary keys of numerous child tables.

#### Many-to-Many

Each property in both tables can relate to any number of properties in the other table. This usually requires a third table, to link the records together.

### [Stored Procedures](https://en.wikipedia.org/wiki/Stored_procedure)

We use a [StoredProc](https://en.wikipedia.org/wiki/Stored_procedure) to automate [DB](https://en.wikipedia.org/wiki/Database) tasks to run periodically, or when a certain event occurs. These are scripts written in [SQL](https://en.wikipedia.org/wiki/SQL), which can be written to the database, and used to run queries that read or change [DB](https://en.wikipedia.org/wiki/Database) data.

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
EXEC SelectAllUsers;
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

To modify data, [database](https://en.wikipedia.org/wiki/Database) systems rely on the four [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) actions.

### Create

Add a new record to a table.

### Read

Return values from certain portions of a table, without modifying them.

### Update

Change a record, in a row that already exists.

### Delete

Delete one or more rows in a table.

## [Non-Relational](https://en.wikipedia.org/wiki/NoSQL) Databases

### Description

Given that [SQL](https://en.wikipedia.org/wiki/SQL) has been the norm for such a large portion of the [industry's](https://en.wikipedia.org/wiki/Information_technology) history, any [DB](https://en.wikipedia.org/wiki/Database) architecture that doesn't use it is called [NoSQL](https://en.wikipedia.org/wiki/NoSQL). In recent years, these have been gaining ground as better alternatives to [relational databases](https://en.wikipedia.org/wiki/Relational_database), which are notoriously brittle and prone to failure.

### [MongoDB](https://en.wikipedia.org/wiki/MongoDB)

The most common [NoSQL](https://en.wikipedia.org/wiki/NoSQL) database on the market; responsible for bringing the [NoSQL](https://en.wikipedia.org/wiki/NoSQL) concept to public attention. Rather than tables, rows, and columns, [Mongo](https://en.wikipedia.org/wiki/MongoDB) uses [JSON-like](https://en.wikipedia.org/wiki/JSON) documents, which are defined by it's own [schema](https://docs.mongodb.com/manual/data-modeling/). Queries can be run [imperatively](https://en.wikipedia.org/wiki/Imperative_programming), using [JavaScript](https://en.wikipedia.org/wiki/JavaScript) and various extension [frameworks](https://en.wikipedia.org/wiki/Software_framework). Properly designed document structures can yield better performance than [SQL](https://en.wikipedia.org/wiki/SQL) databases.

#### Visualization

![Document Visualization](https://raw.githubusercontent.com/efournier92/Notes/master/Databases/Visuals/MongoDoc.png)

### [Firebase](https://firebase.google.com/)

With [Mongo's](https://en.wikipedia.org/wiki/MongoDB) increasing popularity, other companies are adopting similar structures. [Google Firebase](https://en.wikipedia.org/wiki/Firebase) writes documents to the [cloud](https://en.wikipedia.org/wiki/Cloud_computing) using a similar structure. Current trend indicate [NoSQL](https://en.wikipedia.org/wiki/NoSQL) sorts of databases are here to stay, and we'll likely be using them a lot more in the future. 

