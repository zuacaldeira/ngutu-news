<%-- 
    Document   : nav
    Created on : Apr 1, 2018, 11:45:24 AM
    Author     : zua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="backend.utils.MyDateUtils"%>
<%@page import="java.util.TreeSet"%>
<%@page import="backend.services.news.NewsSourceService"%>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span> 
            </button>
            <a class="navbar-brand" href="#">news.ngutu.org</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">  
                <li class="active"><a href="index.jsp">Home</a></li>
                <li><a href="#news-viewport">Latest</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories<span class="caret"></span></a>
                    <ul class="dropdown-menu scrollable-menu">
                        <%
                            Iterable<String> categories = new NewsSourceService().findCategories();
                            for (String cat : categories) {
                                if (cat != null) {
                                    out.println("<li><a href=\"index.jsp?category=" + cat + "\" target=\"_self\">" + cat + "</a></li>");
                                }
                            }
                        %>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Publishers<span class="caret"></span></a>
                    <ul class="dropdown-menu scrollable-menu">
                        <%
                            Iterable<String> publishers = new NewsSourceService().findNames();
                            for (String pub : publishers) {
                                if (pub != null) {
                                    out.println("<li><a href=\"index.jsp?publisher=" + pub + "\" target=\"_self\">" + pub + "</a></li>");
                                }
                            }
                        %>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Languages<span class="caret"></span></a>
                    <ul class="dropdown-menu scrollable-menu">
                        <%
                            Iterable<String> languages = new NewsSourceService().findLanguages();
                            TreeSet<String> sortedLanguages = new TreeSet<String>();
                            for (String lang : languages) {
                                if (lang != null && MyDateUtils.getLanguage(lang) != null) {
                                    sortedLanguages.add(MyDateUtils.getLanguage(lang));
                                }
                            }
                            for (String sorted : sortedLanguages) {
                                if (sorted != null && MyDateUtils.getLanguageCode(sorted) != null) {
                                    out.println("<li><a href=\"index.jsp?language=" + MyDateUtils.getLanguageCode(sorted) + "\" target=\"_self\">" + sorted + "</a></li>");
                                }
                            }
                        %>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Countries<span class="caret"></span></a>
                    <ul class="dropdown-menu scrollable-menu">
                        <%
                            Iterable<String> countries = new NewsSourceService().findCountries();
                            TreeSet<String> sortedCountries = new TreeSet<String>();
                            for (String country : countries) {
                                if (country != null && MyDateUtils.getCountry(country) != null) {
                                    sortedCountries.add(MyDateUtils.getCountry(country));
                                }
                            }
                            for (String sorted : sortedCountries) {
                                if (MyDateUtils.getCountryCode(sorted) != null) {
                                    out.println("<li><a href=\"index.jsp?country=" + MyDateUtils.getCountryCode(sorted) + "\" target=\"_self\">" + sorted + "</a></li>");
                                }
                            }
                        %>
                    </ul>
                </li>
            </ul>
            <!--ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </ul-->
        </div>
    </div>
</nav>