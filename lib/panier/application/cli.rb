include Panier::Domain

module Panier
  module Application
    ##
    # A class responsible for handling the command line interface input.
    #
    class CLI
      EXIT_SUCCESS = 0
      EXIT_FAILURE = -1

      def initialize
        I18n.enforce_available_locales = false
        @service = SalesTaxService.new
      end

      ##
      # The main application loop.
      #
      def run
        begin
          print_welcome
          loop do
            prompt_for_input
          end
        rescue SignalException, Interrupt
          puts "\nExiting..."
        end

        EXIT_SUCCESS
      end

      private

      ##
      # Prints a welcome message and instructions about how to quit.
      #
      def print_welcome
        puts "Welcome to Panier.\n"
        puts 'Press Ctrl+C to exit.'
      end

      ##
      # Asks the user for input and processes it when given.
      #
      def prompt_for_input
        puts 'Enter some sample input, then leave a blank line to proceed.'

        input = []
        $stdin.each do |line|
          break if line.nil? || line.chomp.empty?
          input << line.chomp
        end

        input = input.join("\n")
        process_input(input) unless input.empty?
      end

      ##
      # Given a complete set of input, prints a receipt.
      #
      def process_input(input)
        begin
          puts @service.evaluate_input(input)
        rescue ArgumentError
          $stderr.puts 'The input was invalid.'
        end
        puts
      end
    end
  end
end
