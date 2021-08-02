SELECT
    d.real_date AS fecha,
    jt.zona,
    jt.esfuerzo,
    CASE
         WHEN jt.capturas IS NULL THEN '0' ELSE capturas
    END AS capturas
FROM
    (SELECT
        e.fecha AS tmp_fecha,
        e.zona,
        e.esfuerzo,
        c.capturas
    FROM '${effort_table}' AS e
  LEFT OUTER JOIN '${captures_table}' AS c
  ON e.Fecha = c.Fecha AND e.Zona = c.Zona) AS jt
INNER JOIN '${real_and_tmp_dates_table}' AS d
ON d.tmp_date = jt.tmp_Fecha
