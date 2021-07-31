require_relative '../controllers/category_controller'
require_relative '../controllers/item_controller'
require_relative '../db/db_connector'

desCribe Item_controller do
    describe '#show' do
        it "should show (view only)" do
            controller = ItemController.new
            response = controller.show
            expected_view = ERB.new(File.read("views/show.erb"))
            expect(response.to eq(expected_view.result))
        end
    end

    describe '#showWithData' do
        it "should show" do
            controller = Item_controller.new
            response = controller.list_items
        end
    end
    
end