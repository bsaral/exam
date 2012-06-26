pdf.font_size 18
pdf.fill_color "#800517"
pdf.text "Görüntü berbatligina önem vermeyiniz ", :align => :center
pdf.text "ÖGRENCI" , :align => :left
pdf.move_down(30)

@say = -1
items = @examinations.map do |item|
  
  @say += 1
   		
  [  
        @say , 
        item.response.upcase
        
  ] 
   
end  

pdf.table items, :row_colors => ["FFFFFF", "DDDDDD"]
pdf.move_down(10)


pdf.fill_color "#990033"
pdf.text "HOCA"

@say = 0
items_h =  @quests.map do |j|

	 @say += 1
   		
  [  
        @say , 
        j.answer
        
  ] 
   
end  

pdf.table items_h, :row_colors => ["FFFFFF", "DDDDDD"]


	
    



