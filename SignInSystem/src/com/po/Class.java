package	com.po;
public class Class {
	private int cmajor_key;
	private String cname;
	private int csmajor_key;
	private int smajor_key;
	private int cexist;
	public void setCmajor_key(int cmajor_key){
		this.cmajor_key = cmajor_key;
	}
	public int getCmajor_key(){
		return cmajor_key;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public void setCsmajor_key(int csmajor_key){
		this.csmajor_key = csmajor_key;
	}
	public int getCsmajor_key(){
		return csmajor_key;
	}
	public void setSmajor_key(int smajor_key){
		this.smajor_key = smajor_key;
	}
	public int getSmajor_key(){
		return smajor_key;
	}
	public void setCexist(int cexist){
		this.cexist = cexist;
	}
	public int getCexist(){
		return cexist;
	}
}
