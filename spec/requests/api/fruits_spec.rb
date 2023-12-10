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

  path '/api/fruits/{id}' do
    parameter name: :id, in: :path, description: 'ID'
    get('show fruits') do
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

  path '/api/fruits/create_user_fruit' do
    post('Создать данные за день по фруктам') do
      security [bearerAuth: []]
      consumes 'application/json'
      produces 'application/json'

      parameter name: :fruit,
                in: :body,
                schema: {
                    type: :object,
                    properties: {
                        fruit: {
                            type: :object,
                            properties: {
                                fruit_id: {
                                    type: :integer,
                                    description: "ID фрукта"
                                },
                            }
                        }
                    },
                },
                required: true

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
