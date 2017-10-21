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
	
	
	int n = count_listings;
	int i = 0;
	boolean[] my_vector = new boolean[count_listings];
	
	for(int j=0; j<count_listings; j++){
		my_vector[j] = false;
	}
	
	boolean[][] vectors = new boolean[count_users][count_listings];
	
	for(int j = 0; j < count_users; j++){
		for(int k = 0; k < count_listings; k++){
			vectors[j][k] = false;
		}
	}
	
	
	
	
	String username =(String) session.getAttribute("username");
	
	if(username != null){
		List<User> users_list = user_dao.findAllUsers();
		List<Integer> listings = new ArrayList<>();
		
		
		
		for(User user : users_list){
			listings = user_dao.findVisitedListings(user.getUsername());
			for(Integer listing_id : listings){
				listing_id-=1;
				vectors[i][listing_id] = true;
				
				if(user.getUsername().equals(username)){
					my_vector[listing_id] = true;
				}
			}
			i++;
		}
		
		// LSHMinHash lsh = new LSHMinHash(stages, buckets, n);
		 int[] hashes = new int[count_users];
		 
		 List<boolean[]> similar_users = new ArrayList<>();
		 for (int j = 0; j < count_users; j++) {
             boolean[] vector = vectors[j];
             //hashes[j] = lsh.hash(vector);
             hashes[j] = vector.hashCode() % 30;
            // System.out.println(hashes[j]);
         }
		 int my_hash = my_vector.hashCode() % 30;
		 
		 for (int j = 0; j < vectors.length; j++) {
             boolean[] vector1 = vectors[j];
             int hash1 = hashes[j];

            if(vector1 != my_vector){
	            	
	            	if(hash1 == my_hash){
	            		similar_users.add(vectors[j]);
	            		break;
	            	}
	            
            }
            
            
             
		 }
		 
		 List<Double> similarities = new ArrayList<>();
	
		 
		 int nearest = 7;
		 
		 HashMap<Double,boolean[]> neighbours = new HashMap<>(); 
		 double similarity = 0;
		 for(boolean[] similar_user : similar_users){
			similarity = MinHash.jaccardIndex(my_vector, similar_user);
			
			similarities.add(similarity);
			neighbours.put(similarity, similar_user);	
	
		 }
		 
		 Collections.sort(similarities);
		 
		
	
		 List<Integer> listings_to_recommend = new ArrayList<>();
		 
		 for(int j = 0; j < similarities.size(); j++){
			 if(j > nearest){
				 break;
			 }
			boolean[] vector3 = neighbours.get(similarities.get(j));
			
			for(int k = 0; k < count_listings; k++){
				if(vector3[k]==true && my_vector[k]==false){
					if(!listings_to_recommend.contains(k+1)){	
						listings_to_recommend.add(k+1);
					}
				}
			}
		 }
	
	
		
		List<Listing> listings_to_show = new ArrayList<>();
		
		
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
	<% }
%>
