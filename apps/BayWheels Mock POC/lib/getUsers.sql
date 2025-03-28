SELECT * FROM sample_users
WHERE name ILIKE {{'%' + textInput1.value + '%' }}
AND email ILIKE {{'%' + textInput2.value + '%' }}
AND role ILIKE {{ '%' + textInput5.value + '%' }}
ORDER BY id
LIMIT 50