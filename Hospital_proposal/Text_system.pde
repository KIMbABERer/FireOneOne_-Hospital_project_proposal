class TextSystem {
  
   ArrayList<Text> text;
   PVector origin;
   
   TextSystem() {
     text= new ArrayList<Text>();
     articlesNum = 0;
   }
   
   void addText(PVector loc) {
     text.add(new Text(loc));
   }
   
   void run() {
     Iterator<Text> it = text.iterator();
     while (it.hasNext()) {
       Text p = it.next();
       p.run();
       
       if(p.isDead()) {
         it.remove();
         
         // New York Time articles loops
         if(articlesNum < 9) {
           articlesNum++;
         } else {
           articlesNum = 0;
         }
         
       }
     } 
   }
   
} 