require 'swagger_helper'

RSpec.describe 'api/favorites', type: :request do

  path '/api/favorites' do

    get('list favorites') do
      security [bearerAuth: []]

      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('Добавить в избранное') do
      security [bearerAuth: []]
      parameter name: :fruit_id,
                in: :query,
                type: :integer,
                description: "ID фрукта"

      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/favorites/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'fruit ID'

    delete('Удалить из избранного') do
      security [bearerAuth: []]
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
