require 'rails_helper'

describe Job, type: :model do
  describe '.search' do
    before(:each) do
      @job1 = Job.create!(user_id: 1, name: 'ACCOUNT', status: 'active', employment_type: :part_time, description: 'ok')
      @job2 = Job.create!(user_id: 1, name: 'Account Manager', status: 'active', employment_type: :part_time, description: 'ok')
      @job3 = Job.create!(user_id: 1, name: 'Executive account Manager', status: 'active', employment_type: :part_time, description: 'ok')
      @job4 = Job.create!(user_id: 1, name: 'Executive Sales Manager', status: 'active', employment_type: :part_time, description: 'ok')
    end
    context 'when given "Account"' do
      let(:search) { Job.search(terms: 'Account') }
      it 'returns Jobs with variations of "Account" in name' do
        expect(search).to include(@job1)
        expect(search).to include(@job2)
        expect(search).to include(@job3)
        expect(search).not_to include(@job4)
      end
    end
    context 'when given multiple partial terms' do
      let(:search) { Job.search(terms: 'Exec Manag') }
      it 'finds what it needs' do
        expect(search).not_to include(@job1)
        expect(search).to include(@job2)
        expect(search).to include(@job3)
        expect(search).to include(@job4)
      end
    end
  end
end
