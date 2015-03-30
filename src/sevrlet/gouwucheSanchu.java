package sevrlet;

import book.gouwuche;

import com.opensymphony.xwork2.ActionSupport;

public class gouwucheSanchu extends ActionSupport {
	private String tid="";

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String execute() throws Exception {
		System.out.println(tid);
		gouwuche ne=new gouwuche();
		int num = ne.deletegouwuche(tid);
		if(num>=1){
			System.out.println("删除成功");
			return "success";
		}
		System.out.println("删除失败");
		return "fail";
	}
}
