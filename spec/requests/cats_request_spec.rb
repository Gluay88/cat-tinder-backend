require 'rails_helper'

RSpec.describe "Cats", type: :request do
    describe "GET /index" do
        it "gets a list of cats" do
            Cat.create(
                name: 'Felix',
                age: 2,
                enjoys: 'Walks in the park',
                image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
            )

            get '/cats'

            cat = JSON.parse(response.body)
            expect(response).to have_http_status(200)
            expect(cat.length).to eq 1
        end
    end

    describe "POST /create" do
        it "creates a cat" do
          # The params we are going to send with the request
          cat_params = {
            cat: {
              name: 'Buster',
              age: 4,
              enjoys: 'Meow Mix, and plenty of sunshine.',
              image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
            }
          }
      
          # Send the request to the server
          post '/cats', params: cat_params
      
          # Assure that we get a success back
          expect(response).to have_http_status(200)
      
          # Look up the cat we expect to be created in the db
          cat = Cat.first
      
          # Assure that the created cat has the correct attributes
          expect(cat.name).to eq 'Buster'
        end
      end

   
end
RSpec.describe "Cats", type: :request do
    describe "PATCH /update" do
        it "updates a cat" do
        # The params we are going to send with the request
        cat_params = {
            cat: {
            name: 'Buster',
            age: 4,
            enjoys: 'Meow Mix, and plenty of sunshine.',
            image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
            }
        }

        # Send the request to the server
        post '/cats', params: cat_params
        
        # Look up the cat we expect to be created in the db
        cat = Cat.first


        new_cat_params = {
            cat: {
            name: 'Biggs',
            age: 3,
            enjoys: 'Sunbathing.',
            image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
            }
        }

        # Updates the value insinde of the first cat
        patch "/cats/#{cat.id}", params: new_cat_params

        # Reassigns the value for the cat variable
        cat = Cat.first
     
        # Assure that we get a success back
        expect(response).to have_http_status(200)

        # Assure that the created cat has the correct attributes
        expect(cat.name).to eq 'Biggs'
        expect(cat.age).to eq 3
        end
    end
end