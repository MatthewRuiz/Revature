public abstract class Shape implements Calculatable, Drawable{
	private Integer numberOfSides;
    
    public Integer getNumberOfSides() {
        return this.numberOfSides;
    }
    
    public void setNumberOfSides(Integer numberOfSides) {
        this.numberOfSides = numberOfSides;
    }
}