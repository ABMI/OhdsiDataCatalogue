##PATH
Query1 <- paste0(.libPaths()[1], "/OhdsiDataCatalogueD/data/method_of_data_collection.sql")
Query2 <- paste0(.libPaths()[1], "/OhdsiDataCatalogueD/data/Data_Start_date.sql")
Query3 <- paste0(.libPaths()[1], "/OhdsiDataCatalogueD/data/Total_number_of_patients.sql")
Query4 <- paste0(.libPaths()[1], "/OhdsiDataCatalogueD/data/Total_visits.sql")
Query5 <- paste0(.libPaths()[1], "/OhdsiDataCatalogueD/data/Total_number_of_providers.sql")
Query6 <- paste0(.libPaths()[1], "/OhdsiDataCatalogueD/data/Total_number_of_care_sites.sql")
Query7 <- paste0(.libPaths()[1], "/OhdsiDataCatalogueD/data/Total_number_of_specialties.sql")
#Call_DB function result list[[1]] = connectionDetails, list[[2]] = connection

catalogue_function <-function(connectionDetails,
                              connection){
  ##method of data collection
  sql <- SqlRender::readSql(Query1)
  sql <- SqlRender::renderSql(sql, schema=connectionDetails$schema)$sql
  sql <- SqlRender::translateSql(sql, targetDialect=connectionDetails$dbms)$sql
  method_data_collection <- DatabaseConnector::querySql(connection, sql)

  ##Data start date
  sql <- SqlRender::readSql(Query2)
  sql <- SqlRender::renderSql(sql, schema=connectionDetails$schema)$sql
  sql <- SqlRender::translateSql(sql, targetDialect=connectionDetails$dbms)$sql
  Data_start_date <- DatabaseConnector::querySql(connection, sql)

  ##Total number of patients
  sql <- SqlRender::readSql(Query3)
  sql <- SqlRender::renderSql(sql, schema=connectionDetails$schema)$sql
  sql <- SqlRender::translateSql(sql, targetDialect=connectionDetails$dbms)$sql
  Total_number_of_patients <- DatabaseConnector::querySql(connection, sql)

  ##Total visits (by inpatient, outpatient, emergency room, etc)
  sql <- SqlRender::readSql(Query4)
  sql <- SqlRender::renderSql(sql, schema=connectionDetails$schema)$sql
  sql <- SqlRender::translateSql(sql, targetDialect=connectionDetails$dbms)$sql
  Total_visits <- DatabaseConnector::querySql(connection, sql)

  ##Total number of providers
  sql <- SqlRender::readSql(Query5)
  sql <- SqlRender::renderSql(sql, schema=connectionDetails$schema)$sql
  sql <- SqlRender::translateSql(sql, targetDialect=connectionDetails$dbms)$sql
  Total_number_of_providers <- DatabaseConnector::querySql(connection, sql)

  ##Total number of care sites
  sql <- SqlRender::readSql(Query6)
  sql <- SqlRender::renderSql(sql, schema=connectionDetails$schema)$sql
  sql <- SqlRender::translateSql(sql, targetDialect=connectionDetails$dbms)$sql
  Total_number_of_care_sites <- DatabaseConnector::querySql(connection, sql)

  ##Total number of specialties
  sql <- SqlRender::readSql(Query7)
  sql <- SqlRender::renderSql(sql, schema=connectionDetails$schema)$sql
  sql <- SqlRender::translateSql(sql, targetDialect=connectionDetails$dbms)$sql
  Total_number_of_specialties <- DatabaseConnector::querySql(connection, sql)

  ##list method of data collection
  list_data <-list(method_data_collection,"SELECT a.condition_source_concept_id, b.CONCEPT_NAME
FROM (SELECT DISTINCT condition_source_concept_id
FROM @schema.[CONDITION_OCCURRENCE]) a
LEFT JOIN @schema.[CONCEPT] b
ON a.condition_source_concept_id = b.concept_id",
                   Data_start_date,"select min(observation_period_start_date) as Data_start_date from @schema.OBSERVATION_PERIOD",
                   Total_number_of_patients,"SELECT count(person_id) as Total_number_of_patients FROM @schema.PERSON",
                   Total_visits,"SELECT a.visit_concept_id, b.concept_name, a.count
                 FROM (SELECT visit_concept_id, count(*) as count FROM @schema.VISIT_OCCURRENCE group by visit_concept_id) a
                 LEFT JOIN @schema.concept b
                 ON a.visit_concept_id = b.concept_id",
                   Total_number_of_care_sites,"SELECT COUNT(distinct care_site_id) as Total_number_of_care_sites FROM @schema.CARE_SITE",
                   Total_number_of_specialties,"SELECT COUNT(distinct specialty_concept_id) as Total_number_of_specialties FROM @schema.PROVIDER"
  )
  names(list_data) <- c("method of data collection","method of data collection_SQLquery",
                        "Data start date","Data start date_SQLquery",
                        "Total number of patients","Total number of patients_SQLquery",
                        "Total visits","Total visits_SQLquery",
                        "Total number of care sites","Total number of care sites_SQLquery",
                        "Total number of specialties","Total number of specialties_SQLquery")
  return(list_data)
}

