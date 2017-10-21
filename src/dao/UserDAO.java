package dao;

import java.util.List;
import entities.SentMessage;
import entities.User;


public interface UserDAO {
	
	void insertUserIntoDatabase(User user);
	void insertPetition(String username);
	List<User> findAllUsers();
	List<User> findHostPetitions();
	int searchUser(String username,String password);
	void verifyUser(String username);
	void deletePetition(String username);
	User findUser(String username);
	int findUsername(String username);
    void editUserInfo(User user);
    void editUserInfoListingsTable(User user);
    void insertMessage(String message,String sender,String receiver,String dateTime);
	List<String> searchConversations(String username);
	List<SentMessage> findConvMessages(String senderUsername,String receiverUsername);
	int countUsers();
	List<Integer> findVisitedListings(String username);
	double cosineSimilarity(int[] vectorA, int[] vectorB);
	int checkLastRecommendation(String username);
	void insertRecommendationTime(String username);
	
}
