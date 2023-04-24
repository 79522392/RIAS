package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Job;
import util.StringUtil;

public interface JobDao {
	public int JobAdd(Connection con,String jobID,String userId)throws Exception;
	
	public ResultSet searchKey(Connection con/*,PageBean pageBean*/,Job job)throws Exception;
	public ResultSet searchAll(Connection con,Job job)throws Exception;
	public ResultSet searchJobName(Connection con/*,PageBean pageBean*/,Job job)throws Exception;
	/*公司筛选*/
	public ResultSet searchCompanyName(Connection con/*,PageBean pageBean*/,Job job)throws Exception;
	/*薪资筛选*/
	public ResultSet searchSalary(Connection con/*,PageBean pageBean*/,Job job)throws Exception;
	/*地区筛选*/
	public ResultSet searchPlace(Connection con/*,PageBean pageBean*/,Job job)throws Exception;
	/*经验筛选*/
	public ResultSet searchExperience(Connection con/*,PageBean pageBean*/,Job job)throws Exception;
	/*学历要求筛选*/
	public ResultSet searchDegree(Connection con/*,PageBean pageBean*/,Job job)throws Exception;
	/*职位类型筛选*/
	public ResultSet searchType(Connection con/*,PageBean pageBean*/,Job job)throws Exception;
}
