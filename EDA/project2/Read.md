### The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.
Questions

#### You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.


   1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting 
   system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
   2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510"\color{red}{\verb|fips 
   == "24510"|}fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
   3. Of the four types of sources indicated by the type\color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) 
   variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have 
   seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
   
   4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
   5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
   6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
   in Los Angeles County, California (fips == "06037"\color{red}{\verb|fips == "06037"|}fips == "06037"). Which 
   city has seen greater changes over time in motor vehicle emissions?.
   
### Data

The data for this assignment are available from the course web site as a single zip file:

    Data for Peer Assessment [29Mb]

The zip file contains two files:

PM2.5 Emissions Data (summarySCC_PM25.rds\color{red}{\verb|summarySCC_PM25.rds|}summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.

    1. fips\color{red}{\verb|fips|}fips: A five-digit number (represented as a string) indicating the U.S. county
    2. SCC\color{red}{\verb|SCC|}SCC: The name of the source as indicated by a digit string (see source code classification table)
    3. Pollutant\color{red}{\verb|Pollutant|}Pollutant: A string indicating the pollutant
    4. Emissions\color{red}{\verb|Emissions|}Emissions: Amount of PM2.5 emitted, in tons
    5. type\color{red}{\verb|type|}type: The type of source (point, non-point, on-road, or non-road)
    6. year\color{red}{\verb|year|}year: The year of emissions recorded

Source Classification Code Table (Source_Classification_Code.rds\color{red}{\verb|Source_Classification_Code.rds|}Source_Classification_Code.rds): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.
