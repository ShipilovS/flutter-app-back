require 'swagger_helper'

RSpec.describe 'api/authentication', type: :request do
  path '/api/authentication/login' do
    post('Get Token') do
      tags 'Auth'
      consumes 'application/json'
      produces 'application/json'
      #
      parameter name: :auth,
                in: :body,
                schema: {
                    type: :object,
                    properties: {
                        email:    { type: :string },
                        password: { type: :string },
                    }
                }

      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/authentication/refresh' do
    post('Get Token') do
      tags 'Auth'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :refresh_token,
                in: :query,
                type: :string,
                description: 'refresh_token'

      response(200, 'successful') do
        run_test!
      end
    end
  end
end
