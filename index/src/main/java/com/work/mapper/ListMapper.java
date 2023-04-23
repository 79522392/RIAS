package com.work.mapper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.work.entity.List;

public class ListMapper {
	@SuppressWarnings("finally")
	public ArrayList findAll(){
		  Connection con=null;
		  PreparedStatement psta=null;
		  ResultSet rs=null;
		  ArrayList list=new ArrayList();
		  String sql="select * from information";
		  try{
		   con=ConnMapper.getConnection();
		   psta=con.prepareStatement(sql);
		   rs=psta.executeQuery();
		   while(rs.next()){
		    List obj=new List();
		    obj.setId(rs.getString(1));
		    obj.setJob_name(rs.getString(2));
		    obj.setSalary(rs.getString(3));
		    obj.setDegree(rs.getString(4));
		    obj.setWork_year(rs.getString(5));
		    obj.setJob_area(rs.getString(6));
		    obj.setCompany_name(rs.getString(7));
		    obj.setCompany_size(rs.getString(8));
		    obj.setIndustry_type(rs.getString(9));
		    obj.setJob_href(rs.getString(10));
		    obj.setCompany_href(rs.getString(11));
		    list.add(obj);
		   }
		  }catch(Exception e){
		   e.printStackTrace();
		  }finally{
		   try{
		    ConnMapper.close(rs, psta, con);
		   }catch(Exception e){
		    e.printStackTrace();
		   }
		   return list;
		  }
		 }
}
