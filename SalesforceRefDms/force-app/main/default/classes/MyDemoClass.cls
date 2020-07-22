public with sharing class MyDemoClass {
    public MyDemoClass() {

    }

    public void greet(){
        System.debug('hello  world');
    }

    public static void runner(){
        MyDemoClass m1 = new MyDemoClass();
        m1.greet();
    }
}