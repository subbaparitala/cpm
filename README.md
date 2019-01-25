# README

# My apporach to the problem 
  
* Initally I created two Models 
   
   1.Placement with attributes id, name, start, end, cpm
   2. Delivery with attritubes placement_id, date, impressions
   
 * I started with importing the CSV files to the database with respective models. To do this I created a rake task which will do the          import   of csv files. I took precautions to not insert null values by adding the conditions in database.
  
 * Created a relationship between the models, Placement has_many deliveries and Delivery belongs_to placement.
  
  * For the first problem I worte a scope in Placement model called sum_of_impression which will get all the attributes with                   sum(impressions) for each category and calculating the cost of the impressions 
  
  * For the second problem I worte another scope in Placement model called search so that users can able to select the dates from the drop     down menu. This will calculate sum of impressions of every category in between the given dates and will give the total price.
  
  * I created views and respective actions in controllers to access these pages. 
  
  
# Why you picked the programming language/framework you used

  * I choose Ruby/Rails to easily create any new feature  and maintain the application. Easy to expand the application with the exsiting      code. Testing can be done from end to end.  Maintaing the csv files is difficult and storing/retreving them in database is easy. 
  * We can do this without using rails framework but using framework will allow us to create API's and other applications can consume and      see the results. 
  
  # How to run your code and tests, including how to install any dependencies your code may have.
  
  * To run the application clone or download the project to local space.
  
  * ruby versison 2.4.3
  * rails version 5.2.2
  
  Navigate to the project directory in terminal and type
  
  Step 1.
    `$  bundle install #this will install all the dependecies `  
  
  Step 2.
    ` $ rails db:create && rails db:migrate `
  
  Step 3.
    `$ rake speedy:import_placement `
    `$ rake speedy:import_delivery  `
 
 Step 4.
  `$  rails s `
 
 Step 5.
   go to localhost:3000 #here the report is present. click on range to select the dates and the get the total 
   
   To rub the test cases 
   
  ` $ rspec spec `

  
  
  
