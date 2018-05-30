module EmarsysLegacy

  # Methods for the Lanugage API
  #
  #
  class Language < DataObject
    class << self

      # List languages
      #
      # @return [Hash] List of languages
      # @example
      #   EmarsysLegacy::Language.collection
      def collection
        get 'language', {}
      end

    end
  end
end