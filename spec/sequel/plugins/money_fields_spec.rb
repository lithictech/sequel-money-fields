# frozen_string_literal: true

require "money"
require "monetize"
require "sequel"
require "sequel/model"

require "sequel/plugins/money_fields"

RSpec.describe Sequel::Plugins::MoneyFields, :db do
  context "with no fields given" do
    before do
      @db = Sequel.mock
      @c = Class.new(Sequel::Model(@db)) do
        set_columns([:id, :money_cents, :money_currency])
      end
      @c.plugin :money_fields
      @m = @c.new
    end

    # let(:model_object) { model_class.new }

    it "uses :money as the high-level accessor" do
      @m.money = "$1800"
      expect(@m.money).to be_a(Money)
      expect(@m.money_cents).to eq(180_000)
      expect(@m.money_currency).to eq("USD")

      @m.money = {cents: 200, currency: "CAD"}
      expect(@m.money_cents).to eq(200)
      expect(@m.money_currency).to eq("CAD")

      @m.money = OpenStruct.new(cents: 300, currency: "GBP")
      expect(@m.money_cents).to eq(300)
      expect(@m.money_currency).to eq("GBP")

      @m.money = {"cents" => 400, "currency" => "EUR"}
      expect(@m.money_cents).to eq(400)
      expect(@m.money_currency).to eq("EUR")
    end
  end

  context "with fields set to 'rent' and 'deposit'" do
    # let(:model_class) do
    #   mc = create_model(:money_fields_test) do
    #     primary_key :id
    #     integer :rent_cents
    #     text :rent_currency
    #     integer :deposit_cents
    #     text :deposit_currency
    #   end
    #   mc.plugin(:money_fields, :rent, :deposit)
    #   mc
    # end
    #
    # let(:model_object) { model_class.new }

    before do
      @db = Sequel.mock
      @c = Class.new(Sequel::Model(@db)) do
        set_columns([:id, :rent_cents, :rent_currency, :deposit_cents, :deposit_currency])
      end
      @c.plugin(:money_fields, :rent, :deposit)
      @m = @c.new
    end

    it "provides high-level accessors for each column" do
      @m.rent = 1250
      expect(@m.rent).to be_a(Money)
      expect(@m.rent.cents).to eq(125_000)
      expect(@m.rent_cents).to eq(125_000)
      expect(@m.rent_currency).to eq("USD")

      @m.deposit = "CAD 82.50"
      expect(@m.deposit).to be_a(Money)
      expect(@m.deposit.cents).to eq(82_50)
      expect(@m.deposit_cents).to eq(82_50)
      expect(@m.deposit_currency).to eq("CAD")
    end
  end
end
