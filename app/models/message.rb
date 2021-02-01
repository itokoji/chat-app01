class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
  
  #validatesのunlessオプションにメソッド名を指定することで、「メソッドの返り値がfalseならばバリデーションによる検証を行う」という条件を作っています。
  validates :content, presence: true, unless: :was_attached?
  
  #指定されたwas_attached?メソッドは、self.image.attached?という記述によって、画像があればtrue、なければfalseを返す仕組みです。
    #これにより、画像が存在しなければテキストが必要となり、画像があればテキストは不要になりました。
  def was_attached?
    self.image.attached?
  end
end
