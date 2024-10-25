package model;

import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Cart {
    private List<CartItems> items;
    private float totalPrice;
    
    public Cart() {
    }

    public Cart(List<CartItems> items, float totalPrice) {
        this.items = items;
        this.totalPrice = totalPrice;
    }

    public List<CartItems> getItems() {
        return items;
    }

    public void setItems(List<CartItems> items) {
        this.items = items;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "Cart{" + "items=" + items + ", totalPrice=" + totalPrice + '}';
    }
    
    private boolean checkExist(String id) {
        for (CartItems item : items) {
            if(item.getProduct().getProductID().equalsIgnoreCase(id)) {
                return true;
            }
        }
        return false;
    }
    
    private CartItems getItemByPid(String id) {
        for (CartItems item : items) {
            if(item.getProduct().getProductID().equalsIgnoreCase(id)) {
                return item;
            }
        }
        return null;
    }
    
    public void addItem(CartItems newItem) {
        if(checkExist(newItem.getProduct().getProductID())) {
            CartItems oldItem = getItemByPid(newItem.getProduct().getProductID());
            oldItem.setQuantity(oldItem.getQuantity() + newItem.getQuantity());
        } else {
            items.add(newItem);
        }
    }
    
    public void changeQuantity(String pid, int quantity) {
        CartItems item = getItemByPid(pid);
        item.setQuantity(quantity);
        if (quantity == 0) {
            removeItems(pid);
        }
    }
    
    public void removeItems(String pid) {
        CartItems item = getItemByPid(pid);
        if(item != null) {
            items.remove(item);
        }
    }
    
    public float getTotalMoney() {
        float total = 0;
        for (CartItems item : items) {
            total += (item.getQuantity() * item.getProduct().getPrice());
        }
        return total;
    }
    
    // Method to clear the cart
    public void clearCart() {
        items.clear();
        totalPrice = 0;
    }
}
