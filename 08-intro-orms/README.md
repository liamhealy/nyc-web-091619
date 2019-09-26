## Intro to ORM

## SWBATs

* [ ] Follow code that is organized into different files
* [ ] Define Object Relational Mapper (ORM)
* [ ] Explain how the `sqlite` gem works as a driver or wrapper around SQL
* [ ] Implement HEREDOCs to be saved in variables to be executed by SQL driver
* [ ] Perform persistent CRUD actions on a model
* [ ] Distinguish between ORM and SQL
* [ ] Demonstrate that ORMs are the pattern connecting scripting languages and databases
* [ ] Explain to a peer all the things that happen when we call `Tweet.all` (your answer should include when SQL is fired & when Ruby objects are created)

## Object Relational Mapper (ORM)

* Pattern
  * maps database table to Ruby classes,table columns class attributes, and table rows to Ruby instance
  * Ruby classes are expressed in the singular, whereas the tables are plural
  * interface for our database, but in Ruby

* Benefits
  * all in ruby
  * maintainability and extensibility
  * swap out DB back end

## Domain Modeling and SQL Review

Draw out what your schema (structure of your tables and columns) would be for the following domains. Consider what tables are needed, what columns belong on which tables, and where the foreign keys belong.

1. Books and Authors where each book has a single author. Books should have a title and authors should have a name

#### Authors

| id | name          | 
|----|---------------|
|  1 | Dr. Zeus      |
|  2 | Anne Tyler    |
|  3 | Michael Grant |
|  4 | Dale Carnegie |
|  5 | Neil Gaiman   |


#### Books

| id | title                   | author_id |
|----|-------------------------|-----------|
| 1  | Green Eggs and Hercules     |     1  |
| 2  | Password Planet             |     2 |
| 3  | Save the Navy               |     2 |
| 4  | Snitchest get the Stitchest |     4 |
| 7  | American Gods               |     5 |

Q: Write the SQL to find all books written by a certain author given the author's id.

`SELECT * FROM books WHERE author_id = 1;`

Q: Write the SQL to find all books written by a certain author given the author's name.

```sql
SELECT *
FROM books
JOIN authors
ON books.author_id = authors.id
WHERE authors.name = "Dr. Zeus";
```

2. Books and Authors where each book can have one or multiple authors. Books should have a title and authors should have a name.

#### authors

| id | name          | 
|----|---------------|
|  1 | Dr. Zeus      |
|  2 | Anne Tyler    |
|  3 | Michael Grant |
|  4 | Dale Carnegie |
|  5 | Neil Gaiman   |
|  6 | Terry Pratchet|


#### book_authors - recipe_card, queue_item, appointment, blood_oath, role

| id | book_id | author_id |
|----|---------|-----------|
| 1  | 1       | 1         |
| 2  | 2       | 2         |
| 3  | 3       | 2         |
| 4  | 4       | 4         |
| 5  | 6       | 5         |
| 6  | 6       | 6         |
| 7  | 7       | 5         |

#### books

| id | title                         |
|----|-------------------------------|
| 1  | Green Eggs and Hercules       |
| 2  | Password Planet               |
| 3  | Save the Navy                 |
| 4  | Snitchest get the Stitchest   |
| 6  | Bad Omens (Good Omens pt. 11) |
| 7  | American Gods                 |


Q: Write the SQL to find all books written by a certain author given their name
author = Neil Gaiman

```sql
SELECT *
FROM books
JOIN book_authors
ON books.id = book_authors.book_id
JOIN authors
ON book_authors.author_id = authors.id
WHERE authors.name = "Neil Gaiman";
```


3. After completing the questions above, is there a rule you can determine about which table the foreign key belongs on given two associated tables?

* 1-to-many - FK belongs on the "belongs_to" table, the "many", the "books"
* many-to-many - FKs are on the join table


# CRUD REVIEW
What are the four ways we can interact with data?

* Create  
SQL: `INSERT INTO books (title) VALUES ("Harry Potter");`
Ruby: `Book.new("Harry Potter")`


* Read  
SQL: `SELECT * FROM books;`
Ruby: `Book.all`


* Update  
SQL: `UPDATE books SET title = "Harry Potter pt. 11" WHERE title = "Harry Potter";`
Ruby: `harry_potter.title = "Harry Potter pt. 11"`


* Destroy  
SQL: `DELETE FROM books WHERE title = "Harry Potter pt. 11"`
Ruby: `harry_potter.delete`
