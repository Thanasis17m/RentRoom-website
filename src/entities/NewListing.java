package entities;

public class NewListing {
	String listing_name;
	String listing_type;
	String listing_area;
	String square_feet;
	int beds;
	int bedrooms;
	int bathrooms;
	String description;
	int heating;
	int tv ;
	int kitchen;
	int ac;
	int wifi ;
	int free_parking;
	int pets;
	int events ;
	int smoking;
	int min_stay;
	int total_guests_allowed ;
	int price;
	String listing_from;
	String listing_to; //the dates the listing is available
	private int reviews_num;
	private int stars;
	
	Double longitude;
	Double latitude;
	
	
	public String getListing_name() {
		return listing_name;
	}
	public void setListing_name(String listing_name) {
		this.listing_name = listing_name;
	}
	public String getListing_type() {
		return listing_type;
	}
	public void setListing_type(String listing_type) {
		this.listing_type = listing_type;
	}
	public String getListing_area() {
		return listing_area;
	}
	public void setListing_area(String listing_area) {
		this.listing_area = listing_area;
	}
	public int getBeds() {
		return beds;
	}
	public void setBeds(int beds) {
		this.beds = beds;
	}
	public int getBedrooms() {
		return bedrooms;
	}
	public void setBedrooms(int bedrooms) {
		this.bedrooms = bedrooms;
	}
	public int getBathrooms() {
		return bathrooms;
	}
	public void setBathrooms(int bathrooms) {
		this.bathrooms = bathrooms;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getHeating() {
		return heating;
	}
	public void setHeating(int heating) {
		this.heating = heating;
	}
	public int getTv() {
		return tv;
	}
	public void setTv(int tv) {
		this.tv = tv;
	}
	public int getKitchen() {
		return kitchen;
	}
	public void setKitchen(int kitchen) {
		this.kitchen = kitchen;
	}
	public int getAc() {
		return ac;
	}
	public void setAc(int ac) {
		this.ac = ac;
	}
	public int getWifi() {
		return wifi;
	}
	public void setWifi(int wifi) {
		this.wifi = wifi;
	}
	public int getFree_parking() {
		return free_parking;
	}
	public void setFree_parking(int free_parking) {
		this.free_parking = free_parking;
	}
	public int getPets() {
		return pets;
	}
	public void setPets(int pets) {
		this.pets = pets;
	}
	public int getEvents() {
		return events;
	}
	public void setEvents(int events) {
		this.events = events;
	}
	public int getSmoking() {
		return smoking;
	}
	public void setSmoking(int smoking) {
		this.smoking = smoking;
	}
	public int getMin_stay() {
		return min_stay;
	}
	public void setMin_stay(int min_stay) {
		this.min_stay = min_stay;
	}
	public int getTotal_guests_allowed() {
		return total_guests_allowed;
	}
	public void setTotal_guests_allowed(int total_guests_allowed) {
		this.total_guests_allowed = total_guests_allowed;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getListing_from(){
		return listing_from;
	}
	public void setListing_from(String listing_from){
		this.listing_from = listing_from;
	}
	public String getListing_to(){
		return listing_to;
	}
	public void setListing_to(String listing_to){
		this.listing_to = listing_to;
	}
	public String getSquare_feet() {
		return square_feet;
	}
	public void setSquare_feet(String square_feet) {
		this.square_feet = square_feet;
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
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	
	
	
}
