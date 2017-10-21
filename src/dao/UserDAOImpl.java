package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.DateTimeFormat;

import entities.User;
import entities.SentMessage;
import java.util.ArrayList;
import java.util.Date;

import java.util.List;
import org.joda.time.*;


public class UserDAOImpl implements UserDAO {

	private static final String SQL_INSERT_NEW_USER = "INSERT INTO users"
			+"(username,password,name,surname,email,phoneNumber,isHost,image_url,isVerified)"
			+"VALUES(?,?,?,?,?,?,?,?,?)";
	
	private static final String SQL_INSERT_PETITION = "INSERT INTO host_petitions"
			+"(username)"
			+"VALUES(?)";
	
	private static final String SQL_FIND_ALL_USERS = "SELECT * FROM users ORDER BY username";
	
	private static final String SQL_FIND_USERS_WITH_HOST_PETITIONS = "SELECT * FROM users INNER JOIN host_petitions ON users.username=host_petitions.username";
	
	private static final String SQL_LOGIN_USER = "SELECT name FROM users WHERE username = ? AND password = ?";
	
	private static final String SQL_VERIFY_USER ="UPDATE users SET isVerified = 1 WHERE username = ? ";
	
	private static final String SQL_DELETE_PETITION = "DELETE from host_petitions WHERE username = ?";
	
	private static final String SQL_SEARCH_USER = "SELECT * FROM users WHERE username = ?";	
	
	private static final String SQL_FIND_SENT_CONVS="SELECT DISTINCT receiverUsername FROM messages "
			+ "WHERE senderUsername = ?";
	
	private static final String SQL_FIND_UNANSWERED_CONVS = "SELECT DISTINCT senderUsername FROM messages "
			+ "WHERE receiverUsername = ? AND "
			+ "senderUsername NOT IN "
			+ "(SELECT DISTINCT receiverUsername FROM messages WHERE senderUsername = ?)";
	
	private static final String SQL_FIND_CONV_MESSAGES = "SELECT message,senderUsername FROM messages "
			+ "WHERE (senderUsername = ? AND receiverUsername = ?) OR (senderUsername = ? AND receiverUsername = ?) "
			+ "ORDER BY dateTime";
	
	private static final String SQL_EDIT_INFO_USER = "UPDATE users SET name = ?, surname = ?, email = ?, phoneNumber = ? WHERE username = ?";
	
	private static final String SQL_EDIT_INFO_USER_LISTINGS_TABLE = "UPDATE listings SET host_name = ? WHERE username = ?";
	
	private static final String SQL_COUNT_USERS = "SELECT COUNT(*) AS num_of_users FROM users";
	
	private static final String SQL_FIND_VISITED_LISTINGS = "SELECT listing_id FROM user_visits WHERE username=?";
	
	private static final String SQL_INSERT_MESSAGE = "INSERT INTO messages "
			+ "(senderUsername,receiverUsername,message,dateTime)"
			+ "VALUES(?,?,?,?)";
	
	private static final String SQL_GET_LAST_RECOMMENDATION = "SELECT last_recommendation FROM users WHERE username=?";
	
	private static final String SQL_UPDATE_RECOMMENDATION_TIME = "UPDATE users SET last_recommendation = ? WHERE username = ?";
		
	
	private ConnectionFactory factory;
	
	public UserDAOImpl(boolean pool)
    {
    	factory = ConnectionFactory.getInstance(pool);
    }
	
	
		
		@Override
		public  double cosineSimilarity(int[] vectorA, int[] vectorB) {
		    double dotProduct = 0.0;
		    double normA = 0.0;
		    double normB = 0.0;
		    for (int i = 0; i < vectorA.length; i++) {
		        dotProduct += vectorA[i] * vectorB[i];
		        normA += Math.pow(vectorA[i], 2);
		        normB += Math.pow(vectorB[i], 2);
		    }   
		    return dotProduct / (Math.sqrt(normA) * Math.sqrt(normB));
		}
		
	
	
	@Override
	public void insertUserIntoDatabase(User user){	/*Inserts a new user to the users table*/
		try(
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection, SQL_INSERT_NEW_USER, false, 
						user.getUsername(),
						user.getPassword(),user.getName(),user.getSurname(),
						user.getEmail(),user.getPhoneNumber(),user.isHost(),user.getImage_url(),
						user.isVerified());							
				)
		{
			statement.executeUpdate();
		}
		
