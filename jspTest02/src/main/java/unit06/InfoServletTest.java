package unit06;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InfoServlet
 */
@WebServlet("/InfoServletTest")
public class InfoServletTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoServletTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		out.println("당신이 <b>get</b>방식으로 입력한 정보입니다.<br>");
		out.printf("이름 : %s", name);
		out.printf("<br> 주소 : %s", addr);
		
		out.println("<br><a href='javascript:history.go(-1)'>뒤로가기</a>");
		out.print("</body></html>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		String pw1 = request.getParameter("pw1");
		String pw2 = request.getParameter("pw2");
		
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		
		if(pw1.equals(pw2)) {
			out.println("당신이 <b>post</b>방식으로 입력한 정보입니다.<br>");
			out.printf("아이디 : %s", id);
			out.printf("<br> 비밀번호 : %s", pw1);
		} else {
			out.print("<h1>비밀번호가 일치하지 않습니다!!</h1>");
		}
		out.println("<br><a href='javascript:history.go(-1)'>뒤로가기</a>");
		out.print("</body></html>");
		out.close();
	}

}
