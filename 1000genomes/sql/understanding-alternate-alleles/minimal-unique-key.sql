# This query demonstrates the minimal set of fields needed to  
# comprise a unique key for the rows in the table.
SELECT
  contig_name,
  position,
  alt,
  end,
  COUNT(1) AS cnt
FROM (
  SELECT
    contig_name,
    position,
    GROUP_CONCAT(alternate_bases) WITHIN RECORD AS alt,
    end,
  FROM
    [google.com:biggene:1000genomes.phase1_variants])
  GROUP EACH BY
  contig_name,
  position,
  alt,
  end
HAVING
  cnt > 1;