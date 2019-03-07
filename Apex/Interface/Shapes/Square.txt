public class Square extends Rectangle {
    
    public Square(Integer sideLength) {
        System.debug('protected: ' + this.protectedVariable);
        this.height = sideLength;
        this.width = sideLength;
    }
    
    public void setHeight(Integer height) {
        this.height = height;
        this.width = height;
    }
    
    public void setWidth(Integer width) {
        this.height = height;
        this.width = width;
    }
    
    
}