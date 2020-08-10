select company_name, number_elevators from dim_customers
where number_elevators > 0
group by company_name, number_elevators
order by number_elevators desc