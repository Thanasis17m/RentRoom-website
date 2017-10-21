package dao;
import entities.Listing;
import entities.ListingProfileInfo;
import entities.Review;
import java.util.List;
import entities.NewListing;
import java.text.ParseException;
import entities.Coordinates;



public interface ListingDAO {
	
	
	List<Listing> searchListing(String location,int persons,String from, String to,int start_row);
	List<Listing> searchFilteredListings(String location, int persons,String from, String to, String room_type,int max_price, int wifi,int ac,int kitchen,int elevator,int parking,int tv, int heating,int start_row);
	void insertNewBooking(String check_in,String check_out,String listing_name, String username);
	void updateAvailability(String check_in, String check_out, String listing_name,int availability);
	void insertAvailability(String check_in,String check_out,String listing_name,int price) throws ParseException;
	void insertNewListing(NewListing listing,String username,String host_name);
	ListingProfileInfo getListingDetails(String listing_name);
	List<String> findYourListings(String username);
	NewListing takeListingInfo(String listing_name);
	void updatePrice(String listing_name,int price,String from,String to);
	void insertReview(String review,String listing_name,String username,int rating,int listing_id);
	void updateReviewInfo(int total_reviews,int new_rating,String listing_name);
	NewListing findListingReviewsInfo(String listing_name);
	List<Review> findAllReviews(String listing_name);
	int checkIfDatesExist(String listing_name,String check_in,String check_out);
	void updateListingInfo(ListingProfileInfo listing);
	String searchPrice(String listing_name,String check_in,String check_out);
	int countListings();
	List<Review> findReviewedListings(String username);
	Listing findRecommendedListings(int listing_id);
	void logClick(String username, int listing_id);
	int searchIfAlreadyVisited(String username,int listing_id);
	int findListingId(String listing_name);
	String findListingName(int listing_id);
	int userReviewsExist(String username);
	int countSearchedListings(String location,int persons,String from, String to);
	int countSearchedListingsWithFilters(String location, int persons,String from, String to, String room_type,int max_price, int wifi,int ac,int kitchen,int elevator,int parking,int tv, int heating);
	int findAvgOfReviews(String listing_name);
	void logRecommendations(Listing listing,String username); 
	List<Listing> getRecommendations(String username);
	void deleteOldRecommendations(String username);
	int checkGuests(String listing_name, int guests);
	int checkIfHotelIsAvailable(String listing_name, String check_in,String check_out);
	List<Coordinates> getCoordinates(String host_name);
}
