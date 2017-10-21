package dao;

import java.util.Random;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import dao.UserDAO;
import dao.UserDAOImpl;
import entities.User;
import java.util.List;
import entities.NewListing;




public class TestingDAOImpl implements TestingDAO {
	
	private ConnectionFactory factory;
	
	public TestingDAOImpl(boolean pool)
    {
    	factory = ConnectionFactory.getInstance(pool);
    }
	
	private static final String SQL_INSERT_USERS = "INSERT INTO users"
			+"(username,password,name,surname,email,phoneNumber,isHost,image_url,isVerified)"
			+"VALUES(?,?,?,?,?,?,?,?,?)";
	
	private static final String SQL_INSERT_CLICK = "INSERT INTO user_visits"
			+ "(username,listing_id)"
			+ "VALUES(?,?)";
	
	private static final String SQL_INSERT_REVIEWS="INSERT INTO reviews"
			+ "(listing_name,username,rating,review,listing_id)"
			+ "VALUES(?,?,?,?,?)";
	
	public class RandomGenerator {
	    private static final String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZqwertyuiopasdfghjklzxcvbnm";

	    public  String generateRandom(int length) {
	        Random random = new SecureRandom();
	        if (length <= 0) {
	            throw new IllegalArgumentException("String length must be a positive integer");
	        }

	        StringBuilder sb = new StringBuilder(length);
	        for (int i = 0; i < length; i++) {
	            sb.append(characters.charAt(random.nextInt(characters.length())));
	        }

	        return sb.toString();
	    }
	}
	
	@Override
	public void insertUsers(){
		
		//username,password,name,surname,email,phoneNumber,isHost,image_url,isVerified
		
		RandomGenerator gen = new RandomGenerator();
		Random rand = new Random();
		String username = "";
		String name = "";
		String surname = "";
		String password = "";
		String email = "";
		int phoneNumber = 0;
		int isHost = 0;
		String image_url = "";
		int isVerified = 0;
		
		for(int i = 0; i < 1000; i++){
			username = gen.generateRandom(8);
			name = gen.generateRandom(8);
			surname = gen.generateRandom(8);
			password = gen.generateRandom(8);
			email = gen.generateRandom(8);
			image_url = gen.generateRandom(8);
			phoneNumber = rand.nextInt(896864234);
			
			
			try(
					Connection connection = factory.getConnection();
					PreparedStatement statement = DAOUtil.prepareStatement(connection, SQL_INSERT_USERS, false, username,password,name,surname,email,phoneNumber,isHost,image_url,isVerified);	
					)
			{
				statement.executeUpdate();
			}
			
			catch(SQLException e)
			{
				System.err.println(e.getMessage());
			}
		}
		
	}
	
	@Override 
	public void insertClicks(){
		
		UserDAO dao = new UserDAOImpl(false);
		
		List<User> users = dao.findAllUsers();
		
		int listing_id = 0;
		
		Random rand = new Random();
		
		for(User user : users){
			listing_id = rand.nextInt(10) + 1;
			for(int i = 0; i < 5; i++){
				listing_id = rand.nextInt(10) + 1;
				try(
						Connection connection = factory.getConnection();
						PreparedStatement statement = DAOUtil.prepareStatement(connection, SQL_INSERT_CLICK, false, user.getUsername(),listing_id);	
						)
				{
					statement.executeUpdate();
				}
				
				catch(SQLException e)
				{
					System.err.println(e.getMessage());
				}
			}
		}
		
	}
	
	
	
	
	@Override
	public void insertReviews(){
		UserDAO dao = new UserDAOImpl(false);
		Random rand = new Random();
		RandomGenerator gen = new RandomGenerator();
		ListingDAO listing_dao = new ListingDAOImpl(false);
		List<User> users = dao.findAllUsers();
		
		int listing_id  = 0;
		String review = "";
		int rating = 0;
		int num_of_reviews = 0;
		String username = "";
		String listing_name = "";
		
		for(User user : users){
			num_of_reviews = rand.nextInt(10)+1;
			for(int j = 0; j < num_of_reviews; j++){
				username  = user.getUsername();
				listing_id = rand.nextInt(10)+1;
				review = gen.generateRandom(40);
				rating = rand.nextInt(5)+1;
				listing_name = listing_dao.findListingName(listing_id);
				
				try(
						Connection connection = factory.getConnection();
						PreparedStatement statement = DAOUtil.prepareStatement(connection, SQL_INSERT_REVIEWS, false,listing_name,username,rating,review,listing_id );	
						)
				{
					statement.executeUpdate();
				}
				
				catch(SQLException e)
				{
					System.err.println(e.getMessage());
				}
				
				
				NewListing review_info = listing_dao.findListingReviewsInfo(listing_name);//find the info of the reviews of this listing
				
				int total_reviews = review_info.getReviews_num();
				
				int new_rating = listing_dao.findAvgOfReviews(listing_name);	
				listing_dao.updateReviewInfo(total_reviews+1,new_rating,listing_name);//update the listing's review info
			}
			
		}
		
	}
}
