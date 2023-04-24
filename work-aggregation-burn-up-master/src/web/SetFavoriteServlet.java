package web;

import java.io.IOException;
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

import Impl.JobDaoImpl;
import model.Job;
import util.DbUtil;

/**
 * Servlet implementation class SetFavoriteServlet
 */
@WebServlet("/SetFavorite")
public class SetFavoriteServlet extends HttpServlet {
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
		String userId=request.getParameter("userID");
		String jobId=request.getParameter("JobId");
		Connection con=null;
		try{
			con=dbUtil.getCon();
			//ResultSet rs=jobDao.searchType(con, job);
			int res=jobDao.JobAdd(con, jobId,userId);
			request.setAttribute("insertRes", res);
			request.getRequestDispatcher("choose1.jsp").forward(request, response);
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
