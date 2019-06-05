# OhdsiDataCatalogue

Introduction
==========
A package to show basic elements of the data catalogue automatically 

- Method of Data Collection (i.e. claims, EHR, etc)
- Data Start Date
- Total number of patients
- Total visits (by inpatient, outpatient, emergency room, etc)
- Total number of providers
- Total number of care sites
- Total number of specialties

Technology
==========
OhdsiDataCatalogue is an R package.

Dependencies
============
* SqlRender
* DatabaseConnector

Getting started
============
In R, use the following commands to download and install:

install.packages("devtools")

devtools::install_github("ABMI/OhdsiDataCatalogue")

library('OhdsiDataCatalogue')

## Add inputs for the site:

dbms <- 'your_dbms'

server <- 'server'

schema <- 'schema'

user <- 'user'

password <- 'password'

#port <- 'port'
                                                             
## Then run the following:
OhdsiDataCatalogue(
		
			dbms,
			 
  			server,
				 
			schema,
				 
 			user,
				 
			password
				 
		  )
                                                         
License
=======
  OhdsiDataCatalogue is licensed under Apache License 2.0

Development
===========
  OhdsiDataCatalogue is being developed in R Studio.

