# Domain model

## Order

An order represents the intent of a shopper to purchase a selection of products. It defines a number of _states_, between which transitions occur due to _events_. In this demonstration, the limited set of states is defined as:

<dl>
  <dt>Pending</dt>
  <dd>
    <p>The initial order state. It transitions to <em>awaiting payment</em> after submission via the <em>submit</em> event.</p>
  </dd>

  <dt>Awaiting payment</dt>
  <dd>
    <p>The shopper intends to purchase the items that make up the order, but has yet to pay. It transitions to <em>completed</em> after payment via the <em>pay</em> event.</p>
  </dd>

  <dt>Paid</dt>
  <dd>
    <p>The payment has been completed. In this demonstration, it is the final state.</p>
    <p>When the order is in this state, a receipt may be generated.</p>
  </dd>
</dl>

## Receipt

A receipt is a value object describing a payment that has been made by a shopper to a merchant in relation to an order.

## Line item

A line item is a value object representing a single line of an order. It describes the item represented and contains a reference to it, has a quantity, a unit amount, a tax class and can calculate its total amount and total tax.

## Product

A product is a purchasable item with a price and one or more tax classes that allow taxes to be calculated accurately.

## Tax class

A tax class is a value object that describes a particular type of tax or duty applicable to products sold. It has a name and a rate.

Its association with a product means that the orders made for that product are subject to tax at the rate represented by the tax class.

References to tax classes are held by a line item and used in the calculation of tax for that item. 