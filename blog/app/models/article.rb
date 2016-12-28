class Article < ApplicationRecord
    #El nombre de la tabla pasa a ser plural: articles
    #Se autogeneran los métodos: articlies.title()

    belongs_to :user
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true, length: {minimum: 20}
    #validates :username, format: { with /regex/} Validar cone expreciones regulares.
end
