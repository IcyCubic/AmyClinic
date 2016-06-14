package group3.k.order.controller;

import group3.carrie.orders.model.OrdersVO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Backstage/updateOrder")
public class updateOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public updateOrder() { super(); }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/json");
		PrintWriter out = res.getWriter();
		
		HttpSession session =req.getSession(false);
		System.out.println("doPost_ok");
		
		OrdersVO ordersVO=new OrdersVO();
		
		Integer oid =new Integer( req.getParameter("oid"));
		String odate=req.getParameter("odate");
		String total = req.getParameter("total");
		String ostatus =req.getParameter("ostatus");
		String payment = req.getParameter("payment");
		String del_status =req.getParameter("del_status");
		
		
		System.out.println(oid+"，"+odate+"，"+total+"，"+ostatus+"，"+payment+"，"+del_status);
	}

}
