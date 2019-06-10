--method of data collection
  
  SELECT a.condition_source_concept_id, b.CONCEPT_NAME FROM 
  (SELECT DISTINCT condition_source_concept_id
  FROM CDMPv1.dbo.CONDITION_OCCURRENCE) a 
  LEFT JOIN CDMPv1.dbo.CONCEPT b 
  ON a.condition_source_concept_id = b.concept_id  