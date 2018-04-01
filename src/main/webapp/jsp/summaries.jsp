<%-- 
    Document   : summaries
    Created on : Apr 1, 2018, 12:25:49 PM
    Author     : zua
--%>

<%@page import="backend.services.news.NewsArticleService"%>
<%@page import="db.news.NewsArticle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-md-12">
    <h2>Latest News from Around the World</h2>
    <div id="news-viewport" class = summaries>
        <%
            Iterable<NewsArticle> articles = null;
            if (request.getParameter("category") != null) {
                String category = request.getParameter("category");
                articles = new NewsArticleService().findArticlesTaggedAs(category);
            } else if (request.getParameter("publisher") != null) {
                String publisher = request.getParameter("publisher");
                articles = new NewsArticleService().findArticlesPublishedBy(publisher);
            } else if (request.getParameter("language") != null) {
                String language = request.getParameter("language");
                articles = new NewsArticleService().findArticlesWithLanguage(language);
            } else if (request.getParameter("country") != null) {
                String country = request.getParameter("country");
                articles = new NewsArticleService().findArticlesWithCountry(country);
            } else if (request.getParameter("search") != null) {
                String searchTerm = (String) request.getParameter("search");
                articles = new NewsArticleService().findArticlesWithText(searchTerm);
            } else {
                articles = new NewsArticleService().findAll(0, 25);
            }
            for (NewsArticle art : articles) {
                if (art.getImageUrl() != null && !art.getImageUrl().isEmpty()) {
                    out.println("<div class=\"summary\">");
                    out.println("   <a href=\"" + art.getUrl() + "\" target=\"_blank\">");
                    out.println("       <figure class=\"count-circle\" style=\"background:url(" + art.getImageUrl() + ") no-repeat center center; background-size:cover;\">");
                    out.println("           <figcaption>" + art.getTitle() + "</figcaption>");
                    out.println("       </figure>");
                    out.println("   </a>");
                    out.println("</div>");
                }
            }
        %>
    </div>
</div>

