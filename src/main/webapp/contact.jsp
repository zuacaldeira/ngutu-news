<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/mobile.css">
    <link rel="stylesheet" type="text/css" href="css/kontakt.css">
</head>

<body>

    <div id="wrapper">
        <!-- HEADER -->
        <header id="header">
            <!-- LOGO -->
            <div id="logo">
                ngutu.org
            </div>
        </header>

        <!-- NAVIGATION -->
        <nav class="top clearfix">
            <ul>
                <li><a href="index.jsp">home</a></li>
                <li><a href="about-us.jsp">about us</a></li>
                <li><a href="news.jsp">news</a></li>
                <li><a href="diaspora.jsp">diaspora</a></li>
                <li><a href="timeline.jsp">timeline</a></li>
                <li><a href="affiliated.jsp">affiliated</a></li>
                <li class="active"><a href="contact.jsp">contact</a></li>
                <li><a href="blog.jsp">blog</a></li>
            </ul>
        </nav>

        <!-- CONTENT -->
        <main id="content">
            <article class="top contact-form">
            <h1>Contact Form</h1>
                <fieldset class="clearfix">
                    <form method="get" action="" target="_blank">
                        <div class="abstand">
                            <label>First Name</label>
                            <input name="firstname" type="text" size="30" required>
                        </div>
                        <div class="abstand">
                            <label>Last Name</label>
                            <input name="lastname" type="text" size="30" required>
                        </div>
                        <div class="abstand">
                            <label>Email</label>
                            <input name="email" type="email" size="30" required>
                        </div>
                        <div class="abstand">
                            <label>Telephone</label>
                            <input name="telefone" type="tel" size="30">
                        </div>
                        <div class="abstand">
                            <label>Mobile</label>
                            <input name="mobile" type="tel" size="30">
                        </div>
                        <div class="abstand">
                            <label>Message</label>
                            <textarea name="message" cols="30" rows="5" required>
                        </textarea>
                        </div>
                        <div class="abstand">
                            <input name="save" type="submit" value="Save">
                            <input name="cancel" type="reset" value="Cancel">
                        </div>

                    </form>
                </fieldset>
            </article>

            <article class="bottom">
                <h2>Where you can find us</h2>
                <div>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2427.268521596022!2d13.361906715807853!3d52.528575679815866!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47a851978048ee03%3A0x6f0cc33d089cb512!2sLehrter+Str.+8%2C+10557+Berlin!5e0!3m2!1sde!2sde!4v1518046674384" width="75%" height="350" frameborder="0" style="border:0" allowfullscreen></iframe>
                </div>
            </article>

        </main>

        <!-- FOOTER -->
        <footer>
            <nav>
                <ul>
                    <li><a href="#">impressum</a></li>
                    <li><a href="#">privacy</a></li>
                </ul>
            </nav>
        </footer>
    </div>
</body>

</html>
