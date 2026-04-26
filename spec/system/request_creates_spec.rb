require 'rails_helper'

RSpec.describe "RequestCreates", type: :system do
  before do
    # driven_by(:rack_test)
    driven_by(:selenium_chrome_headless)
  end

  let!(:user) { create(:user) }
  let!(:admin) { create(:user, authority: :admin, name: "管理者") }
  let!(:device) { create(:device) }

  it "一般ユーザーの利用申請を、管理者で承認できること" do
    # 一般ユーザーの操作
    visit new_user_session_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    click_on "USBメモリ"
    click_on "この機器を利用する"
    fill_in "利用開始日", with: Date.today
    fill_in "利用終了日", with: (Date.today + 7)
    select "管理者", from: "承認者", exact: true
    click_on "申請する"

    expect(page).to have_content "申請を登録しました"
    expect(page).to have_current_path devices_path

    click_on "ログアウト"
    expect(page).to have_current_path "/"
    expect(page).to have_content "ログイン"

    # 管理者ユーザーの操作
    visit new_user_session_path
    fill_in "メールアドレス", with: admin.email
    fill_in "パスワード", with: admin.password
    click_button "ログイン"

    click_on admin.name
    click_on "未承認申請"
    find(".stretched-link").click
    fill_in "コメント", with: "テストコメント"
    click_on "承認する"
    click_on "OK"

    expect(page).to have_content "申請を承認しました"
    expect(page).to have_current_path user_path(admin)
  end
end
