require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe Sns_credential do
    describe '#create' do
      it "is invalid" do
       sns_credential = Sns_credential.new(uid:"", provider:"")
       sns_credential.valid?
       expect(sns_credential.errors[:]).to include("can't be blank")
      end
    end
  end
end
