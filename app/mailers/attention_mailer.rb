class AttentionMailer < ApplicationMailer
    
    def attention(member, post)
        @member = member
        @post_members = post.comments.members.all
        emails = @post_members.collect(&:email).join(",")
        mail to: emails, subject: "#{@member.family_name}さんから新しいコメントがつきました。"
    end

end
