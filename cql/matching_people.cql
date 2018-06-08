MATCH (p:Person)-[:Awarded_to]-(n:Award {EarthCube: 1})-[]-(n2:Award {EarthCube: 1})-[:Awarded_to]-(p2:Person)
      (n)-[:Year_Started]-(y:Year)
      (n)-[:Funded_by]-(dr:Directorate)
RETURN p.FirstName AS awdaFirst, p.LastName AS awdaLast, n.AwardID, n2.AwardID, y.Year, dr.Directorate;

# Collaboration with people in EarthCube:
MATCH (p:Person)-[:Awarded_to]-(n:Award {EarthCube: 1}),
      (y:Year)-[:Year_Started]-(n)-[:Funded_by]-(dr:Directorate)
WITH n, p, y, dr
OPTIONAL MATCH (n)-[:Collaborates]-(n2:Award)-[:Awarded_to]-(p2:Person)
RETURN p.FirstName, p.LastName, n.AwardID, n2.AwardID, y.Year, dr.Directorate;

# Collaboration with people in EarthCube:
MATCH (p:Person)-[:Awarded_to]-(n:Award {EarthCube: 1}),
WITH p
MATCH (p:Person)-[:Awarded_to]-(n:Award),
      (y:Year)-[:Year_Started]-(n)-[:Funded_by]-(dr:Directorate)
WITH n, p, y, dr
OPTIONAL MATCH (n)-[:Collaborates]-(n2:Award)-[:Awarded_to]-(p2:Person)
RETURN p.FirstName, p.LastName, n.AwardID, n2.AwardID, y.Year, dr.Directorate;