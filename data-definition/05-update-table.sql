ALTER TABLE users 
CHANGE  nams full_name TEXT; 
-- this is how the change column name

ALTER TABLE users
MODIFY COLUMN full_name Varchar(10)
-- this is how the update column data type


ALTER TABLE users
ADD COLUMN hello Varchar(10)
-- this is how the add new column data type