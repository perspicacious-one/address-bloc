require_relative '../models/address_book'

 RSpec.describe AddressBook do

   describe "attributes" do
    let(:book) { AddressBook.new }

    it "responds to entries" do
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an array" do
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
      expect(book.entries.size).to eq(0)
    end
   end

   describe "#add_entry" do
     it "adds only one entry to the address book" do
       book = AddressBook.new
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

       expect(book.entries.size).to eq(1)
       p book
     end

     it "adds the correct information to entries" do
       book = AddressBook.new
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       new_entry = book.entries[0]

       expect(new_entry.name).to eq('Ada Lovelace')
       expect(new_entry.phone_number).to eq('010.012.1815')
       expect(new_entry.email).to eq('augusta.king@lovelace.com')
       p new_entry
     end
   end

    describe "#remove_entry" do
      let(:book) { AddressBook.new}

      it "removes only one entry" do
        book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        book.add_entry('John Lovelace', '010.012.1816', 'john.king@lovelace.com')

        expect(book.entries.size).to eq(2)
        p book
        book.remove_entry('John Lovelace', '010.012.1816', 'john.king@lovelace.com')
        expect(book.entries.size).to eq(1)
        p book
      end

      it "removes the last entry" do
        book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        book.add_entry('John Lovelace', '010.012.1816', 'john.king@lovelace.com')
        entry_one = book.entries[0]

        book.remove_entry('John Lovelace', '010.012.1816', 'john.king@lovelace.com')
        expect(book.entries[0]).to eq(entry_one)
        expect(book.entries[1]).to eq(nil)
        p book
      end

      it "removes the first entry" do
        book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        book.add_entry('John Lovelace', '010.012.1816', 'john.king@lovelace.com')
        entry_two = book.entries[1]

        book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        expect(book.entries[0]).to eq(entry_two)
        p book
      end
    end

 end
