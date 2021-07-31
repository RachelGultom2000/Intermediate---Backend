require './app/controllers/order_controller'
require './app/db/'

describe OrderController do
    describe '#' do
        before (:each) do
            client = create_db_client
            client.query("Delete from orders")
        end
        context 'when given valid parameters' do
            it 'should save order and render orders page' do
                params = {
                    'reference_no'  => 'ref',
                    'customer_name' => 'customer_name',
                    'date'          => 'date'
                }
                controller = OrderController.new

                response = controller.create(params)

                expected_order = Order.find_by_reference_no('ref')
                expect(expected_order).not_to be nil

                orders = Order.find_all
                expected_view = ERB.new(File.read('./views/index.erb')).result()
                expect(excpected_view).to eq(response)
            end
        end
    end
end