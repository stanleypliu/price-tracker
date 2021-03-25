module Helpers
  def parsed_body
    json = JSON.parse(body)

    json.class == Hash ? json.deep_symbolize_keys : json
  end

  def body
    response.body
  end
end