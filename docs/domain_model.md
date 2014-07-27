# Domain model

## Receipt

A receipt is a value object describing a payment that has been made by a shopper to a merchant in relation to an order.

## Line item

A line item is a value object representing a single line a receipt. It describes the item represented and contains a reference to it, has a quantity, a unit amount, a tax class and can calculate its total amount and total tax.

## Product

A product is a purchasable item with a price and one or more tax classes that allow taxes to be calculated accurately.

## Tax class

A tax class is a value object that describes a particular type of tax or duty applicable to products sold. It has a name and a rate.

Its association with a product means that the orders made for that product are subject to tax at the rate represented by the tax class.

References to tax classes are held by a line item and used in the calculation of tax for that item. 