public with sharing class ExampleSets {

    public static void runner(){
        System.debug('Set Examples');
        ExampleSets s = new ExampleSets();
        s.setMethods();
    }

    public void setMethods(){

        //Set <DataType> someVar = new Set <DataType>();
        Set <Integer> s1 = new Set<Integer>();

        s1.add(2);
        s1.add(4);
        s1.add(5);
        s1.add(4);
        //the number 4 will not be added because Sets doesnt allow duplicates
        System.debug('s1 will not allow 4 ' + s1);

        Set <Integer> s2 = new Set<Integer>{2,4,6,6};
        System.debug('s2 will not allow 6 ' + s2);

        //STRING TYPE Set
        Set <String> strSet = new Set <String>{'this', 'is', 'a', 'string', 'set'};
        //if you print this, the elements inside the set are unordered
        System.debug(strSet);



    }
}
