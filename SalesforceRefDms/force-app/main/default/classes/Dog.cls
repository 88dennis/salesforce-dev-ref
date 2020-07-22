public class Dog {
    
    public String name;
    public integer age;
    
    public void disp() {
        system.debug('name of dog is ' + name);
        system.debug('age of dog is ' + age);
    }
    
    public static void runner(){
        Dog d1 = new Dog();
        d1.name = 'scooby';
        d1.age = 12;
        d1.disp();
    }
}