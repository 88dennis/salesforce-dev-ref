public class Cat {
    
    private String name;
   private Integer size;
    
    public Cat(Integer s, String n) {
        size = s;
        name = n;
    }
    
    public Cat(){
        
    }
    
    public String getName(){
        return name;
    }
    
    public Integer getSize(){
        return size;
    }
        
    public void setSize(Integer s) {
        if(s < = 0 ){
            system.debug('set a valid value');
            size = 10;
        } else {
            size = s;
        }
    }
    
    public void setName(String n){
        name = n;
    }
    public void show(){
        System.debug('catname = ' + getName());
        System.debug('cat size = ' + getSize());
    }
    
    
    public static void runner(){
        
        Cat c1 = new Cat();
        c1.setName('cloud');
        c1.setSize(24);
        c1.show();
        
        Cat c2 = new Cat(12, 'nimby');
        c2.show();
}
}