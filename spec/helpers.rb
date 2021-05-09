module Helpers
  def parsed_body
    json = JSON.parse(body)

    json.class == Hash ? json.deep_symbolize_keys : json
  end

  def body
    response.body
  end

  def random_name
    ('a'..'z').to_a.shuffle.join
  end
end
