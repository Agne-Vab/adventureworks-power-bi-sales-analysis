SELECT
  customer.CustomerID,
  customer.CustomerType,
  contact.ContactId,
  CONCAT( 
    COALESCE(contact.Firstname, ''),
    CASE
      WHEN contact.MiddleName IS NOT NULL THEN ' '
    ELSE
    ''
    END, 
    COALESCE(contact.MiddleName, ''), ' ', 
    COALESCE(contact.LastName, '') ) AS Name,
  contacttype.Name AS ContactType
FROM
  `tc-da-1.adwentureworks_db.customer` AS customer
LEFT JOIN
  `tc-da-1.adwentureworks_db.individual` AS individual
ON
  customer.CustomerID = individual.CustomerID
LEFT JOIN
  `tc-da-1.adwentureworks_db.storecontact` AS storecontact
ON
  customer.CustomerID = storecontact.CustomerID
LEFT JOIN
  `tc-da-1.adwentureworks_db.contacttype` AS contacttype
ON
  contacttype.ContactTypeID = storecontact.ContactTypeID
JOIN
  `tc-da-1.adwentureworks_db.contact` AS contact
ON
  individual.ContactID = contact.ContactId
  OR storecontact.ContactID = contact.ContactId