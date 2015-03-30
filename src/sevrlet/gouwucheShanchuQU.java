package sevrlet;

import book.gouwuche;

import com.opensymphony.xwork2.ActionSupport;

public class gouwucheShanchuQU extends ActionSupport {

	private String name;
	private String shengfen;
	private String dizhi;
	private String youbian;
	private String gudingdianhua;
	private String shouji;
	private String Email;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShengfen() {
		return shengfen;
	}

	public void setShengfen(String shengfen) {
		this.shengfen = shengfen;
	}

	public String getDizhi() {
		return dizhi;
	}

	public void setDizhi(String dizhi) {
		this.dizhi = dizhi;
	}

	public String getYoubian() {
		return youbian;
	}

	public void setYoubian(String youbian) {
		this.youbian = youbian;
	}

	public String getGudingdianhua() {
		return gudingdianhua;
	}

	public void setGudingdianhua(String gudingdianhua) {
		this.gudingdianhua = gudingdianhua;
	}

	public String getShouji() {
		return shouji;
	}

	public void setShouji(String shouji) {
		this.shouji = shouji;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String execute() throws Exception {
		gouwuche ne=new gouwuche();
		int num = ne.deletegouwucheQU();
		if(num>=1){
			System.out.println("删除成功");
			return "success";
		}
		System.out.println("删除失败");
		return "fail";
	}
}
