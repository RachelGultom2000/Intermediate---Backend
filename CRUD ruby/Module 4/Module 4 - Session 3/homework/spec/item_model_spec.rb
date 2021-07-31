require_relative '../models/category'
require_relative '../models/item'
require_relative '../models/item_category'
require_relative '../db/db_connector'
require 'mysql2'

describe Item do

    before(:each) do
        client = create_db_client
        client.query('set FOREIGN_KEY_CHECKS = 0')
        client.query('truncate item_categories')
        client.query('truncate table items')
        client.query('truncate table categories')
        client.query('set FOREIGN_KEY_CHECKS = 1')
    end

   # Validate 
    describe '#validInitItem' do
        context 'init input item' do
            it 'should be true' do
                cat = Category.new("Hot Drink")
                item = Item.new("Bandrek Special",35000,cat)
                expect(item.valid?).to eq(true)
            end
        end 
    end

    # Validate get all
    describe '#validSelectAllItems' do
        context 'select all items' do
            it 'should be true' do
                item = Item.get_all_items
                expect(item.nil?).to eq(false)
            end
        end 
    end  


    # Validate get one
    describe '#validSelectItem' do
        context 'select data' do
            it 'there\'s a data' do
                item = Item.get_selected_item(2)
                expect(item.nil?).to eq(true)
            end
        end
    end


    # Validate insert (create)
    describe '#saveItem' do
        context 'save item data' do
            it 'input items' do
                category = Category.get_categories(1) 
                item = Item.new("Bandrek",30000,category)
                item.save
            end
        end
    end 

    # Validate update (edit)

    describe '#updateItem' do
        context 'update item data' do
            it 'input items' do
                category = Category.get_categories(1)
                item = Item.new("bandrek",30000,category)
                item.update
            end
        end
    end 

    describe '#updateItemParam' do
        context 'update #true' do
            it 'true' do

            end
        end

        context 'update #false' do

            it 'false' do
                stub_client = double 
                allow(Mysql2::Client).to receive(:new).and_return(stub_client)
                category = Category.new("Food")
                getItem = Item.new(4,"nasgor","20000",category)
                stub_query = "update items set name = 'nasgor', price = 20000 where id = 4"
                expect(stub_client).to receive(:query).with(stub_query)

                allow(stub_client).to receive(stub_query).and_return(false) 
                result = getItem.update
            end

            it 'true' do
                stub_client = double 
                allow(Mysql2::Client).to receive(:new).and_return(stub_client)
                category = Category.new("Food")
                getItem = Item.new(4,"nasgor","20000",category)
                stub_query = "update items set name = 'nasgor', price = 20000 where id = 4"
                expect(stub_client).to receive(:query).with(stub_query)

                allow(stub_client).to receive(stub_query).and_return(true) 
                result = getItem.update
            end
        end
    end 


    # Validate delete
    describe '#deleteItem' do
        context 'delete item data' do
            it 'input items' do
                category = Category.get_categories(1) # beverage
                item = Item.new("bandrek",30000,category)
                item.delete
            end
        end
    end 


end