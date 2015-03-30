package sevrlet;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class gouwuche_lianxiren extends ActionSupport {

	private String name;
	private String shengfen;
	private String dizhi;
	private String youbian;
	private String gudingdianhua;
	private String shouji;
	private String Email;
	
	private String leixin;
	private String taitou;
	private String text;
	
	private String liuyan;

	public String getLeixin() {
		return leixin;
	}

	public void setLeixin(String leixin) {
		this.leixin = leixin;
	}

	public String getTaitou() {
		return taitou;
	}

	public void setTaitou(String taitou) {
		this.taitou = taitou;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getLiuyan() {
		return liuyan;
	}

	public void setLiuyan(String liuyan) {
		this.liuyan = liuyan;
	}

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
	@Override
	public String execute() throws Exception {
		ActionContext actionContext=ActionContext.getContext();
		actionContext.getSession().put("name", this.name);
		actionContext.getSession().put("shengfen", this.shengfen);
		actionContext.getSession().put("dizhi", this.dizhi);
		actionContext.getSession().put("youbian", this.youbian);
		actionContext.getSession().put("gudingdianhua", this.gudingdianhua);
		actionContext.getSession().put("shouji", this.shouji);
		actionContext.getSession().put("Email", this.Email);
		
		actionContext.getSession().put("leixin", this.leixin);
		actionContext.getSession().put("taitou", this.taitou);
		actionContext.getSession().put("text", this.text);
		
		actionContext.getSession().put("liuyan", this.liuyan);
		return "chenggong";
	}
}
