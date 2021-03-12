package icia.oap.beans;

import lombok.Data;

@Data
public class ManageBean {
	
	private String shCode;
	private String abCode;
	public String zCode;
	public int tlNumber;
	public String tlComment;
	public String mtDetail;
	private String sCode;
	
	private String abName;
	private String shName;
	private String mnCode;
	private String editMtDetail;
	private String editTlNumber;
}