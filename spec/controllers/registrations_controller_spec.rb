require 'rails_helper'

describe RegistrationsController, type: :controller do
  let(:params) do
    ActionController::Parameters.new({user: {
      first_name: 'Mike',
      last_name: 'Jones',
      email: 'jake@example.com',
      password: 'password1',
      password_confirmation: 'password1'
      }
    })
  end
  describe 'sign_up_params' do
    it 'returns needed params' do
      allow(subject).to receive(:params).and_return(params)
      expect(subject.sign_up_params.keys).to include("first_name",
                                                     "last_name",
                                                     "email",
                                                     "password",
                                                     "password_confirmation")
    end
  end
end
