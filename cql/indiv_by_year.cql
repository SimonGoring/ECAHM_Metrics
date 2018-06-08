MATCH (y:Year)-[:Year_Started]-(a:Award)-[:Awarded_to]-(p:Person)-[:Awarded_to]-(:Award {EarthCube: 1})-[:Year_Started]-(ys:Year),
      (a)-[:Funded_by]-(dr:Directorate)
RETURN y.Year         AS awd_year,
       a.AwardAmount  AS value,
       dr.Directorate AS directorate, 
       p.FirstName    AS firstname, 
       p.LastName     AS lastname,
       ys.Year        AS ec_year
