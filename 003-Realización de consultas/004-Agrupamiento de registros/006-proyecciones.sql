SELECT COUNT(color)
FROM productos; --resumen

SELECT 
COUNT(color) AS cantidad,
color
FROM productos
GROUP BY color
ORDER BY COUNT(color) ASC;
