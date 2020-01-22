SELECT 
name AS [NAME], 
description AS [DESC], 
CASE WHEN (value_in_use=0) 
THEN 'OFF' 
ELSE 'ON' 
END AS [STATUS] 
FROM sys.configurations 
WHERE name IN (N'remote admin connections',N'backup compression default','optimize for ad hoc workloads') 
UNION 
SELECT 
name AS [NAME], 
description AS [DESC], 
CASE value_in_use 
WHEN 0 THEN 'AUTO' 
WHEN 1 THEN 'OFF' 
ELSE CONVERT(nvarchar(100),value_in_use) END AS [STATUS] 
FROM sys.configurations 
WHERE name IN (N'max degree of parallelism');