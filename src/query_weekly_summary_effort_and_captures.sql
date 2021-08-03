SELECT
    d.real_date AS Fecha,
    jt.Zona,
    jt.Esfuerzo,
    CASE
        WHEN jt.Capturas IS NULL THEN '0' ELSE Capturas
    END AS Capturas
FROM
    (SELECT
        e.Fecha AS tmp_Fecha,
        e.Zona,
        e.Esfuerzo,
        c.Capturas
    FROM '${effort_table}' AS e
  LEFT OUTER JOIN '${captures_table}' AS c
  ON e.Fecha = c.Fecha AND e.Zona = c.Zona) AS jt
INNER JOIN '${real_and_tmp_dates_table}' AS d
ON d.tmp_date = jt.tmp_Fecha
