SELECT
      salesorderheader.*,
      province.stateprovincecode as ship_province,
      province.CountryRegionCode as country_code,
      province.name as country_state_name
FROM `tc-da-1.adwentureworks_db.salesorderheader` as salesorderheader
INNER JOIN
     `tc-da-1.adwentureworks_db.address` as address
    ON salesorderheader.ShipToAddressID = address.AddressID
INNER JOIN
     `tc-da-1.adwentureworks_db.stateprovince` as province
    ON address.stateprovinceid = province.stateprovinceid