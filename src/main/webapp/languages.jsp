<%@page import="backend.utils.MyDateUtils"%>
<%@page import="java.util.TreeSet"%>
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
                        <li id="logo" class="logo"><a href="http://www.ngutu.org">n</a></li>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="latest.jsp">Latest</a></li>
                        <li><a href="categories.jsp">Categories</a></li>
                        <li><a href="publishers.jsp">Publishers</a></li>
                        <li class="active"><a href="languages.jsp">Languages</a></li>
                        <li><a href="countries.jsp">Countries</a></li>
                        <li><a href="search.jsp">Search</a></li>
                    </ul>
                </nav>
                
                <h1>Search like a Polygot!</h1>
                <fieldset id="fieldset">
                    <form id="form" name="language-form" method="get" action="languages.jsp">
                        <div>
                            <%
                            NewsSourceService service = new NewsSourceService();
                            Iterable<String> languages = service.findLanguages();
                            TreeSet<String> sortedLanguages = new TreeSet<String>();
                            for(String lang: languages) {
                                if(lang != null && MyDateUtils.getLanguage(lang) != null) {
                                    sortedLanguages.add(MyDateUtils.getLanguage(lang));
                                }
                            }
                            out.println("<select name=\"language\" required>");
                            out.println("<option>&nbsp;</option>");
                            for(String sorted: sortedLanguages) {
                                if(sorted != null) {
                                    out.println("<option>" + sorted + "</option>");
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
                                String lang = request.getParameter("language");
                                if (lang != null) {
                                    lang = MyDateUtils.getLanguageCode(lang);
                                    out.println("Looking up for: " + lang);
                                    Iterable<NewsArticle> articles = new NewsArticleService().findArticlesWithLanguage(lang);
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
