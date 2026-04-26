require 'rails_helper'

RSpec.describe Request, type: :model do
  describe 'validations' do
    it 'リクエスト登録' do
      request = create(:request)
      expect(request).to be_valid
    end

    it '利用開始日が空欄の場合は無効であること' do
      request = create(:request)
      request.start_date = ''
      expect(request).to be_invalid
    end

    it '利用終了日が空欄の場合は無効であること' do
      request = create(:request)
      request.end_date = ''
      expect(request).to be_invalid
    end

    it '利用終了日は利用開始日以降であること' do
      request = create(:request)
      request.end_date = Date.current - 1
      expect(request).to be_invalid
    end

    it '管理者を選択していない場合は無効であること' do
      request = create(:request)
      request.approver_id = ''
      expect(request).to be_invalid
    end
  end
end
