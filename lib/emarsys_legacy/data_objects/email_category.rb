module EmarsysLegacy

  # Methods for the EmailCategory API
  #
  #
  class EmailCategory < DataObject
    class << self

      # List email categories
      #
      # @return [Hash] List of email_categories
      # @example
      #   EmarsysLegacy::EmailCategory.collection
      def collection
        get 'emailcategory', {}
      end

    end
  end
end