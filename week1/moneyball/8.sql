SELECT
    "salaries"."salary"
FROM
    "salaries"
WHERE
    "salaries"."player_id" = (
        SELECT
            "performances"."player_id"
        FROM
            "performances"
        WHERE
            "performances"."year" = 2001
        GROUP BY
            "performances"."player_id"
        ORDER BY
            SUM("performances"."HR") DESC
        LIMIT 1
    )
AND
    "salaries"."year" = 2001;
