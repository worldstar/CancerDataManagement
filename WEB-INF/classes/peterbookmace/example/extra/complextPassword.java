package peterbookmace.example.extra;

public class complextPassword {
	public String getPassword(int length){
		String password = "";
		String dataString ="1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM";
		
		for(int i = 0 ; i < length ; i ++){
			int index = (int)(Math.random()*dataString.length());
			password += dataString.charAt(index);
		}			
		
		return password;
	}

}
