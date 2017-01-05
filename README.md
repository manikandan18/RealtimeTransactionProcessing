# RealtimeTransactionProcessing
This project is developed as part of coding assignment on Java

Problem statement

ABC Health insurance company (fictitious company, for assignment purpose

only) provides various health plans to consumers. You have been requested to

design and implement claims transaction processing solution for three of its most

popular health insurance plans. These plans are detailed in the excel spread-

sheet SamplePlanAndTransactionData.

Details of tabs in the spread-sheet are as follows.

PlanDescriptions – Details about the plans.

PlanCoverage – What these plans covers, i.e. how much policyholder would

pay and how much plan will pay for various services.

PolicyData – This is sample policy data

SampleTransactions – Your program needs to process these transactions.

Your solution needs to be able to process transactions in batch mode as well as

in real time mode (getting web service calls from service providers such as

hospitals, pharmacies etc.)

SampleTransactionsProcessed – Details out how transactions were

processed with details such as how much policy holder needs to pay and how

much plan will pay along deductible and error information.

GUI – Users needs to be able to provide

a) Location of the input transaction file

b) Location of output file (processed file)

For batch processing, users should be able make a call at command line, for

example,

<nameOfTheService> <inputTransactionFile> <outputTransactionFile>

inputTransactionFile – Contains transactions in comma delimited (csv)

format.

outputTransactionFile – Contains processed transaction in comma

delimited (csv) format.

Real time web services calls can be simulated using curl and/or through

browser. In the request, you will need to pass “Individual accumulated

deductible for this year (2016)” and “Family accumulated

deductible for this year (2016)” for correct calculation to happen.

Solution
There are many ways to acheive this. But below solution was proposed by me.

My Solution involves integration of below:-

Spring MVC + Spring Hibernate + Spring Batch + Spring (@RestController for Web service Real time transactions) + MySql (as data store) + JSP (with AJAX, JQuery, JavaScript function calls) 
+ Tomcat. You can take a look at my pom.xml to check for versions I used. Also, my solution involves full 
Java configuration with annotations for Spring dependencies. No XMLs are used. Not even web.xml. 
Everything configured with Java annotations.

Spring MVC - For running transactions through GUI (with input and output file names). The sample input and output screens are attached.

Spring Hibernate - For DAO operations with JPA annotations.

Spring Batch - For persisting the transactions processed in DB as well as csv file. 
I used CompositeItemWriter of Spring Batch to write in different data stores within single transaction.
I wrote the custom ItemProcessor to handle the business logic (all calculations for insurance).

Spring @RestController - To utilize the Rest services for real time transactions. 
I didn't use Jersey with Spring to avoid 2 different flows.
I just spawned 2 servlets (one for GUI and other for RESTful) with different url mapping to achieve it. 

Ajax and JQuery - In Client side to call the http POST method to handle the transactions in real time. 
Used GSON for Json parsing. The resultant Json data from server is converted to html and displayed in tabular form. 
The sample data is attached.

Tomcat - I used as Web server.

Command Line - Usually, I will write a Bash script calling the Jar with the cron in Linux. 
But here, I created main method in ProcessTransactionFromCommandLine.java which takes the input and output file names 
as args which I've set in Eclipse arguments section. This has to be modified to your own locations.
You can run this from Eclipse using 'Run as -> Java Application' to see the result. 


