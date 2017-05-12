<%
// *** Logout the current user.
String MM_Logout = request.getRequestURI() + "?MM_Logoutnow=1";
if (request.getParameter("MM_Logoutnow") != null && request.getParameter("MM_Logoutnow").equals("1")) {
  session.putValue("MM_Username", "");
  session.putValue("UserLevel", "");
  session.putValue("StaffID", "");
  session.putValue("Username", "");
  session.putValue("MM_UserAuthorization", "");
  String MM_logoutRedirectPage = "/admin/login.jsp";
  // redirect with URL parameters (remove the "MM_Logoutnow" query param).
  if (MM_logoutRedirectPage.equals("")) MM_logoutRedirectPage = request.getRequestURI();
  if (MM_logoutRedirectPage.indexOf("?") == -1 && request.getQueryString() != null) {
    String MM_newQS = request.getQueryString();
    String URsearch = "MM_Logoutnow=1";
    int URStart = MM_newQS.indexOf(URsearch);
    if (URStart >= 0) {
      MM_newQS = MM_newQS.substring(0,URStart) + MM_newQS.substring(URStart + URsearch.length());
    }
    if (MM_newQS.length() > 0) MM_logoutRedirectPage += "?" + MM_newQS;
  }
  response.sendRedirect(response.encodeRedirectURL(MM_logoutRedirectPage));
  return;
}
%>
