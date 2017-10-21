<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="dao.ListingDAO, dao.ListingDAOImpl, dao.UserDAO, dao.UserDAOImpl, info.debatty.java.lsh.LSHMinHash, info.debatty.java.lsh.MinHash" %>
<%@ page import = "entities.User, java.util.List, java.util.ArrayList, entities.Review, entities.Listing,java.util.Collections" %>
<%@ page import="java.util.HashMap, org.apache.commons.lang3.ArrayUtils" %>


<%


	ListingDAO listing_dao = new ListingDAOImpl(false);
	int count_listings = listing_dao.countListings();
	
	UserDAO user_dao = new UserDAOImpl(false);
	int count_users = user_dao.countUsers();
	
	
	int i = 0;
	int[] my_vector = new int[count_listings];
	
	int[][] vectors = new int[count_users][count_listings];
	
	for(int j=0; j<count_listings; j++){
		my_vector[j] = 0;
	}
	
	for(int j = 0; j < count_users; j++){
		for(int k = 0; k < count_listings; k++){
			vectors[j][k] = 0;
		}
	}
	
	
	String username = (String) session.getAttribute("username");
	
	if(username != null){
		List<User> users_list = user_dao.findAllUsers();
		List<Review> listings_id = new ArrayList<>();
		for(User user : users_list){
			//System.out.println("useeeeeeeeeer");
			listings_id = listing_dao.findReviewedListings(user.getUsername());
			
			for(Review listing_id : listings_id){
				//System.out.println("mpikaaaaaaaaaaa");
				vectors[i][listing_id.getListing_id()-1] = listing_id.getRating();
				if(user.getUsername().equals(username)){
					my_vector[listing_id.getListing_id()-1] = listing_id.getRating();
				}
			}
			i++;
		}
		
		int[] hashes = new int[count_users];
		int my_hash = 0;
		
		for(int j =0; j < count_users; j++){
			hashes[j] = vectors[j].hashCode() % 15;
		}
		
		my_hash = my_vector.hashCode() % 15;
		List<int[]> similar_users = new ArrayList<>();
		
		for (int j = 0; j < vectors.length; j++) {
            int[] vector1 = vectors[j];
            int hash1 = hashes[j];
          
            if(vector1 != my_vector){
	           	if(hash1 == my_hash){
	           		similar_users.add(vector1);
	           	}
           }
                       
		 }
	
	
		
		
		
		
		
		
		 List<Double> similarities = new ArrayList<>();
	
		 
		 int nearest = 4;
		 
		 HashMap<Double,int[]> neighbours = new HashMap<>(); 
		 double similarity = 0;
		 for(int[] similar_user : similar_users){
			//similarity = MinHash.jaccardIndex(my_vector, similar_user);
			similarity = user_dao.cosineSimilarity(similar_user, my_vector);
			similarities.add(similarity);
			neighbours.put(similarity, similar_user);	
			
	
		 }
		 
		 Collections.sort(similarities);
		 
		
	
		 List<Integer> listings_to_recommend = new ArrayList<>();
		 int n = 0;
		 int total_recs = 0;
		  
		 for(int j = similarities.size()-1; j >= 0 ; j--){
			
			
			 if(n > nearest){
				 break;
			 }
			int[] vector3 = neighbours.get(similarities.get(j));
			
			for(int k = 0; k < count_listings; k++){
				if(vector3[k] !=0 && my_vector[k]==0){
					 

					if(!listings_to_recommend.contains(k+1) && total_recs < 10){
						total_recs++;
						listings_to_recommend.add(k+1);
					}
				}
			}
			 n++;
			 
		 }
	
	
		
		List<Listing> listings_to_show = new ArrayList<>();
		
		%>
		
		
		<%
		listing_dao.deleteOldRecommendations(username);
		int r = 0;
		for(Integer listing : listings_to_recommend){
			
			listings_to_show.add(listing_dao.findRecommendedListings(listing));
			listing_dao.logRecommendations(listings_to_show.get(r), username);
			r++;
			
		}%>
		
		<div class="recommendations">
		<div class="search_title"  style="margin: 5px auto; max-width: 850px;">Recommended for you:</div>
		<% for(int j = 0; j < listings_to_show.size(); j++){
			String[] type = listings_to_show.get(j).getRoom_type().split("_");
		%>
			<div class="result">
				<a href="getListingDetails?listing_name=<%=listings_to_show.get(j).getName()%>"><span class="listing_title"><%=listings_to_show.get(j).getName()%></span> </a>
				<span class="listing_type"><%= type[0] %> <%= type[1] %></span>
				<img class="listing_image" src="..//Images/home_banner_small.png" alt="Listing's Image"></img><!--place this for testing "..//Images/home_banner_small.png" -->	
				<span class="listing_beds"><%=listings_to_show.get(j).getBeds_num() %> beds</span>
				<span class="listing_reviews"><%=listings_to_show.get(j).getReviews_num() %> reviews</span>
				<span class="listing_rating"><%=listings_to_show.get(j).getStars() %>/5</span>
			</div>
			
			
			
			
		<% }%>
			
		
		</div>
		
		
		
		
		
		
		
		
<%	
	}%>
	

	
	 
	 
	
	


