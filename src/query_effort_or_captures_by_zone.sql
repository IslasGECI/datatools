SELECT
    '${fecha}' AS Fecha,
    CASE
        WHEN ID = 'NA' THEN 'NA'
        WHEN ID = 'SM4-Melpo' THEN '01'
        ELSE SUBSTR(ID, 4, 2)
    END AS Zona,
    COUNT(*) AS '${effort_or_captures}'
FROM '${table_name}'
WHERE ${conditional}
GROUP BY Zona
