module EmarsysLegacy

  # Methods for the Segment API
  #
  #
  class Segment < DataObject
    class << self

      # List segments
      #
      # @return [Hash] List of segments
      # @example
      #   EmarsysLegacy::Segment.collection
      def collection
        get 'filter', {}
      end

    end
  end

end