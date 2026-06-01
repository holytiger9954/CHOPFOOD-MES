package kr.or.chop.filter;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.or.chop.P01_login.dto.EmpDTO;

public class AuthInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler) throws Exception {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("loginUser") == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}

		EmpDTO loginUser = (EmpDTO) session.getAttribute("loginUser");

		int auth = loginUser.getEmpAuth();

		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = uri.substring(contextPath.length());

		if (auth == 0) {
			session.invalidate();
			alertAndGo(response, contextPath, "퇴사자는 접근할 수 없습니다.");
			return false;
		}

		if (auth == 30) {
			return true;
		}

		if (isAdminMenu(path)) {
			if (auth < 20) {
				alertAndGo(response, contextPath, "관리자 이상만 접근 가능합니다.");
				return false;
			}
		}

		if (isEditMenu(path)) {
			if (auth < 20) {
				alertAndGo(response, contextPath, "수정/삭제는 관리자 이상만 가능합니다.");
				return false;
			}
		}

		return true;
	}

	private boolean isAdminMenu(String path) {
		return path.startsWith("/alarm")
				|| path.startsWith("/emp")
				|| path.startsWith("/ghp/add")
				|| path.startsWith("/ghp/insert")
				|| path.startsWith("/ghp/update")
				|| path.startsWith("/ghp/delete");
	}

	private boolean isEditMenu(String path) {
		return path.contains("/edit")
				|| path.contains("/update")
				|| path.contains("/delete");
	}

	private void alertAndGo(
			HttpServletResponse response,
			String contextPath,
			String msg) throws Exception {

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		out.println("<script>");
		out.println("alert('" + msg + "');");
		out.println("location.href='" + contextPath + "/dashboard';");
		out.println("</script>");

		out.flush();
	}

	@Override
	public void postHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler,
			Exception ex) throws Exception {
	}
	
}
