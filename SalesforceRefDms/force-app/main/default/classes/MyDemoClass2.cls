public with sharing class MyDemoClass2 {
    public MyDemoClass2() {
    }

    public void greet(){
      System.debug('hello');

    }


    public static void runner() {
        MyDemoClass2 m1 = new MyDemoClass2();
            m1.greet();
    }
}