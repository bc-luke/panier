module Panier
  module Domain
    ##
    # A tax class is a value object that describes a particular type of tax or
    # duty applicable to products sold.
    #
    class TaxClass
      attr_reader :name, :rate

      ##
      # Initializes the tax class using the given name and rate.
      #
      # @param name [String] A display name for the tax class.
      # @param rate [Float] The rate of tax, where 0.1 would represent 10% tax.
      def initialize(name, rate)
        @name = name
        self.rate = rate
      end

      protected

      def rate=(rate)
        fail ArgumentError, ':rate must be non-negative' if rate < 0
        @rate = rate
      end
    end
  end
end
