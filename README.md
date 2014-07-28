# Panier

This gem demonstrates the calculation of sales taxes for various kinds of line items on a receipt.

## Documentation

- [Application](docs/application.md)
- [Domain model](docs/domain_model.md)
- [Implementation notes](docs/implementation_notes.md)
- [Examples](docs/examples.md)

## Requirements

* Ruby 2.1.2+

## Installation

Install the gem using:

    $ gem install panier

## Usage

After installation, run the CLI by executing:

    $ panier
    
You will then be prompted for input.

    Welcome to Panier.
    Press Ctrl+C to exit.
    Enter some sample input, then leave a blank line to proceed.

Copy an [example](docs/examples.md) and paste it into the console.

    Quantity, Product, Price
    1, book, 12.49
    1, music CD, 14.99
    1, chocolate bar, 0.85

Leave a blank line to generate a receipt.

    1, book, 12.49
    1, music CD, 16.49
    1, chocolate bar, 0.85
    
    Sales Taxes: 1.50
    Total: 29.83

## Testing

Check out the source code:

    $ git clone git@github.com:bc-luke/panier.git
    $ cd panier

And then execute:

    $ bundle install

Finally, to run the test suite:

    $ rake


