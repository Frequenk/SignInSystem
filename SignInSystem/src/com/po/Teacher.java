package	com.po;
public class Teacher {
	private int tmajor_key;
	private String tnum;
	private String tpwd;
	private String tname;
	private String tsex;
	private String ttel;
	private int texist;
	public void setTmajor_key(int tmajor_key){
		this.tmajor_key = tmajor_key;
	}
	public int getTmajor_key(){
		return tmajor_key;
	}
	public void setTnum(String tnum){
		this.tnum = tnum;
	}
	public String getTnum(){
		return tnum;
	}
	public void setTpwd(String tpwd){
		this.tpwd = tpwd;
	}
	public String getTpwd(){
		return tpwd;
	}
	public void setTname(String tname){
		this.tname = tname;
	}
	public String getTname(){
		return tname;
	}
	public void setTsex(String tsex){
		this.tsex = tsex;
	}
	public String getTsex(){
		return tsex;
	}
	public void setTtel(String ttel){
		this.ttel = ttel;
	}
	public String getTtel(){
		return ttel;
	}
	public void setTexist(int texist){
		this.texist = texist;
	}
	public int getTexist(){
		return texist;
	}
	@Override
	public String toString() {
		return "Teacher [tmajor_key=" + tmajor_key + ", tnum=" + tnum + ", tpwd=" + tpwd + ", tname=" + tname
				+ ", tsex=" + tsex + ", ttel=" + ttel + ", texist=" + texist + "]";
	}
	
}
