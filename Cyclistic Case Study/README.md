# Cyclistic Case Study

**Scenario** 

You are a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share
company in Chicago. The director of marketing believes the company’s future success
depends on maximizing the number of annual memberships. Therefore, your team wants to
understand how casual riders and annual members use Cyclistic bikes differently. From these
insights, your team will design a new marketing strategy to convert casual riders into annual
members. But first, Cyclistic executives must approve your recommendations, so they must be
backed up with compelling data insights and professional data visualizations. Follow the steps of 
the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act

**Business task** 

* Analyze 12 months of bikeshare data and identify how annual members and casual members use Cyclistic bikes differently
* Recommend marketing strategies to convert casual riders into annual members

**Ask** 
1. How do annual members and casual riders use Cyclistic bikes differently? (the business analyst is responsible for answer this question specifically)

2. Why would casual riders buy Cyclistic annual memberships?

3. How can Cyclistic use digital media to influence casual riders to become members?

**Prepare** 

* All of the data for this analysis comes from the Coursera Data Analytics Professional Certificate course. The data is made available by
Motivate International Inc. under this <a href="https://https://divvybikes.com/data-license-agreement">license.</a> For the analysis, I used the data from April 2020 to March 2021. 


**Process** 

The data is contained in 12 cvs files, each for one month. Initialy I wanted to clean and explore the data in MySQL but since each file was so large (some containing more than 800,000 rows), I decided to clean the data in Excel first so the file sizes can be reduced.

To clean the data, I combined two files into a new workbook then performed the following steps to clean the data:

* checked for blanks and replaced values when possible by using the information from the other columns. If not, I would replace the blanks with either NA or '0'.
* checked and deleted duplications
* deleted the columns start_lat, end_late, start_lng, end_lng as they were not immediately relevant to the business task and to reduce file size
* added new column ride_length and calculated length of each ride
* reformatted all dates to yyyy-m-d h:mm:ss for MySQL

**Analyze** 

As I begun to analyze the data, I noticed two issues with the data. One was that there were many rides under 1 minute with the same started_at station name and ended_at station name. 
While it is possible for a user to take out a bike for a minute, it seemed unlikely that an actual trip had happened. Additionally, many of the station names were blank or indecipherable 
making it even less likely that they were authentic rides. The second concern was that there were also many rides that were unusually long. Some were multiple days. I took a look at 
Divvybikes's website (the company that Cyclistic received its data from) to see if users are allowed to take out bikes for that long but according to their company policy, all bikes 
taken out for more than 24 hours will incur a lost or stolen bike fee. However, since I can neither confirm or deny any of these assumptions, I decided to create two sets of data: 
one with all of the raw data and one that excludes the unusually short and long rides. 

Next, I created pivot tables for all of the data in Excel. I wanted to know these 3 things: what percentage of rides were from casual users and member users, what was the average ride_length for the different types of riders, which days were most popular for the different types of users, and the maximum ride length for the different types of riders.

Afterwards I imported all of the data onto MySQL and performed summary statistics for each of the tables just to see if they would match those from Excel. They did. Finally, I used Tableau to create visualizations for all of the data.

These were the key findings from my analysis:

* In the raw dataset, the overall average ride length for casual users is 40.79 minutes.
* In the raw dataset, the overall average ride length for member users is 16.10 minutes.
* In the dataset that excludes rides under 1 minute and rides longer than 24 hours, the overall average ride length for casual user is 36.90 minutes.
* In the dataset that excludes rides under 1 minute and rides longer than 24 hours, the overall average ride length for member users is 15.82 minutes.
  (As you can see, the differences in the average ride lengths in both dataset is insignificant. From here on, I continued to analyze the raw dataset only.)
* In all months, average ride lengths for casual users are longer than member users (interestingly they are almost always twice as long).
* The usage of bikes for casual users is significantly higher on Saturdays and Sundays than weekdays.
* The usage of bikes for member users is more even on all days. In most months, Wednesday and Friday had the most rides with the exception of a few months where Friday and Saturday were the highest.
* The variation in ride lengths is much wider for casual users than member users. 
* The top ten most used stations are different for causl users and member users.

**Share** 

<a href="https://public.tableau.com/app/profile/hui.liang/viz/CyclisticDashboard_17286675905190/CyclisticDashboard">Cyclistic Dashboard</a>

<a href="https://public.tableau.com/app/profile/hui.liang/viz/CyclisticCaseStudyPresentation_17285842100070/CyclisticPresentation">Cyclistic Presentation</a>



**Act**

From the analysis, I derived two trends in the way casual and member users used bikes. The first trend was that casual users were more likely to have longer rides than member users. The second trend was that casual users rode bikes on the weekend more than weekdays, whereas, member users rode bikes more on weekdays than weekends. Based on these trends, my recommendations for the marketing team to convert more casual users into annual users would be:

1. Offer weekend-only memberships to meet the demands of riders who only want to ride on weekends.
2. Expand the time range that members are allowed to take out bikes.
3. Create a referral system where member users can refer casual members to sign up for memberships and earn rewards for their referrals. 

