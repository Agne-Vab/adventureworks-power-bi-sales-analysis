SELECT
  salesperson.SalesPersonID,
  employee.ContactID,
  employee.Title,
  CONCAT( 
    COALESCE(contact.Firstname, ''),
    CASE
      WHEN contact.MiddleName IS NOT NULL THEN ' '
    ELSE
    ''
    END, 
    COALESCE(contact.MiddleName, ''), ' ', 
    COALESCE(contact.LastName, '') ) AS Name
FROM
  `tc-da-1.adwentureworks_db.salesperson` salesperson
JOIN
  `tc-da-1.adwentureworks_db.employee` employee
ON
  salesperson.SalesPersonID = employee.EmployeeID
JOIN
  `tc-da-1.adwentureworks_db.contact` contact
ON
  employee.ContactID = contact.ContactId