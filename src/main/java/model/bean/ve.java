package model.bean;

public class ve {
	private int ma_ve;
	private int ma_nguoi_dung;
	private int ma_lich_trinh;
	private int so_ghe;
	private boolean trang_thai;
	
	public int get_ma_ve()
	{
		return ma_ve;
	}
	public int get_ma_nguoi_dung()
	{
		return ma_nguoi_dung;
	}
	public int get_ma_lich_trinh()
	{
		return ma_lich_trinh;
	}
	public int get_so_ghe()
	{
		return so_ghe;
	}
	public boolean get_trang_thai()
	{
		return trang_thai;
	}
	
	public void set_ma_ve(int ma_ve) 
	{
		this.ma_ve = ma_ve;
	}
	public void set_ma_nguoi_dung(int ma_nguoi_dung) 
	{
		this.ma_nguoi_dung = ma_nguoi_dung;
	}
	public void set_ma_lich_trinh(int ma_lich_trinh) 
	{
		this.ma_lich_trinh = ma_lich_trinh;
	}
	public void set_so_ghe(int so_ghe) 
	{
		this.so_ghe = so_ghe;
	}
	public void set_trang_thai(boolean trang_thai) 
	{
		this.trang_thai = trang_thai;
	}
}
