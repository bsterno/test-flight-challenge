require_relative "../../lib/airplane"

describe Airplane do
  let(:airplane) { Airplane.new("cessna", 10, 150) }

  describe "#type" do
    it "gives the type of airplane" do
      expect(airplane.type).to eq("cessna")
    end
  end

  describe "#start" do
    context "if calling start turns engine on" do
      it "returns true" do
        expect(airplane.start).to eq(true)
      end
    end
  end

  describe "#takeoff" do
    context "plane takes off if engine is on" do
      it "returns location is airborne" do
        airplane.start
        expect(airplane.takeoff).to eq('airborne')
      end
    end
    context "confirm only can takeoff if engine is on" do
      it "cannot take off if engine is off" do
        expect(airplane.takeoff).to eq('Turn me on first!')
      end
    end
    context "confirm cannot takeoff if already flying" do
      it "cannot take off if flying" do
        airplane.start
        airplane.takeoff
        expect(airplane.takeoff).to eq("You can't takeoff while flying")
      end
    end
  end

  describe "#landing" do
    context "plane lands when airborne and engine on" do
      it "location is changed to ground" do
        airplane.start
        airplane.takeoff
        expect(airplane.landing).to eq('ground')
      end
    end
    context "confirm can only land if engine is on" do
      it "cannot land if engine is off" do
        expect(airplane.landing).to eq("You can't land when you're on the ground!")
      end
    end
  end

  describe "#turn_off" do
    context "if calling turn_off turns engine off" do
      it "returns false" do
        expect(airplane.turn_off).to eq(false)
      end
    end
  end

end
