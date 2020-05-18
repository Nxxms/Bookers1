class Book < ApplicationRecord
	validates :title, presence: true
	#presenceというのは「空白でない場合にtrue」となる
	validates :body, presence: true
end