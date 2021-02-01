package leeJ.co.MyApp.models;

public class ItemViewModel {
    private String title;
    private String description;
    private double price;
    private String imageURL;

    public ItemViewModel(String title, String description, double price, String imageURL) {
        this.title = title;
        this.description = description;
        this.price = price;
        this.imageURL = imageURL;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public String getImageURL() { return imageURL; }
}
