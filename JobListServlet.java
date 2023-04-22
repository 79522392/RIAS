package web;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.Select;
import com.sun.xml.internal.bind.v2.runtime.Location;

import Impl.JobDaoImpl;
import model.Job;
import model.PageBean;
import sun.launcher.resources.launcher;
import sun.management.counter.Variability;
import util.DbUtil;

/**
 * Servlet implementation class JobListServlet
 */
@WebServlet("/jobList")
public class JobListServlet extends HttpServlet{
	DbUtil dbUtil=new DbUtil();
	JobDaoImpl jobDao=new JobDaoImpl();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("hello1");
		//Integer search=(Integer)request.getSession().getAttribute("sel");
		String search=request.getParameter("sel");
		String searchKeyWord=request.getParameter("searchKeyWord");
		String page=request.getParameter("page");
		System.out.println("筛选选项："+search);
		System.out.println("搜索关键字："+searchKeyWord);
		
		List<Job> jobList=new ArrayList<Job>();
		Job job=new Job();
			
		//job.setType("python");
		
		
		
		//PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Connection con=null;
		try{
			con=dbUtil.getCon();
			ResultSet rs=null;
			//ResultSet rs=jobDao.searchType(con, job);
			if(searchKeyWord==null&&search==null) {
				rs=jobDao.searchAll(con, job);
			}
			if(searchKeyWord!=null) {
	        	job.setType(searchKeyWord);
	        	job.setJobName(searchKeyWord);
	        	job.setPlace(searchKeyWord);
	        	job.setCompanyName(searchKeyWord);
	        	rs=jobDao.searchKey(con, job);
	        	//System.out.println(rs);
			}
			if(search!=null) {
				String[] s=search.split("!");
				System.out.println(Arrays.toString(s));
				String[] kind;
				
				for(int i=0;i<s.length;i++) {
					kind=s[i].split(":");
					System.out.println(Arrays.toString(kind));
					switch (kind[0]) {
					case "工作地点":
						job.setPlace(kind[1]);
						break;
	                case "职位类别":
						job.setType(kind[1]);					
						break;
	                case "月薪范围":
						job.setSalary(kind[1]);						
						break;

					default:
						break;
					}
				}
				rs=jobDao.searchAll(con, job);
			}

			while (rs!=null && rs.next()) {
				job=new Job();
				job.setJobId(rs.getString("JobID"));
				job.setJobName(rs.getString("JobName"));
				job.setCompanyName(rs.getString("CompanyName"));
				job.setSalary(rs.getString("Salary"));
				job.setPlace(rs.getString("Place"));
				job.setWelfare(rs.getString("Welfare"));
				job.setExperience(rs.getString("Experience"));
				job.setDegree(rs.getString("Degree"));
				job.setType(rs.getString("type"));
				job.setUrl(rs.getString("url"));
				jobList.add(job);
				
			}
			rs.close();
			
			//System.out.println("第一条数据类型："+jobList.get(1).getType());
			request.setAttribute("keyWord", searchKeyWord);
			request.setAttribute("jobList1", jobList);
			request.setAttribute("PageNo", page);
			System.out.println("跳转");
			System.out.println("当前页面："+page);

			//response.sendRedirect("choose1.jsp");
			request.getRequestDispatcher("choose1.jsp").forward(request, response);
//			int total=voteDao.voteCount(con,vote);
//			result.put("rows", jsonArray);
//			result.put("total", total);
//			//System.out.println(jsonArray);
//			ResponseUtil.write(response, result);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
