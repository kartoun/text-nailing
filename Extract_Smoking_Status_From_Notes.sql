select blob_text, dbo.GetSmokingStatus(GeneratedString1) as Smoking_Status
from
(
select t3.*
,(smok_blob + tob_blob + cig_blob) as GeneratedString1
from
(
select t2.*
,(case when smok_index>0 then lower((Select dbo.RemoveNonAlphaCharacters(substring(blob_text, charindex('smok', blob_text) - 100, +200)))) else '' end) as smok_blob
,(case when tob_index>0 then lower((Select dbo.RemoveNonAlphaCharacters(substring(blob_text, charindex('tob', blob_text) - 100, +200)))) else '' end) as tob_blob
,(case when cig_index>0 then lower((Select dbo.RemoveNonAlphaCharacters(substring(blob_text, charindex('cig', blob_text) - 100, +200)))) else '' end) as cig_blob
from
(
select t1.*
       ,(charindex('smok', blob_text)) as smok_index
       ,(charindex('tob', blob_text)) as tob_index
       ,(charindex('cig', blob_text)) as cig_index
from
(
SELECT blob_text
  FROM [Text_Nailing_DB].[dbo].[Clinical_Notes]  where blob_text like '%smok%' or blob_text like '%tob%' or blob_text like '%cig%'  
  ) as t1) as t2) as t3) as t4
  order by Smoking_Status

