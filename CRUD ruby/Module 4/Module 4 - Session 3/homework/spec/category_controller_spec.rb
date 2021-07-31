require_relative '../controllers/category_controller'
require_relative '../controllers/item_controller'
require_relative '../db/db_connector'

desribe Category_controller do

    before(:each) do
        client = create_db_client
        client.query('truncate item_categories')
        client.query('set FOREIGN_KEY_CHECKS = 0')
        client.query('truncate table items')
        client.query('truncate table categories')
        client.query('set FOREIGN_KEY_CHECKS = 1')
        client.query('insert into categories (name) values ("Apple Juice")')
    end

    describe '#show' do
        it "should show (view only)" do
            controller = Category_controller.new
            response = controller.show
            expected_view = ERB.new("views/show.erb")
            expect(response).to eq(expected_view.result)
        end
    end

    describe '#showWithData' do
            it "should show" do
                controller = Category_controller.new
                response = controller.list_categories
            end
        end
end