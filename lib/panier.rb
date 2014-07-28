# Encoding: utf-8
require 'active_support'
require 'active_support/dependencies'

require 'panier/version'

# domain
require 'panier/domain/line_item'
require 'panier/domain/receipt'
require 'panier/domain/product'
require 'panier/domain/tax_class'
require 'panier/domain/product_service'
require 'panier/domain/round_up_rounding'

# application
require 'panier/application/input_reader'
require 'panier/application/cli'
require 'panier/application/sales_tax_service'

# decorators
require 'panier/decorators/decorator'
require 'panier/decorators/receipt_decorator'

##
# The module containing all the panier code.
#
module Panier
  relative_load_paths = %w(lib)
  ActiveSupport::Dependencies.autoload_paths += relative_load_paths
end
