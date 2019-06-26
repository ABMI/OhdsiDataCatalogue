--method of data collection
  
  SELECT a.condition_source_concept_id, b.CONCEPT_NAME FROM 
  (SELECT DISTINCT condition_source_concept_id
  FROM @schema.CONDITION_OCCURRENCE) a 
  LEFT JOIN @schema.CONCEPT b 
  ON a.condition_source_concept_id = b.concept_id  