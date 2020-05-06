class ReturnTo
  attr_accessor :default_url, :return_url

  def initialize(default_url, return_url)
    @default_url = default_url
    @return_url = return_url
  end

  def url
    return default_url unless return_url
    uri = URI.parse(return_url)
    path = uri.path
    path << "?" << uri.query if uri.query
    path << "#" << uri.fragment if uri.fragment
    path
  end
end