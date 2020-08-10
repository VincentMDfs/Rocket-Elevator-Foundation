select
  to_char(date_trunc('month', creation_date)::date, 'Month') as "Month",
  COUNT(contact_id) as "Contacts per month" 
  from fact_contact
  group by date_trunc('month', creation_date)
  ORDER BY date_trunc('month', creation_date) ASC