class UserMailer < ApplicationMailer

    def hello(member, post)
        @member = member
        @post_master = post.member
        mail to: @post_master.email, subject: "#{@member.family_name}さんから新しいコメントがつきました。"
    end
    
end



