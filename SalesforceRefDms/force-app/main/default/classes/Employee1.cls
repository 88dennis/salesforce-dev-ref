public class Employee1 {
	public String name;
    public string designation;
    public void show(){
        System.debug('employee ' + name + ' ' + designation);
    }
    
    public static void runner(){
        Employee1 e1 = new Employee1();
        Employee1 e2 = new Employee1();
        
        e1.name = 'steve';
        e1.designation = 'manager';
        
        e2.name = 'john';
       	e2.designation = 'supervisor';
        
        e1.show();
        e2.show();
        
    }
     
}