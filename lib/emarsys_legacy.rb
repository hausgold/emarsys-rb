require "base64"
require 'json'
require 'rest_client'
require 'uri'

require 'emarsys_legacy/client'
require 'emarsys_legacy/data_object'
require 'emarsys_legacy/error'
require 'emarsys_legacy/extensions'
require 'emarsys_legacy/field_mapping'
require 'emarsys_legacy/params_converter'
require 'emarsys_legacy/request'
require 'emarsys_legacy/response'

require 'emarsys_legacy/data_objects/condition'
require 'emarsys_legacy/data_objects/contact_list'
require 'emarsys_legacy/data_objects/contact'
require 'emarsys_legacy/data_objects/email'
require 'emarsys_legacy/data_objects/email_category'
require 'emarsys_legacy/data_objects/email_launch_status'
require 'emarsys_legacy/data_objects/email_status_code'
require 'emarsys_legacy/data_objects/event'
require 'emarsys_legacy/data_objects/export'
require 'emarsys_legacy/data_objects/field'
require 'emarsys_legacy/data_objects/file'
require 'emarsys_legacy/data_objects/folder'
require 'emarsys_legacy/data_objects/form'
require 'emarsys_legacy/data_objects/language'
require 'emarsys_legacy/data_objects/segment'
require 'emarsys_legacy/data_objects/source'

require "emarsys_legacy/version"

# Ruby toolkit for the EmarsysLegacy API
module EmarsysLegacy
  class << self

    # @!attribute api_endpoint
    #   @return [String] Base URL for emarsys URLs. default: https://api.emarsys.net/api/v2
    # @!attribute api_password
    #   @return [String] API Username given by Emarsys
    # @!attribute api_username
    #   @return [String] API Username given by Emarsys

    attr_accessor :api_endpoint, :api_username, :api_password

    # Base URL for the EmarsysLegacy API
    #
    # @return [String] domain which should be used to query the API
    def api_endpoint
      @api_endpoint ||= 'https://api.emarsys.net/api/v2'
    end

    # Set configuration options using a block
    def configure
      yield self
    end

  end
end
