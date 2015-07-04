require 'rails_helper'

describe JobsController do
  let(:password) { 'SomethingSecret' }
  let(:user_attrs) { { first_name: 'Amy', last_name: "O'connnor", email: 'amy@example.com', password: password, password_confirmation: password } }
  describe '#index' do
    context 'when signed in' do
      before(:each) do
        @user = User.create!(user_attrs)
        sign_in @user
      end
      it 'only returns jobs belonging to the user' do
        # Batch slow / db hitting test expectations
        my_job = Job.create!(user: @user, status: :active, description: 'none', name: 'test', employment_type: :full_time)
        other_job = Job.create!(status: :active, description: 'other', name: 'test2', employment_type: :full_time)
        get :index
        expect(assigns(:jobs)).to include(my_job)
        expect(assigns(:jobs)).not_to include(other_job)
      end
    end
    context 'not signed in' do
      it 'returns no jobs' do
        Job.create!(status: :active, description: 'none', name: 'test', employment_type: :full_time)
        get :index
        expect(assigns(:jobs)).to be_nil
      end
    end
  end
end
