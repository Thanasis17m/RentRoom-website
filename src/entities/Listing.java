package entities;

public class Listing {
	private String name;
	private String image_url;
	private String price;
	private String room_type;
	private int beds_num;
	private int reviews_num;
	private int stars;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public int getBeds_num() {
		return beds_num;
	}
	public void setBeds_num(int beds_num) {
		this.beds_num = beds_num;
	}
	public int getReviews_num() {
		return reviews_num;
	}
	public void setReviews_num(int reviews_num) {
		this.reviews_num = reviews_num;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	
	
}
