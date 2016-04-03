module ControllersSpecHelper
  def expect_success() expect(status).to eq(200) end
  def expect_redirect() expect(status).to eq(302) end
  def expect_redirect_to(path) expect(response).to redirect_to(path)end
  def expect_blocked() expect(status).to eq(401) end
  def expect_flash_alert(str) expect(response.body).to match(str) end
  def expect_sign_in() expect(response).to redirect_to(new_user_session_path) end

  def status() response.status end
end