class ArticleMailer < ApplicationMailer
    def new_article(article)
        @article = article

        User.all.each do |user|
            mail(to: user.email, subject: "Nuevo post en Comer, Beber y Conocer!!!")
        end
    end
end
