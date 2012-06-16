class AdminMailer < ActionMailer::Base
  default :to => User.all.map(&:email),
          :from => 'notification@vim-tips.org'

  def notice_email(tip)
    @tip = tip
    mail(:subject => 'Some one post a new tip!')
  end
end
