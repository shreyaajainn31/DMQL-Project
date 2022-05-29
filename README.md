# DMQL-Project


Download the ZIP file and do the following: 

--------------------------------------------------------------------------------------------
CREATING TABLE 
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
First create the tables by copying the script.
Go to the folder sql-scripts -> create-table -> new-script-for-table-creation.sql 
and then copy the data. 

--------------------------------------------------------------------------------------------
IMPORTING DATASETS
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
Then, after copying the script, import the data. To import the data, do the following:
    
a. Go to schemas -> table

b. Right click on table option to refresh so that you can see all the tables created. 

c. Now, right click on table name and then click the import/export option. After that do the following: 
   
   - Click on import button
   
   - In file, where you are asked to choose a file, choose the desired file by download the datasets from data-set folder
   - Then, click yes on header and choose delimiter as, 

d. You should import the datasets in the following order:
      
   1. Genre
   2. Artist
   3. Music
   4. Customer
   5. Survey
   6. Ratings
   7. Favorites
   8. Billing

You can find above data’s inside the folder "data-set"

You can test whether the data is imported or not by running the following commands one by one:

select * from artist;

select * from billing;

select * from customer;

select * from favorites;

select * from genre;

select * from music;

select * from rating;

select * from survey;
