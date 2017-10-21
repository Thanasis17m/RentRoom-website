package entities;


public class User {
	private String username;
	private String password;
	private String name;
	private String surname;
	private String email;
	private String image_url;
	private String phoneNumber;
	private int  isHost;
	private int isVerified;
	
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public int isHost() {
		return isHost;
	}
	public void setHost(int isHost) {
		this.isHost = isHost;
	}
	public int isVerified() {
		return isVerified;
	}
	public void setVerified(int isVerified) {
		this.isVerified = isVerified;
	} 
}
