SELECT
  order_detail.SalesOrderID,
  order_detail.SpecialOfferID,
  order_detail.OrderQty,
  order_detail.ProductID,
  order_detail.UnitPrice,
  order_detail.UnitPriceDiscount,
  offer.Type as DiscountType,
  offer.Category as DiscountCategory,
  offer.Description as DiscountDescription,
  order_detail.LineTotal,
  product.Name AS ProductName,
  product.Color,
  product.StandardCost,
  product.ListPrice,
  product.ProductSubcategoryID,
  subcategory.Name AS Subcategory,
  subcategory.ProductCategoryID,
  category.Name AS Category
FROM
  `tc-da-1.adwentureworks_db.salesorderdetail` order_detail
JOIN
  `tc-da-1.adwentureworks_db.product` product
ON
  product.ProductID = order_detail.ProductID
JOIN
  `tc-da-1.adwentureworks_db.productsubcategory` subcategory
ON
  product.ProductSubcategoryID = subcategory.ProductSubcategoryID
JOIN
  `tc-da-1.adwentureworks_db.productcategory` category
ON
  subcategory.ProductCategoryID = category.ProductCategoryID
JOIN
  `tc-da-1.adwentureworks_db.specialofferproduct` product_offer
ON
  order_detail.SpecialOfferID = product_offer.SpecialOfferID
  AND order_detail.ProductID = product_offer.ProductID
JOIN
  `tc-da-1.adwentureworks_db.specialoffer` offer
ON
  order_detail.SpecialOfferID = offer.SpecialOfferID