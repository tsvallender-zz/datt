RSpec.describe 'Note' do
  it "is invalid without content" do
    expect(Note.new).to be_invalid
    expect(Note.new('My note').to be_valid
  end
end
