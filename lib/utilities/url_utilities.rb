require 'uri'

module UrlUtilities
  ##
  # Add a parameter to the given URL and return the modified URL.
  #
  # @param url [String] The URL to which the parameter should be added.
  # @param param_name [String] The name of the parameter to be added.
  # @param param_value [String] The value of the parameter to be added.
  #
  # @return [String] The modified URL with the new parameter added.
  def add_param(url, param_name, param_value)
    uri = URI.parse url
    params = URI.decode_www_form(uri.query || '') << [param_name, param_value]
    uri.query = URI.encode_www_form(params)
    uri.to_s
  end
end
