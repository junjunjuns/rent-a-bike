class Bike < ActiveRecord::Base
    has_many :rental, :dependent => :destroy
    has_many :review
    
    def self.search(search)
        where("manufacturer LIKE ? OR color LIKE ? OR description LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
    
    has_attached_file :image, 
    :path => ":rails_root/app/assets/images/:attachment/:id/:basename_:style.:extension",
    :url => "/assets/:attachment/:id/:basename_:style.:extension",
    :styles => {
      :thumb    => ['100x100#',  :jpg, :quality => 70],
      :preview  => ['480x480#',  :jpg, :quality => 70],
      :large    => ['600>',      :jpg, :quality => 70],
      :retina   => ['1200>',     :jpg, :quality => 30]
    },
    :convert_options => {
      :thumb    => '-set colorspace sRGB -strip',
      :preview  => '-set colorspace sRGB -strip',
      :large    => '-set colorspace sRGB -strip',
      :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
    }
end
