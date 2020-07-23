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

        //OBJECT Set
        Set <Account> sObjSet = new Set<Account>();

        Account a1 = new Account(Name = 'Amazon');
        Account a2 = new Account(Name = 'Walmart');
        Account a3 = new Account(Name = 'Amazon', AccountNumber = '12345');
        Account a4 = new Account(Name = 'Amazon');

        sObjSet.add(a1);
        sObjSet.add(a2);
        sObjSet.add(a3);
        sObjSet.add(a4);

        //a4 will not be included
        //uniqueness of the sObjects get determined by the FIELD VALUES that it has
        //in this case a3 we defined a different field values in its constructor
        System.debug(sObjSet);
        //the size of the Set collection will return 3
        System.debug(sObjSet.size());

        //SOME METHODS of SETS
        //To explore more methods go to:
        //https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_methods_system_set.htm

        // Set<T>(setToCopy)
        Set<String> s4 = new Set<String>();
        s4.add('item1');
        s4.add('item2');
        Set<String> s5 = new Set<String>(s4);
        // The set elements in s2 are copied from s1
        System.debug(s5);

        // Set<T>(listToCopy)
        List<Integer> ls = new List<Integer>();
        ls.add(1);
        ls.add(2);
        // Create a set based on a list
        Set<Integer> s3 = new Set<Integer>(ls);
        // Elements are copied from the list to this set
        System.debug(s3);// DEBUG|{1, 2}

        
        List <Integer> numList = new List<Integer>{3,6,9};

        s3.addall(numList);// this method also takes a set arguement
        System.debug(s3); //automatically sorted in set;
        System.debug(s3.contains(3)); //true
        System.debug(s3.contains(56)); //false
        System.debug(s3.containsAll(numList)); //true
        System.debug(s3.size()); //5
        System.debug(s3); //{1,2,3,6,9}
        System.debug(s3.retainAll(numList)); //true
        System.debug(s3); //{3,6,9}

        Set <Integer> sCloned = s3.clone();
        System.debug(sCloned);

        s3.remove(3);
        System.debug(s3);
        s3.removeAll(numList);
        s3.clear();
        System.debug(s3);

        
        
    }
}
