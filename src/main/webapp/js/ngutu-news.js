/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const HOST = "";

$(function () {
    initNavigation();
    initJumbotron();
});


function initNavigation() {
    $('.dropdown > a').on('click', function (e) {
        e.preventDefault();
        $('.dropdown > a.active').removeClass('active');
        $(this).addClass('active');

        openPopup($(this).parent());
    });
}


function openPopup(dropdown) {
    if (dropdown.attr('class').includes('publishers')) {
        initPublishersPopupMenu();
    } else if (dropdown.attr('class').includes('categories')) {
        initCategoriesPopupMenu();
    } else if (dropdown.attr('class').includes('languages')) {
        initLanguagesPopupMenu();
    }

}

function initJumbotron() {
    // 1 - Set background css property to point at https://source.unsplash.com/
    $('#jumbotron').css({
        background: "url(https://source.unsplash.com/random?news)",
        backgroundSize: "cover",
        backgroundRepeat: "no-repeat",
        backgroundPosition: "center"

    });
    // 2 - Hide teaser
    $('#teaser').fadeTo(1000, 1);

    // 3 - On hover, fade back to 1
    $('#jumbotron').hover(
            function () {
                $('#teaser').fadeTo(500, 1);
            },
            function () {
                $('#teaser').fadeTo(500, .2);
            }
    );
}

function initPublishersPopupMenu() {
    var $dropdown = $('.dropdown.publishers .dropdown-content').css({width: "516px"});
    $.getJSON("sample/publishers.json").done(function (data) {
        $.each(data, function (index) {
            var $publisher = $('<a>').attr("class", "menu-item clearfix").attr("href", "#");
            var $logoUrl = $('<img>')
                    .attr("class", "logoUrl")
                    .attr("src", data[index].logoUrl)
                    .attr("title", data[index].name)
                    .attr("class", "circle");
            var $name = $('<p>').attr("class", "name").text(data[index].name);

            $logoUrl.on('load', function () {
                $publisher.append($logoUrl)
                        .append($name)
                        .css({width: "232px"})
                        .appendTo($dropdown);
            });
        });
    });
}

function initCategoriesPopupMenu() {
    var $dropdown = $('.dropdown.categories .dropdown-content').css({width: "232px"});
    $.getJSON("sample/categories.json").done(function (data) {
        $.each(data, function (index) {
            var $category = $('<a>').attr("class", "menu-item clearfix").attr("href", "#");
            var $name = $('<p>').attr("class", "tag").text(data[index].tag);
            $category.append($name).css({width: "232px"}).appendTo($dropdown);
        });
    });
}





function centerOptions(container) {

}