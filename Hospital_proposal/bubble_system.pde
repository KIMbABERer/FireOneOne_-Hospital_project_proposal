class BubbleSystem {
  
   ArrayList<Bubble> bubble;
   PVector origin;
   float quantity;
   
   BubbleSystem() {
     bubble = new ArrayList<Bubble>();
   }
   
   void addBubble(PVector loc) {
     bubble.add(new Bubble(loc));
   }
   
   void run() {
     Iterator<Bubble> it = bubble.iterator();
     while (it.hasNext()) {
       Bubble p = it.next();
       p.run();
       
       if(p.isDead()) {
         it.remove();
       }
     } 
   }
   
} 