class ThanksMailer < ApplicationMailer
    default from: "hogehoge@example.com"

  def send_confirm_to_user(user)
    @user = user
    mail to: @user.email,
          subject: 'ユーザー登録が完了しました'
  end
end
