public class TruckClass extends Vehicle {
		
    // you need to use the override keyword
    public override void speed() {
        System.debug('This is the truck speed. Overriden from the parent method');
    }
}