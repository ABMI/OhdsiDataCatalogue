--Total number of care sites
SELECT COUNT(distinct care_site_id) as Total_number_of_care_sites
FROM @schema.CARE_SITE
