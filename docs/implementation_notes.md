# Implementation notes

## Style

Because no web interface is necessary to demonstrate the core application code, the application has been implemented as a standalone gem with a command line interface.

## Assumptions

With regard to the given coding exercise, the following assumptions have been made.

* We are interested in calculating tax for the purposes of generating an itemised receipt.
* We assume a preexisting product catalog, where each product contains one more more tax classes.
* Products may be selected by the shopper from the preexisting product catalog. This catalog is limited to the items in the test data. Unknown items are ignored.
* The product name is the same for input and output. Some changes to input data had to be made to allow for discrepancies. TODO: Name the changes.
* There are some products with the same name and different prices. We can assume that these items are available in various sizes.

## Design considerations

### Input

The input is considered to be a selection of products from a preexisting catalog. The items are looked from the internal product service based on name and price. If neither match, no item is returned.

### Order workflow

In a real world application, the order domain class would have more states. For the purposes of this demonstration, only two states are defined: _awaiting payment_ and _completed_.

### Line items

The line item keeps a reference to the product's price and tax classes so that if the mutable product should change, the line item is unaffected. This is important because once a contract has been established between a merchant and a shopper via an order, the terms of that contract should not be changed.

The tax rounding calculation originally took place within the line item class. It was decided that making the policy of tax rounding more explicit by representing it in a standalone strategy object would be more expressive.

### Product service

This is an in-memory implementation, useful for testing, which contains only the products from the given input data. A real-world implementation would be backed by a database or web service.

### Decorator

The receipt decorator was created to separate the concern of formatting a receipt for display in CSV format from the receipt domain object.