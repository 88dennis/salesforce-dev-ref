public virtual class Vehicle {
     //you need to use the virtual keyword to inherit this class
    public void model(){
        System.debug('This is the model of the vehicle');
    }
    
    //if you want to override a method you need to use the virtual keyword as well
    public virtual void speed(){
        System.debug('speed of the vehicle running');
        
    }
    
    
  public static void runner(){
        Vehicle v1 = new Vehicle();
        v1.model();
      	//this will use the speed method of vehicle because v1 is pointing to the Vehicle Constructor
      	v1.speed();
        
      	//this will use the speed method of the truck because tr1 holds the address of the object being created (the constructor is a truckClass)
        Vehicle tr1 = new TruckClass();
        tr1.speed();
    }  

}