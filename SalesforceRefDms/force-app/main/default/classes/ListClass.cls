public class ListClass {
    
    
    public static void runner(){
        
        List<String> obj = new List<String>();
        
        obj.add('dennis');
        obj.add(0, 'jeff');
        obj.add(0, 'ta');
        
        System.debug('lenght is ' + obj.size());
                System.debug('lenght is ' + obj);
        
        
        //LIST TO COPY
        List<Integer> ls1 = new List<Integer>();
ls1.add(1);
ls1.add(2);
// Create a list based on an existing one
List<Integer> ls2 = new List<Integer>(ls1);
// ls2 elements are copied from ls1
System.debug(ls2);// DEBUG|(1, 2)
        
        
        
        
        //ADD METHOD
        List<Integer> myList = new List<Integer>();
        myList.add(47);
        Integer myNumber = myList.get(0);
        system.assertEquals(47, myNumber);
        
        system.debug('myNumber ' + myList.get(0));
        
        //add(index, listElement)
//Inserts an element into the list at the specified index position.
        List<Integer> myList2 = new Integer[6];
        myList2.add(0, 47);
        myList2.add(1, 52);
        system.assertEquals(52, myList2.get(1));
        
        
    }
}