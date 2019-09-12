

class Image 
  attr_accessor :image
  def initialize (image)
    @image = image 

  end

 
  def output_image 
  
   @image.each do |array|
      puts array.join("")
    end
  end



  def transform(number = 1)
    n = number.to_s.to_i
    n.times do 
    b = Marshal.load(Marshal.dump(@image))
      @image.each_with_index do |row, y| 
        row.each_with_index do |_, x|
          if b[y][x] == 1 
              @image[y + 1][x] = 1 unless y == @image.length-1 
              @image[y - 1][x] = 1 unless y == 0
              @image[y][x + 1] = 1 unless x == @image.length-1
              @image[y][x - 1] = 1 unless x == 0

          end    
      
        end
      end  
    end
   
    
  end
end






image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

image.transform
image.output_image












