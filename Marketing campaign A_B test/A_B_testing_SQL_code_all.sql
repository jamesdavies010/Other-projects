/* 

Aim: To determine the number of users who clicked banners during the New Year and Black Friday campaigns. Users are shown either version 1 (V1) or version 2 (V2) of the campaign. These data will later be compared using an A/B test. 

*/

WITH raw_ev_page_views AS (
  SELECT
    campaign,
    COUNT (DISTINCT user_pseudo_id) AS clicks_upd
  FROM `tc-da-1.turing_data_analytics.raw_events` AS raw_ev
  WHERE event_name = 'page_view' 
    AND campaign IN ('NewYear_V1', 'NewYear_V2', 'BlackFriday_V1', 'BlackFriday_V2')
  GROUP BY 1              
)
,

ads_month_partition AS (
  SELECT
    Month AS month,
    Campaign AS campaign,
    Impressions AS impressions,
    Clicks AS clicks,
  FROM `tc-da-1.turing_data_analytics.adsense_monthly` AS ads_mon
  WHERE month <> 202111 # to filter out Black Friday results from the following year
)
,

output AS (
  SELECT
    month,
    ads_month_partition.campaign,
    impressions,
    raw_ev_page_views.clicks_upd AS clicks
  FROM ads_month_partition
  JOIN raw_ev_page_views
    ON raw_ev_page_views.campaign = ads_month_partition.campaign
)

SELECT *
FROM output
