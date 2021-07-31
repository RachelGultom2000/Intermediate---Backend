require_relative '../../models/item'
require_relative '../../mysql_connector'

describe Item do
    describe "#update" do
        context "when update successfull" do
            it "should change name from book to comic and price 75000 to 150000" do
                client = create_db_client
                book = Item.new("book",75000,1)
                comic = Item.new("comic",75000,1)
                client.query("insert into items(name, price) values ('#{book.name}'.#{book.price})")

                book.update(comic.name, comic.price, book.id)

                expect(book.name).to eq(comic.name)
                expect(book.price).to eq(comic.price)
                
            end
    end
end