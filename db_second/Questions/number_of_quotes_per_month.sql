select
  to_char(date_trunc('month', creation_date)::date, 'Month') as "Month",
  COUNT(quote_id) as "Quotes per month" 
  from fact_quotes
  group by date_trunc('month', creation_date)
  ORDER BY date_trunc('month', creation_date) ASC