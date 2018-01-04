class FishSystem {
  
   ArrayList<Fish> fish;
   
   PVector origin;
   float quantity;
   
   FishSystem() {
     fish = new ArrayList<Fish>();
   }
   
   void addFish(PVector loc) {
     
     if(fish.size() < 20){
       fish.add(new Fish(loc));
     }
     
   }
   
   void run() {
     Iterator<Fish> it = fish.iterator();
     while (it.hasNext()) {
       Fish p = it.next();
       p.run();
       
       if(p.isDead()) {
         it.remove();
       }
     } 
   }
   
}