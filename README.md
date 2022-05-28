# DMQL-Project


Download the ZIP file and do the following: 

--------------------------------------------------------------------------------------------
CREATING TABLE 
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
First create the tables by copying the [script from here] (https://github.com/mitalisable/DMQL-Project/blob/main/sql-scripts/create-table/new-script-for-table-creation.sql) and then running it on postgres.
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
   
   - In file, where you are asked to choose a file, choose the desired file by download the datasets from [here](https://github.com/mitalisable/DMQL-Project/tree/main/data-set)
   
   - Then, click yes on header and choose delimiter as, 

d. You should import the datasets in the following order:
      
   1. [Genre](https://github.com/mitalisable/DMQL-Project/blob/main/data-set/genre%20-%20Sheet1.csv)
   2. [Artist](https://github.com/mitalisable/DMQL-Project/blob/main/data-set/artist%20-%20Sheet1.csv)
   3. [Music](https://github.com/mitalisable/DMQL-Project/blob/main/data-set/music%20-%20Sheet1.csv)
   4. [Customer](https://github.com/mitalisable/DMQL-Project/blob/main/data-set/CustomerData.csv)
   5. [Survey](https://github.com/mitalisable/DMQL-Project/blob/main/data-set/Survey.csv)
   6. [Ratings](https://github.com/mitalisable/DMQL-Project/blob/main/data-set/Ratings.csv)
   7. [Favorites](https://github.com/mitalisable/DMQL-Project/blob/main/data-set/favourites%20-%20Sheet1.csv)
   8. [Billing](https://github.com/mitalisable/DMQL-Project/blob/main/data-set/Billing.csv)

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

--------------------------------------------------------------------------------------------
RUNNING THE UI (Bonus requirement)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
Steps to follow:
1. Clone the project from /bonus-requirement-UI/MusicDataStore/
2. Open the project in Visual studio and change the connection string to your local db setup 
3. Build the solution
4. Run the solution

For executing the queries on UI:
1. Enter the query in the textbox
2. Click on "Execute Query" button
3. Click on "Clear" button to clear the entered text in the textbox.
