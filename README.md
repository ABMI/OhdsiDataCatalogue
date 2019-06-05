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

user <- 'user'

password <- 'password'

server <- Sys.getenv('server')

port <- Sys.getenv('port')


cdmName <- 'your_cdm_name'

cdmDatabaseSchema <- 'your_cdm_schema

vocabDatabaseSchema <- 'your_vocab_schema'

resultDatabaseSchema <-"your_results_schema"


connectionDetails <- DatabaseConnector::createConnectionDetails(

							      dbms = dbms,
							      
                                                              server = server,
							      
                                                              user = user,
							      
                                                              password = password,
							      
                                                              port = port
							      )
                                                              
## Then run the following:
ConceptPrevalence::calculate (

 				 connectionDetails,
				 
  				 cdmName,
				 
				 cdmDatabaseSchema,
				 
 				 vocabDatabaseSchema,
				 
				 resultDatabaseSchema
				 
				 )
                                                         
License
=======
  ConceptPrevalence is licensed under Apache License 2.0

Development
===========
  ConceptPrevalence is being developed in R Studio.

