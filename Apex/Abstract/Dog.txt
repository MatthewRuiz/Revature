public abstract class Dog extends Animal {
    //public override void sound() {
    //    System.debug('Bark');
    //}
    
    
    public override abstract void sound();
    
    // Concrete method (one that is not abstract)
    public void wagsTail() {
        System.debug('Wags tail');
    }
}