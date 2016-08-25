require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "Validations" do

    it "requires a title" do
      p = Product.new
      p.valid?
      expect(p.errors).to have_key(:title)
    end

    it "requires a unique title" do
      Project.create({title: "valid title", body: "abc"})
      p = Project.new title: "valid title"
      p.valid?
      expect(p.errors).to have_key(:title)
    end


  end

end
