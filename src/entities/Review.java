package entities;

public class Review {
	String review;
	int rating;
	String listing_name;
	String reviewer_name;
	int listing_id ;
	
	
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getListing_name() {
		return listing_name;
	}
	public void setListing_name(String listing_name) {
		this.listing_name = listing_name;
	}
	public String getReviewer_name() {
		return reviewer_name;
	}
	public void setReviewer_name(String reviewer_name) {
		this.reviewer_name = reviewer_name;
	}
	public int getListing_id() {
		return listing_id;
	}
	public void setListing_id(int listing_id) {
		this.listing_id = listing_id;
	}
	
	
}
