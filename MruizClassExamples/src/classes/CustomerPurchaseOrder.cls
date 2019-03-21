// Classes implement interfaces, opposed to extending like we do for classes
public class CustomerPurchaseOrder implements PurchaseOrder {
    public Double discount() {
        return .05;
    }
}