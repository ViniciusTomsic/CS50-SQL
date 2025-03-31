SELECT artist FROM (
        SELECT artist, MAX(avg_contrast)
        FROM (
        SELECT AVG(contrast) AS avg_contrast, artist
        FROM views
        WHERE artist IN ('Hokusai', 'Hiroshige')
        GROUP BY artist));
