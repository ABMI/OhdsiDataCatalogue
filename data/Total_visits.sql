--Total visits (by inpatient, outpatient, emergency room, etc)
SELECT a.visit_concept_id, b.concept_name, a.count
FROM (SELECT visit_concept_id, count(*) as count FROM @schema.VISIT_OCCURRENCE group by visit_concept_id) a
LEFT JOIN @schema.concept b 
ON a.visit_concept_id = b.concept_id
