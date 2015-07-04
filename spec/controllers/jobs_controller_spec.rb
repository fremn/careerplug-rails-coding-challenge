require 'rails_helper'

describe JobsController do
  let(:password) { 'SomethingSecret' }
  let(:user_attrs) { { first_name: 'Amy', last_name: "O'connnor", email: 'amy@example.com', password: password, password_confirmation: password } }
  let(:job_attrs) { { user: @user, status: :active, description: 'none', name: 'test', employment_type: :full_time } }
  let(:job_attrs_other_user) { { user_id: 999999, status: :active, description: 'other', name: 'test2', employment_type: :full_time } }
  describe '#index' do
    context 'when signed in' do
      before(:each) do
        @user = User.create!(user_attrs)
        sign_in @user
      end
      it 'only returns jobs belonging to the user' do
        # Batch slow / db hitting test expectations
        my_job = Job.create!(job_attrs)
        other_job = Job.create!(job_attrs_other_user)
        get :index
        expect(assigns(:jobs)).to include(my_job)
        expect(assigns(:jobs)).not_to include(other_job)
      end
    end
    context 'not signed in' do
      it 'returns no jobs' do
        Job.create!(job_attrs_other_user)
        get :index
        expect(assigns(:jobs)).to be_nil
      end
    end
  end
  describe '#create' do
    context 'when signed in' do
      before(:each) do
        @user = User.create!(user_attrs)
        sign_in @user
      end
      it 'allows users to create jobs' do
        expect { post :create, { job: job_attrs } }.to change { Job.count }.from(0).to(1)
      end
    end
    context 'not signed in' do
      it 'creates no jobs just redirects to /' do
        expect(post :create, { job: job_attrs_other_user }).to redirect_to root_path
        expect(Job.count).to eq(0)
      end
    end
  end
end
