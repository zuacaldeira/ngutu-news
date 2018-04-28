<%-- 
    Document   : summaries
    Created on : Apr 1, 2018, 12:25:49 PM
    Author     : zua
--%>

<%@page import="db.news.NewsSource"%>
<%@page import="backend.services.news.NewsSourceService"%>
<%@page import="backend.utils.MyDateUtils"%>
<%@page import="backend.services.news.NewsArticleService"%>
<%@page import="db.news.NewsArticle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Iterable<NewsArticle> articles = null;
    String message = null;

    if (request.getParameter("category") != null) {
        String category = request.getParameter("category");
        message = "Category: " + category.toUpperCase();
        articles = new NewsArticleService().findArticlesTaggedAs(category);
    } else if (request.getParameter("publisher") != null) {
        String publisher = request.getParameter("publisher");
        message = "Publisher: " + publisher.toUpperCase();
        articles = new NewsArticleService().findArticlesPublishedBy(publisher);
    } else if (request.getParameter("language") != null) {
        String language = request.getParameter("language");
        message = "Language: " + MyDateUtils.getLanguage(language).toUpperCase();
        articles = new NewsArticleService().findArticlesWithLanguage(language);
    } else if (request.getParameter("country") != null) {
        String country = request.getParameter("country");
        message = "Country: " + MyDateUtils.getCountry(country).toUpperCase();
        articles = new NewsArticleService().findArticlesWithCountry(country);
    } else if (request.getParameter("search") != null) {
        String searchTerm = (String) request.getParameter("search");
        message = "Search results for: " + searchTerm.toUpperCase();
        articles = new NewsArticleService().findArticlesWithText(searchTerm);
    } else {
        message = "Latest News";
        articles = new NewsArticleService().findAll(0, 25);
    }
%>
<div class="container-fluid summaries-context">
    <div class="title">
        <% out.print(message); %>
    </div>
    <div class="actions">
        <% 
            String view = request.getParameter("view");
            if (view == null || view.equals("grid")) {
                out.println("<a href=\"index.jsp?view=grid\"><span class=\"glyphicon glyphicon-th active\"></span></a>");        
                out.println("<a href=\"index.jsp?view=list\"><span class=\"glyphicon glyphicon-th-list\"></span></a>");        
            }
            else {
                out.println("<a href=\"index.jsp?view=grid\"><span class=\"glyphicon glyphicon-th\"></span></a>");        
                out.println("<a href=\"index.jsp?view=list\"><span class=\"glyphicon glyphicon-th-list active\"></span></a>");        
            }
        %>
    </div>
</div>
<div class="summaries">
    <%
        for (NewsArticle art : articles) {
            NewsSource source = new NewsSourceService().findSourceWithSourceId(art.getSourceId());
            String logoUrl = source.getLogoUrl();
            String sourceName = source.getName();
            if (art.getImageUrl() != null && !art.getImageUrl().isEmpty() && logoUrl != null && !logoUrl.isEmpty()) {
                if (view == null || view.equals("grid")) {
                    out.println("<div class=\"summary grid\">");
                } 
                else if(view.equals("list")){
                    out.println("<div class=\"summary list\">");
                }
                out.println("   <div class=\"news-copyright\">");
                out.println("      <div class=\"news-source\">");
                out.println("          <img class=\"source-image\" src=\"" + logoUrl + "\">");
                out.println("          <div class=\"source-name\">" + sourceName);
                out.println("          </div>");
                out.println("      </div>");
                out.println("   </div>");
                out.println("   <div class=\"news-image\" style=\"background:url(" + art.getImageUrl() + ") no-repeat center center; background-size:cover;\">");
                out.println("   </div>");
                out.println("   <a href=\"" + art.getUrl() + "\" target=\"_blank\">");
                out.println("       <div class=\"news-title\">" + art.getTitle());
                out.println("       </div>");
                out.println("   </a>");
                if(art.getDescription() != null && !art.getDescription().isEmpty()) {
                    out.println("   <div class=\"news-description\">" + art.getDescription());
                    out.println("   </div>");
                }
                out.println("</div>");
            }
        }
    %>
</div>

