module EmarsysLegacy

  # Methods for the Condition API
  #
  #
  class Condition < DataObject
    class << self

      # List conditions
      #
      # @return [Hash] List of conditions
      # @example
      #   EmarsysLegacy::Condition.collection
      def collection
        get 'condition', {}
      end
    end

  end
end