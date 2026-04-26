require 'rails_helper'

RSpec.describe Device, type: :model do
  describe 'validations' do
    it 'デバイス登録' do
      device = build(:device)
      expect(device).to be_valid
    end

    it 'デバイスの種類が空欄の場合は無効であること' do
      device = build(:device)
      device.device_type = ''
      expect(device).to be_invalid
    end

    it 'シリアル番号が空欄の場合は無効であること' do
      device = build(:device)
      device.serial = ''
      expect(device).to be_invalid
    end

    it 'シリアル番号が重複した場合は無効であること' do
      create(:device, serial: "SN12345")
      device = build(:device, serial: "SN12345")
      expect(device).to be_invalid
    end

    it 'シリアル番号に英数字以外が含まれていた場合は無効であること' do
      device = build(:device, serial: "SNあいうえお")
      expect(device).to be_invalid
    end
  end
end
