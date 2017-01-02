class Article < ApplicationRecord
    #El nombre de la tabla pasa a ser plural: articles
    #Se autogeneran los métodos: articlies.title()

    belongs_to :user
    has_many :comments
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true, length: {minimum: 20}
    #validates :username, format: { with /regex/} Validar cone expresiones regulares.

    before_create :set_visits_count

    has_attached_file :cover, styles: { medium: "1280x720", thumb: "800x600" }
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

    def update_visits_count
        self.update(visits_count: self.visits_count + 1)
    end

    private
    def set_visits_count
        self.visits_count = 0
    end
end
