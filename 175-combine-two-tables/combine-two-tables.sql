/* Write your T-SQL query statement below */
select
firstName
, lastName
, city
, state
from person
left join
address on person.personId = address.personId
Order by person.personId