package	com.po;
public class Student {
	private int smajor_key;
	private String snum;
	private String spwd;
	private String sname;
	private String ssex;
	private String stel;
	private int sexist;
	public void setSmajor_key(int smajor_key){
		this.smajor_key = smajor_key;
	}
	public int getSmajor_key(){
		return smajor_key;
	}
	public void setSnum(String snum){
		this.snum = snum;
	}
	public String getSnum(){
		return snum;
	}
	public void setSpwd(String spwd){
		this.spwd = spwd;
	}
	public String getSpwd(){
		return spwd;
	}
	public void setSname(String sname){
		this.sname = sname;
	}
	public String getSname(){
		return sname;
	}
	public void setSsex(String ssex){
		this.ssex = ssex;
	}
	public String getSsex(){
		return ssex;
	}
	public void setStel(String stel){
		this.stel = stel;
	}
	public String getStel(){
		return stel;
	}
	public void setSexist(int sexist){
		this.sexist = sexist;
	}
	public int getSexist(){
		return sexist;
	}
}
