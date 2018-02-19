<%@page import="backend.services.news.NewsSourceService"%>
<%@page import="db.news.NewsArticle"%>
<%@page import="backend.services.news.NewsArticleService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>

    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/mobile.css">
        <link rel="stylesheet" type="text/css" href="css/header-form.css">
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
                        <li class="active"><a href="categories.jsp">Categories</a></li>
                        <li><a href="publishers.jsp">Publishers</a></li>
                        <li><a href="languages.jsp">Languages</a></li>
                        <li><a href="countries.jsp">Countries</a></li>
                        <li><a href="search.jsp">Search</a></li>
                    </ul>
                </nav>
                <h1>Search for News by Tag</h1>
                
                <fieldset id="category-fieldset">
                    <form id="category-form" name="category-form" method="get" action="categories.jsp">
                        <div>
                            <%
                            out.println("<select name=\"category\" required>");
                            out.println("<option>&nbsp;</option>");
                            Iterable<String> categories = new NewsSourceService().findCategories();
                            out.println("Found any category? " + categories.iterator().hasNext());
                            for(String cat: categories) {
                                if(cat != null) {
                                    out.println("<option>" + cat + "</option>");
                                }
                            }
                            out.println("</select>");
                                %>
                            <input type="submit" value="Go!">
                        </div>
                    </form>
                </fieldset>
            </header>


            <!-- MAIN CONTENT -->
            <main>
                <section class="latest articles">
                    <article>
                        <div class="figures clearfix">
                        <%
                            String category = request.getParameter("category");
                            if (category != null) {
                                Iterable<NewsArticle> articles = new NewsArticleService().findArticlesTaggedAs(category);
                                for (NewsArticle art : articles) {
                                    if (art.getImageUrl() != null && !art.getImageUrl().isEmpty()) {
                                        out.println("<a href=\"" + art.getUrl() + "\" target=\"_blank\">");
                                        out.println("   <figure class=\"count-circle\" style=\"background:url(" + art.getImageUrl() + ") no-repeat center center; background-size:cover;\">");
                                        out.println("       <figcaption>" + art.getTitle() + "</figcaption>");
                                        out.println("   </figure>");
                                        out.println("</a>");
                                    }
                                }
                                articles = null;
                            }
                        %>
                        </div>
                    </article>
                </section>
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
