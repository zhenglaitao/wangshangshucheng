package sevrlet;

import book.gouwuche;

import com.opensymphony.xwork2.ActionSupport;

public class QingKong extends ActionSupport {
	
	public String execute() throws Exception {
		gouwuche ne=new gouwuche();
		int num = ne.deletegouwucheQU();
		if(num>=1){
			System.out.println("清空购物车成功");
			return "success";
		}
		System.out.println("清空购物车失败");
		return "fail";
	}
}
