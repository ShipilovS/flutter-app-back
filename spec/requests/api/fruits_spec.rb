require 'swagger_helper'

RSpec.describe 'api/fruits', type: :request do

  path '/api/fruits/fruits_by_date' do

    get('fruits_by_date fruit') do
      security [bearerAuth: []]

      parameter name: :selected_date,
                in: :query,
                type: :date,
                description: "Поиск по дате"

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

  path '/api/fruits' do

    get('list fruits') do
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
  end
end
