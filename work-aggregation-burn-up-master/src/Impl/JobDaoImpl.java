package Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Job;
import dao.*;
import util.StringUtil;

public class JobDaoImpl implements JobDao{
	
	public int JobAdd(Connection con,String jobID,String userId)throws Exception{
		String sql="insert into favorites(UserID,JobID) values(?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, userId);
		pstmt.setString(2, jobID);
		return pstmt.executeUpdate();
	}
	/*关键字搜索*/
	public ResultSet searchKey(Connection con/*,PageBean pageBean*/,Job job)throws Exception{
		String sql="select * from job where JobName like \"%"+job.getJobName()+"%\" or type like \"%"+job.getType()+"%\"";
		
//		if(pageBean!=null){
//			sql=sql+" limit "+pageBean.getStart()+","+pageBean.getRows();
//		}
		
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeQuery();
	}
	
	/*筛选栏*/
	public ResultSet searchAll(Connection con,Job job)throws Exception {
		String sql="select * from job";
		int flag=0;
		if(job!=null && StringUtil.isNotEmpty(job.getType()) ){
			if(flag==0) {
				sql=sql+" where type like\"%"+job.getType()+"%\"";
				flag=1;
			}else {
				sql=sql+" and type like\"%"+job.getType()+"%\"";
			}			
		}
		if(job!=null && StringUtil.isNotEmpty(job.getPlace())) {
			if(flag==0) {
				sql=sql+" where Place like\"%"+job.getPlace()+"%\"";
				flag=1;
			}else {
				sql=sql+" and Place like\"%"+job.getPlace()+"%\"";
			}	
		}
		
		if(job!=null && StringUtil.isNotEmpty(job.getSalary())) {		
			String[] num=job.getSalary().split("-");			
			num[1]=num[1].substring(0,num[1].length()-1);
			if(Integer.parseInt(num[0])>Integer.parseInt(num[1])) {
				String temp=num[0];
				num[0]=num[1];
				num[1]=temp;
			}
			System.out.println(num[0]);
			if(flag==0) {
				sql=sql+" WHERE SUBSTRING_INDEX(Salary,'-',1)BETWEEN "+num[0]+" and "+num[1]+" AND SUBSTRING_INDEX(SUBSTRING_INDEX(Salary,'k',1),'-',-1)BETWEEN "+num[0]+" and "+num[1];
				flag=1;
			}else {
				sql=sql+" and SUBSTRING_INDEX(Salary,'-',1)BETWEEN "+num[0]+" and "+num[1]+" AND SUBSTRING_INDEX(SUBSTRING_INDEX(Salary,'k',1),'-',-1)BETWEEN "+num[0]+" and "+num[1];
			}	
		}
		
//		if(pageBean!=null){
//			sql=sql+" limit "+pageBean.getStart()+","+pageBean.getRows();
//		}
		
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeQuery();
		
	}

	/*职位筛选*/
	public ResultSet searchJobName(Connection con/*,PageBean pageBean*/,Job job)throws Exception{
		String sql="select * from job";
		if(job!=null && StringUtil.isNotEmpty(job.getJobName())){
			sql=sql+" where JobName like\"%"+job.getJobName()+"%\"";
		}
		
//		if(pageBean!=null){
//			sql=sql+" limit "+pageBean.getStart()+","+pageBean.getRows();
//		}
		
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeQuery();
	}

	/*公司筛选*/
	public ResultSet searchCompanyName(Connection con/*,PageBean pageBean*/,Job job)throws Exception{
		String sql="select * from job";
		if(job!=null && StringUtil.isNotEmpty(job.getCompanyName())){
			sql=sql+" where JobName like\"%"+job.getCompanyName()+"%\"";
		}
		
//		if(pageBean!=null){
//			sql=sql+" limit "+pageBean.getStart()+","+pageBean.getRows();
//		}
		
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeQuery();
	}

	/*薪资筛选*/
	public ResultSet searchSalary(Connection con/*,PageBean pageBean*/,Job job)throws Exception{
		String sql="select * from job";
		String[] num=job.getSalary().split("-");
		if(Integer.parseInt(num[0])>Integer.parseInt(num[1])) {
			String temp=num[0];
			num[0]=num[1];
			num[1]=temp;
		}
		if(job!=null && StringUtil.isNotEmpty(job.getSalary())){
			sql=sql+" WHERE SUBSTRING_INDEX(Salary,'-',1)BETWEEN "+num[0]+"and"+num[1]+" AND SUBSTRING_INDEX(SUBSTRING_INDEX(Salary,'k',1),'-',-1)BETWEEN "+num[0]+"and"+num[1];
		}
		
//		if(pageBean!=null){
//			sql=sql+" limit "+pageBean.getStart()+","+pageBean.getRows();
//		}
		
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeQuery();
	}
	
	/*地区筛选*/
	public ResultSet searchPlace(Connection con/*,PageBean pageBean*/,Job job)throws Exception{
		String sql="select * from job";
		if(job!=null && StringUtil.isNotEmpty(job.getPlace())){
			sql=sql+" where Place like\"%"+job.getPlace()+"%\"";
		}
		
//		if(pageBean!=null){
//			sql=sql+" limit "+pageBean.getStart()+","+pageBean.getRows();
//		}
		
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeQuery();
	}
	
	/*经验筛选*/
	public ResultSet searchExperience(Connection con/*,PageBean pageBean*/,Job job)throws Exception{
		String sql="select * from job";
		if(job!=null && StringUtil.isNotEmpty(job.getExperience())){
			sql=sql+" where Experience like\"%"+job.getExperience()+"%\"";
		}
		
//		if(pageBean!=null){
//			sql=sql+" limit "+pageBean.getStart()+","+pageBean.getRows();
//		}
		
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeQuery();
	}

	/*学历要求筛选*/
	public ResultSet searchDegree(Connection con/*,PageBean pageBean*/,Job job)throws Exception{
		String sql="select * from job";
		if(job!=null && StringUtil.isNotEmpty(job.getDegree())){
			sql=sql+" where Degree like\"%"+job.getDegree()+"%\"";
		}
		
//		if(pageBean!=null){
//			sql=sql+" limit "+pageBean.getStart()+","+pageBean.getRows();
//		}
		
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeQuery();
	}
	
	
	
	/*职位类型筛选*/
	public ResultSet searchType(Connection con/*,PageBean pageBean*/,Job job)throws Exception{
		String sql="select * from job";
		if(job!=null && StringUtil.isNotEmpty(job.getType())){
			//System.out.println(job.getType());
			//System.out.println("1");
			sql=sql+" where type like\"%"+job.getType()+"%\"";
		}
		
//		if(pageBean!=null){
//			sql=sql+" limit "+pageBean.getStart()+","+pageBean.getRows();
//		}
		
		PreparedStatement pstmt=con.prepareStatement(sql);
//		ResultSet rs=pstmt.executeQuery();
//		if(rs!=null && rs.next()){
//			System.out.println(rs.getString("type"));
//		}

		
		return pstmt.executeQuery();
	}
	

}