		catch(SQLException e)
		{
			System.err.println(e.getMessage());
		}
	}
	
	
	
	@Override
	public void insertPetition(String username)	/*Inserts a new user's host petition into the host_petitions table*/
	{
		try(
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection, SQL_INSERT_PETITION, false, username);	
				)
		{
			statement.executeUpdate();
		}
		
		catch(SQLException e)
		{
			System.err.println(e.getMessage());
		}
	}
	
	
	@Override
	public List<User> findAllUsers(){ /*Finds all the registered users and their info*/
		
		List<User> users = new ArrayList<>();
		
		try (
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection,SQL_FIND_ALL_USERS, false);
		        ResultSet resultSet = statement.executeQuery();)
			{
		        while (resultSet.next()) {
		            
		            users.add(createUser(resultSet));           
		        }
			} 
			catch (SQLException e) {
				System.err.println(e.getMessage());
			}
		return users;
	}
	
	
	private static User createUser(ResultSet resultSet) throws SQLException {
        User user = new User();
        user.setUsername(resultSet.getString("username"));
        user.setPassword(resultSet.getString("password"));
        user.setName(resultSet.getString("name"));
        user.setSurname(resultSet.getString("surname"));
        user.setEmail(resultSet.getString("email"));
        user.setImage_url(resultSet.getString("image_url"));
        user.setPhoneNumber(resultSet.getString("phoneNumber"));
        user.setHost(resultSet.getInt("isHost"));
        user.setVerified(resultSet.getInt("isVerified"));
        return user;
    }
	
	
	@Override
	public List<User> findHostPetitions(){//find users with pending host petitions
		
		List<User> usersWithHostPetitions = new ArrayList<>();
		
		try (
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection,SQL_FIND_USERS_WITH_HOST_PETITIONS, false);
		        ResultSet resultSet = statement.executeQuery();)
			{
		        while (resultSet.next()) {
		            
		            usersWithHostPetitions.add(createUser(resultSet));       
		        }
			} 
			catch (SQLException e) {
				System.err.println(e.getMessage());
			}
		return usersWithHostPetitions;
	}
	
	
	@Override
	public int searchUser(String username, String password)//find the name of the user to be logged in
	{
		try (
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection,SQL_LOGIN_USER, false, username,password);
		        ResultSet resultSet = statement.executeQuery();)
			{
		        if (!resultSet.isBeforeFirst()) {	        	
		        	return 0;
		            
		        }
		        else {
		        	return 1;
		        }
			} 
			catch (SQLException e) {
				System.err.println(e.getMessage());
			}
		return 2;
	}
	
	
	@Override
	public void verifyUser(String username){//verify user by setting the isVerified flag to 1 in the users table
		try (
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection,SQL_VERIFY_USER, false, username);
		        )
		{
			statement.executeUpdate();
		}
		catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}
	
	
	
	@Override
	public void deletePetition(String username){//deletes a host petition that has been verified
		try (
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection,SQL_DELETE_PETITION, false, username);
		        )
		{
			statement.executeUpdate();
		}
		catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}
	
	
	
	@Override
	public User findUser(String username){//finds a user by his username and returns his info
		
		User user = new User();
		try (
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection,SQL_SEARCH_USER, false, username);
		        ResultSet resultSet = statement.executeQuery();)
			{
			resultSet.next();
			user.setUsername(resultSet.getString("username"));
			user.setPassword(resultSet.getString("password"));
	        user.setName(resultSet.getString("name"));
	        user.setSurname(resultSet.getString("surname"));
	        user.setEmail(resultSet.getString("email"));
	        user.setImage_url(resultSet.getString("image_url"));
	        user.setPhoneNumber(resultSet.getString("phoneNumber"));
	        user.setHost(resultSet.getInt("isHost"));
	        user.setVerified(resultSet.getInt("isVerified"));
			} 
			catch (SQLException e) {
				System.err.println(e.getMessage());
			}	
		return user;
	}
	
	
	
	@Override
	public int findUsername(String username){//finds if a user with a specific username exists
		
		try (
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection,SQL_SEARCH_USER, false, username);
		        ResultSet resultSet = statement.executeQuery();)
			{
				if(resultSet.isBeforeFirst()){
					return 1;
				}
				else{
					return 0;
				}
			}
		catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		
		return 2;
	}
	
	
	@Override
	public void editUserInfo(User user){ //edit the user info in the users table		
		try (
				Connection connection = factory.getConnection();
				PreparedStatement statement1 = DAOUtil.prepareStatement(connection,SQL_EDIT_INFO_USER, false, user.getName(),user.getSurname(), user.getEmail(),user.getPhoneNumber(),user.getUsername());
		     )
			{
				statement1.executeUpdate();
			}
		catch (SQLException e) {
			System.err.println(e.getMessage());
		}			
	}
	
	
	@Override
	public void editUserInfoListingsTable(User user){ //edit the user info in the listings table
		try (
				Connection connection = factory.getConnection();
				PreparedStatement statement2 = DAOUtil.prepareStatement(connection,SQL_EDIT_INFO_USER_LISTINGS_TABLE, false,  user.getName(), user.getUsername());
		     )
			{
				statement2.executeUpdate();
			}
		catch (SQLException e) {
			System.err.println(e.getMessage());
		}			
	}
	
	
	
	
	@Override
	public List<String> searchConversations(String username){
		List<String> conversations = new ArrayList<>();
		List<String> unanswered_convs = new ArrayList<>();
		
		
		try (
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection,SQL_FIND_SENT_CONVS, false,username);
		        ResultSet resultSet = statement.executeQuery();)
			{
		        while (resultSet.next()) {
		            
		            conversations.add(resultSet.getString("receiverUsername"));       
		        }
			} 
		catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		
		try (
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection,SQL_FIND_UNANSWERED_CONVS, false,username,username);
		        ResultSet resultSet = statement.executeQuery();)
			{
		        while (resultSet.next()) {
		            
		            unanswered_convs.add(resultSet.getString("senderUsername"));       
		        }
			} 
		catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		
		for(String listElement : unanswered_convs){
			conversations.add(listElement);
		}
		
		return conversations;
	}
	
	
	
	@Override
	public List<SentMessage> findConvMessages(String senderUsername,String receiverUsername){
		
		List<SentMessage> message_list = new ArrayList<>();
		
		
		try (
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection,SQL_FIND_CONV_MESSAGES, false,senderUsername,receiverUsername,receiverUsername,senderUsername);
		        ResultSet resultSet = statement.executeQuery();)
			{
		        while (resultSet.next()) {
		        	SentMessage message = new SentMessage();
		            message.setMessage(resultSet.getString("message"));
		            message.setSenderUsername(resultSet.getString("senderUsername"));
		            message_list.add(message);       
		        }
			} 
		catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		
		return message_list;
	}
	
	@Override
	public int countUsers(){
		int count = 0;
		
		try (
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection,SQL_COUNT_USERS, false);
		        ResultSet resultSet = statement.executeQuery();)
			{
		      resultSet.next();
		      count = resultSet.getInt("num_of_users");
			} 
		catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		
		return count;
		
	}
	
	@Override
	public List<Integer> findVisitedListings(String username){
		List<Integer> listings = new ArrayList<>();
		
		try (
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection,SQL_FIND_VISITED_LISTINGS, false,username);
		        ResultSet resultSet = statement.executeQuery();)
			{
		      while(resultSet.next()){
		    	  listings.add(resultSet.getInt("listing_id"));
		      }
		      
			} 
		catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		
		
		return listings;
	}
	
	@Override
	public void insertMessage(String message,String sender,String receiver,String dateTime){
		
		
		
		
		try(
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection, SQL_INSERT_MESSAGE, false,sender,receiver,message,dateTime) 
											
				)
		{
			statement.executeUpdate();
		}
		
		catch(SQLException e)
		{
			System.err.println(e.getMessage());
		}
		
	}
	
	@Override
	public int checkLastRecommendation(String username){
		int needs_new = 0;
		DateTimeFormatter formatter = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss.S");
		DateTime dt = new DateTime();
		
		
		try (
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection,SQL_GET_LAST_RECOMMENDATION, false,username);
		        ResultSet resultSet = statement.executeQuery();)
			{
			
			resultSet.next();
			if(resultSet.getString("last_recommendation")!=null){
		      	
		      	dt = formatter.parseDateTime(resultSet.getString("last_recommendation"));
		      	DateTime now = new DateTime();
		      	
		      	DateTime startTime, endTime;
		      	startTime = now;
		      	endTime = dt;
		      	Period p = new Period(startTime, endTime);
		      	long hours = p.getHours();
		      	long days = p.getDays();
		      	//long minutes = p.getMinutes();
		      	if(days == 0){
		      		if(hours >6 || (hours <6 && hours != 0)){
		      			needs_new = 1;
		      		}
		      		
		      	}
		      	
		      	else{
		      		needs_new = 1;
		      	}
		 
			}
			
			else{
				needs_new =1;
			}
		  
		      
			} 
		catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		
		return needs_new;
	}
	
	@Override
	public void insertRecommendationTime(String username){
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateTime = new Date();
		String date_to_insert = dateFormat.format(dateTime);
		
		try(
				Connection connection = factory.getConnection();
				PreparedStatement statement = DAOUtil.prepareStatement(connection, SQL_UPDATE_RECOMMENDATION_TIME, false,date_to_insert,username) 
											
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

