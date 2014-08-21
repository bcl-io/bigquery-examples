# 'end' is not set when the record is not a reference-matching block or a
# structural variant
SELECT
  contig_name,
  start_pos,
  end_pos,
  reference_bases,
  GROUP_CONCAT(alternate_bases) WITHIN RECORD AS alt,
  GROUP_CONCAT(STRING(AC)) WITHIN RECORD AS ac,
  AN,
  CGA_BF,
  CGA_BNDG,
  CGA_BNDGO,
  GROUP_CONCAT(CGA_FI) WITHIN RECORD AS fi,
  GROUP_CONCAT(CGA_MEDEL) WITHIN RECORD AS medel,
  GROUP_CONCAT(CGA_MIRB) WITHIN RECORD AS mirb,
  GROUP_CONCAT(CGA_PFAM) WITHIN RECORD AS pfam,
  GROUP_CONCAT(CGA_RPT) WITHIN RECORD AS rpt,
  CGA_SDO,
  CGA_WINEND,
  GROUP_CONCAT(CGA_XR) WITHIN RECORD AS xr,
  GROUP_CONCAT(STRING(CIPOS)) WITHIN RECORD AS cipos,
  END,
  IMPRECISE,
  MATEID,
  GROUP_CONCAT(MEINFO) WITHIN RECORD AS meinfo,
  NS,
  SVLEN,
  SVTYPE
FROM
  [google.com:biggene:pgp.gvcf_variants]
WHERE
  svtype IS NULL
  AND END IS NOT NULL
  AND reference_bases != 'N'
LIMIT
  100