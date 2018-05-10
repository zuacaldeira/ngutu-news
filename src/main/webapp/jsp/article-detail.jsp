<%-- 
    Document   : summaries
    Created on : Apr 1, 2018, 12:25:49 PM
    Author     : zua
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.news.NewsSource"%>
<%@page import="backend.services.news.NewsSourceService"%>
<%@page import="backend.utils.MyDateUtils"%>
<%@page import="backend.services.news.NewsArticleService"%>
<%@page import="db.news.NewsArticle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    NewsArticle art = null;
    String message = null;

    if (request.getParameter("article") != null) {
        Long id = Long.valueOf(URLDecoder.decode(request.getParameter("article"), "UTF-8"));
        message = "Article Id: " + id;
        art = new NewsArticleService().findArticleWithId(id);
    }
%>
<div class="container-fluid summaries-context">
    <div class="title">
        <%
            if (art != null) {
                out.print(message);
            }
        %>
    </div>
    <div class="actions">
        <%
            String view = request.getParameter("view");
            /*  String path = request.getQueryString();
            out.println("<p>Path::" + path + "::</p>");*/
            if (view == null || view.equals("grid")) {
                out.println("<a href=\"index.jsp?view=grid\"><span class=\"glyphicon glyphicon-th active\"></span></a>");
                out.println("<a href=\"index.jsp?view=list\"><span class=\"glyphicon glyphicon-th-list\"></span></a>");
            } else {
                out.println("<a href=\"index.jsp?view=grid\"><span class=\"glyphicon glyphicon-th\"></span></a>");
                out.println("<a href=\"index.jsp?view=list\"><span class=\"glyphicon glyphicon-th-list active\"></span></a>");
            }
        %>
    </div>
</div>
<div class="summaries">
    <%
        if (art != null) {
            NewsSource source = new NewsSourceService().findSourceWithSourceId(art.getSourceId());
            String logoUrl = source.getLogoUrl();
            String sourceName = source.getName();
            SimpleDateFormat dateFormat = new SimpleDateFormat("EE, dd.MM.YY, HH\'h\'mm");
            if (art.getImageUrl() != null && !art.getImageUrl().isEmpty() && logoUrl != null && !logoUrl.isEmpty()) {

                if (view == null || view.equals("grid")) {
                    out.println("<div class=\"summary grid\">");
                } else if (view.equals("list")) {
                    out.println("<div class=\"summary list\">");
                }
                out.println("   <div class=\"news-copyright\">");
                out.println("      <div class=\"news-source\">");
                out.println("          <img class=\"source-image\" src=\"" + logoUrl + "\">");
                out.println("          <div class=\"source-name\">" + sourceName + "</div>");
                out.println("          <div class=\"publish-date\">" + dateFormat.format(art.getPublishedAt()) + "</div>");
                out.println("      </div>");
                out.println("   </div>");
                out.println("   <a href=\"" + art.getUrl() + "\" target=\"_blank\">");
                out.println("   <div class=\"news-image\" style=\"background:url(" + art.getImageUrl() + ") no-repeat center center; background-size:cover;\">");
                out.println("   </div>");
                out.println("       <div class=\"news-title\">" + art.getTitle());
                out.println("       </div>");
                if (art.getDescription() != null && !art.getDescription().isEmpty()) {
                    out.println("   <div class=\"news-description\">" + art.getDescription());
                    out.println("   </div>");
                }
                out.println("   </a>");
                out.println("</div>");
            }
        }
    %>
</div>

