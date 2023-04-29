require 'rails_helper'

RSpec.describe "HomePage", type: :request do
  describe "#index" do
    it"returns a 200 response" do
      get	root_path
      expect(response).to	have_http_status "200"
    end
  end
end
