require 'rspec'

require_relative '../lib/game_engine'

RSpec.describe GameEngine do
  subject(:engine) { GameEngine.new.tap { |e| e.instance_variable_set(:@secret_code, "ABCD") } }

  describe "#initialize" do
    it "initializes with a secret code and 10 attempts" do
      engine = GameEngine.new
      expect(engine.secret_code).to be_a(String)
      expect(engine.secret_code.length).to eq(4)
      expect(engine.secret_code).to match(/[A-H]{4}/)
      expect(engine.attempts).to eq(10)
    end
  end

  describe "#check_guess" do
    context "when the guess is a full correct match" do
      it "returns 'XXXX'" do
        result = engine.check_guess("ABCD")
        expect(result).to eq("XXXX")
      end
    end

    context "when the guess has some correct in the right place and some correct in the wrong place" do
      it "returns the correct checksum" do
        result = engine.check_guess("ADCB")
        expect(result).to eq("XXOO")
      end
    end

    context "when the guess has some correct in the right place, some correct in the wrong place, and some totally incorrect" do
      it "returns the correct checksum" do
        result = engine.check_guess("ADBE")
        expect(result).to eq("XOO-")
      end
    end

    context "when the guess has some correct in the wrong place and some totally wrong" do
      it "returns the correct checksum" do
        result = engine.check_guess("EEDA")
        expect(result).to eq("OO--")
      end
    end

    context "when the guess is all totally wrong" do
      it "returns '----'" do
        result = engine.check_guess("EFGH")
        expect(result).to eq("----")
      end
    end
  end

  describe "private #generate_secret_code" do
    it "generates a valid secret code of length 4 with letters A-H" do
      engine = GameEngine.new
      secret_code = engine.send(:generate_secret_code)

      expect(secret_code).to be_a(String)
      expect(secret_code.length).to eq(4)
      expect(secret_code).to match(/[A-H]{4}/)
    end
  end
end