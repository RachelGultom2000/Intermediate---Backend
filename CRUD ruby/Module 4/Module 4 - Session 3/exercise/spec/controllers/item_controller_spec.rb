require './config/environment'
require './models/item'
require './controllers/items_controller'

describe ItemsController do
    describe "#create" do
        context "when given valid params" do
            client = create_db_client
            it "should save item" do
                params = {
                    id: 99,
                    name: "mie",
                    price: 6000,
                    category_name: "main dish",
                    category_id: 1
                }
                ItemsController.create_item(params)
                items = Item.all_with_categories

                expect(items.size).to eq(1) 
            end
        end
    end
end