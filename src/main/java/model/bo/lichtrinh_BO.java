package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.bean.lichtrinh;
import model.dao.lichtrinh_DAO;

public class lichtrinh_BO {
	lichtrinh_DAO lichtrinh_DAO = new lichtrinh_DAO();
	
	public ArrayList<lichtrinh> getList()
	{
		return lichtrinh_DAO.getList();
	}
	public ArrayList<lichtrinh> get_lich_trinh_by_ma_tuyen_duong(int ma_tuyen_duong)
	{
		return lichtrinh_DAO.get_lich_trinh_by_ma_tuyen_duong(ma_tuyen_duong);
	}
	public boolean insertlichtrinh(lichtrinh lichtrinh)
	{
		return lichtrinh_DAO.insertlichtrinh(lichtrinh);
	}
	public lichtrinh get_lich_trinh_by_ma_lich_trinh(int ma_lich_trinh)
	{
		return lichtrinh_DAO.get_lich_trinh_by_ma_lich_trinh(ma_lich_trinh);
	}
	public boolean updatelichtrinh(lichtrinh updatedlichtrinh) 
	{
		return lichtrinh_DAO.updatelichtrinh(updatedlichtrinh);
	}
	public ArrayList<lichtrinh> searchlichtrinh(String searchOption, Date searchValue) 
	{
        return lichtrinh_DAO.searchlichtrinh(searchOption, searchValue);
    }
	public lichtrinh get_Lich_Trinh_By_Id(int malichtrinh) {
	    return lichtrinh_DAO.getLichTrinhById(malichtrinh);
	}
	
}
