<%-- 
    Document   : summaries
    Created on : Apr 1, 2018, 12:25:49 PM
    Author     : zua
--%>

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
        message = "News from around the World: LATEST";
        articles = new NewsArticleService().findAll(0, 25);
    }
%>
<div class="row summaries-context">
    <div class="col-sm-6 title">
        <% out.print(message); %>
    </div>
    <div class="col-sm-6 actions">
        <p>please!</p>
    </div>
</div>
<div class="summaries">
    <%
        for (NewsArticle art : articles) {
            String logoUrl = new NewsSourceService().findSourceWithSourceId(art.getSourceId()).getLogoUrl();
            if (art.getImageUrl() != null && !art.getImageUrl().isEmpty() && logoUrl != null) {
                out.println("<a href=\"" + art.getUrl() + "\" target=\"_blank\">");
                out.println("   <div class=\"summary\">");
                out.println("       <figure class=\"count-circle\" style=\"background:url(" + art.getImageUrl() + ") no-repeat center center; background-size:cover;\">");
                out.println("           <figcaption> <img class=\"source-img\" src=\"" + logoUrl + "\"><div>" + art.getTitle() + "</div></figcaption>");
                out.println("       </figure>");
                out.println("   </div>");
                out.println("</a>");
            }
        }
    %>
</div>

