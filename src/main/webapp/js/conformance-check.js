

$(document).ready(function () {
    log("START");
    checkDesignConformance();
});


function log(message) {
    console.log("Ngutu News Javascript => " + message);
}

function checkDesignConformance() {
    checkHtmlStructure();
    checkIds();
}

function checkHtmlStructure() {
    checkHead();
    checkBody();
}

function checkHead() {
    checkCharset();
    checkTitle();
    checkNoHeadScript();
    checkCssLink();
}

function checkCharset() {
    var charset = $('head meta').attr("charset");
    console.assert(charset === "utf-8");
}

function checkTitle() {
    var title = $('head title');
    console.assert(title.text() === "Ngutu News");    
}

function checkNoHeadScript() {
    var scripts = $('head script');
    console.assert(scripts.length === 0);
}

function checkCssLink() {
    var src = $('head link').attr("href");
    console.assert(src === "css/style.css");
}


function checkBody() {
    checkHeader();
    checkMain();
    checkFooter();
}

function checkHeader() {
    checkTopMenu();
    checkJumbotron();
    checkContextMenu();
}

function checkTopMenu() {
    var topMenu = $('nav#navbar');
    console.assert(topMenu.length === 1);
}

function checkJumbotron() {
    var jumbotron = $('#jumbotron');
    console.assert(jumbotron.length === 1);
}

function checkContextMenu() {
    var menu = $('#content-menu');
    console.assert(menu.length === 1);
}

function checkMain() {
    var main = $('main');
    console.assert(main.length === 1);
    
    var summaries = $('main #summaries');
    console.assert(summaries.length === 1);
}

function checkFooter() {
    var footer = $('footer');
    console.assert(footer.length === 1);
    
    var footerMenu = $('footer nav#footer-menu');
    console.assert(footerMenu.length === 1);
}

function checkIds() {
    console.assert($('#navbar').length === 1);
    console.assert($('#brand').length === 1);
    console.assert($('#jumbotron').length === 1);
    console.assert($('#teaser').length === 1);
    console.assert($('#teaser-title').length === 1);
    console.assert($('#teaser-subtitle').length === 1);
    console.assert($('#search-form').length === 1);
    console.assert($('#search-input').length === 1);
    console.assert($('#search-button').length === 1);
    console.assert($('#content-menu').length === 1);
    console.assert($('#breadcrumb').length === 1);
    console.assert($('#content-actions').length === 1);
    console.assert($('#summaries').length === 1);
    console.assert($('#footer-menu').length === 1);
}

