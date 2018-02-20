<%@page import="db.news.NewsSource"%>
<%@page import="backend.services.news.NewsSourceService"%>
<%@page import="db.news.NewsArticle"%>
<%@page import="backend.services.news.NewsArticleService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>

    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/header-form.css">
        <link rel="stylesheet" type="text/css" href="css/mobile.css">
    </head>

    <body>

        <div id="wrapper">

            <!-- HEADER -->
            <header>
                <!-- TOP NAVIGATION  -->
                <nav class="top clearfix">
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="latest.jsp">Latest</a></li>
                        <li><a href="categories.jsp">Categories</a></li>
                        <li class="active"><a href="publishers.jsp">Publishers</a></li>
                        <li><a href="languages.jsp">Languages</a></li>
                        <li><a href="countries.jsp">Countries</a></li>
                        <li><a href="search.jsp">Search</a></li>
                    </ul>
                </nav>
            </header>


            <!-- MAIN CONTENT -->
            <main>
                <article>
                    <section class="top">
                        <h1>Search for News from Publisher</h1>
                        <fieldset id="category-fieldset">
                            <form id="category-form" name="category-form" method="get" action="publishers.jsp">
                                <div>
                                    <%
                                        out.println("<select name=\"publisher\" required>");
                                        out.println("<option>&nbsp;</option>");
                                        NewsSourceService service = new NewsSourceService();
                                        Iterable<String> publishers = service.findNames();
                                        out.println("Found any category? " + publishers.iterator().hasNext());
                                        for (String pub : publishers) {
                                            if (pub != null) {
                                                out.println("<option>" + pub + "</option>");
                                            }
                                        }
                                        out.println("</select>");
                                    %>
                                    <input type="submit" value="Go!">
                                </div>
                            </form>
                        </fieldset>
                    </section>
                                    
                    <section class="detail">
                        <div class="summaries clearfix">
                            <%
                                String name = request.getParameter("publisher");
                                if (name != null) {
                                    Iterable<NewsArticle> articles = new NewsArticleService().findArticlesPublishedBy(name);
                                    for (NewsArticle art : articles) {
                                        if (art.getImageUrl() != null && !art.getImageUrl().isEmpty()) {
                                            out.println("<div class=\"summary\">");                                            
                                            out.println("<a href=\"" + art.getUrl() + "\" target=\"_blank\">");
                                            out.println("   <figure class=\"count-circle\" style=\"background:url(" + art.getImageUrl() + ") no-repeat center center; background-size:cover;\">");
                                            out.println("       <figcaption>" + art.getTitle() + "</figcaption>");
                                            out.println("   </figure>");
                                            out.println("</a>");
                                            out.println("</div>");
                                        }
                                    }
                                    articles = null;
                                }
                            %>
                        </div>
                    </section>
                </article>
            </main>

            <!-- FOOTER -->
            <footer>
                <nav>
                    <ul>
                        <li><a href="#">impressum</a></li>
                        <li><a href="#">privacy</a></li>
                        <li><a href="#">about us</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                        <li><a href="blog.jsp">Blog</a></li>
                    </ul>
                </nav>
            </footer>
        </div>
    </body>

</html>
