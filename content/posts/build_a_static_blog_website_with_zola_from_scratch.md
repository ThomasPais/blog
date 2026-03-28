+++
title = "Build a static blog website with Zola from scratch"
description = "Learn how to build a static blog website with Zola like this one from scratch."
date = 2026-01-21
updated = 2026-01-24
[taxonomies]
tags = ["web"]
+++

## What is Zola?

[Zola](https://www.getzola.org) is a static site generator written in Rust. It is designed to be fast, flexible, and easy to use. It uses a template language called [Tera](https://keats.github.io/tera/). At the time of writing, Zola is in version 0.22.1.

Several [themes](https://www.getzola.org/themes/) are available to get a fully functional blog website up and running quickly. But if you want to build your own from scratch, you can follow this guide. Please note that creating your own site from scratch will require more effort but will give you full control and a deep understanding of how your website works.

## Getting started

First, we will install Zola and create a new project.

### Installing Zola

Zola is available on all platforms, including Linux, macOS, and Windows. You can install it by following the instruction on their [official website](https://www.getzola.org/documentation/getting-started/installation/).

### Creating a project

To create a new project, run the following command and accept all the defaults:

```sh
zola init my-blog
```

This will create a new directory named `my-blog` with a basic Zola project structure:

- **config.toml** - The main configuration file for your site settings.
- **content** - Contains your blog posts and pages.
- **sass** - Contains your .scss/.sass files.
- **static** - Contains static assets like images, fonts, and javascript files.
- **templates** - Contains the HTML templates used to generate the website.

## Building the blog

The first step is to serve the blog locally using the following command:

```sh
zola serve
```

This will generate the static files in memory and serve the website on a local server with live reloading enabled.

> [!note]
> To generate the final static files for production, run `zola build`.

The default page provided by Zola should appear at [http://localhost:1111](http://localhost:1111).

### Home page

To edit the home page, we need to create two template files:

- `templates/base.html` - The foundation for all other pages.
- `templates/index.html` - The home page template.

The `base.html` file contains the common HTML structure.

```html,hl_lines=5 10
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ config.title }}</title>
</head>
<body>
  <main>
    {% block content %} {% endblock content %}
  </main>
</body>
</html>
```

The viewport meta tag is used to control the layout and scaling of the page.

The `content` block in double curly braces is processed by the Tera template language. All the others templates will extends this base and provide the content.

Then the `index.html` file is the template used for the home page in Zola. 

```html
{% extends "base.html" %}

{% block content %}
  <h1>Welcome to my blog!</h1>
  <p>This is a static blog website built with Zola.</p>
{% endblock content %}
```

We extend the `base.html` template and provide the content for the home page. Thanks to this system, we do not need to duplicate the HTML structure for each page.

You should see the home page with the title and the content we provided.

### Creating your first post

The main advantage of using a static site generator like Zola is that it allows us to create and manage content easily and to write posts in [markdown](https://www.markdownguide.org/) format. 

To create a new post, we will need two more template files:

- `templates/posts.html` - The post list template file.
- `templates/post_page.html` - The post template file.

In the `posts.html` file, we can create a list of our posts also called a section:

```html
{% extends "base.html" %}

{% block content %}
  <h1>{{ section.title }}</h1>
  <div>
    {% for year, posts in section.pages | group_by(attribute="year") %}
    <h2>{{ year }}</h2>
    <ul>
      {% for post in posts %}
      <li><a href="{{ post.permalink }}">{{ post.title }}</a></li>
      {% endfor %}
    </ul>
    {% endfor %}
  </div>
{% endblock content %}
```

Here we group the posts by year and display them in a list.

Now we need to create the template `post_page.html` used by each post page:

```html,hl_lines=5
{% extends "base.html" %}

{% block content %}
  <h1>{{ page.title }}</h1>
  {{ page.content | safe }}
{% endblock content %}
```

The `page.content` will render the markdown content of the post as HTML.

Now that we have defined the templates, we can create the markdown files for the posts:

- `content/posts/_index.md` - The posts list page.
- `content/posts/first.md` - The first post.
- `content/posts/second.md` - The second post.

The section `content/posts/_index.md` will be used to display the list of posts.

```md
+++
title = "Posts"
sort_by = "date"
template = "posts.html"
page_template = "post_page.html"
+++
```

We can now create the posts:

```md
+++
title = "My first post"
date = 2026-01-20
+++

This is my first blog post.
```

```md
+++
title = "My second post"
date = 2026-01-20
+++

This is my second blog post.
```

The `+++` section is called a frontmatter and it will contains information about the page.

You can visit the posts list page at `/posts` on the local server.

## Improving the blog

Now that the basic structure is in place, we can write posts easily. However, the content is not easily accessible and is not very appealing...

### Adding a navigation menu

A navigation menu is a list of links to the different pages of your website. It is a good way to help users navigate your website.

To add a navigation menu, we can create a `header.html` file in the `templates/partials` directory:

```html
<header>
  <nav>
    <ul>
      {% for link in config.extra.header.links %}
      <li>
        <a href="{{ link.url }}">{{ link.name | upper }}</a>
      </li>
      {% endfor %}
    </ul>
  </nav>
</header>
```

Then we can include the navigation menu in the `templates/base.html` file:

```html,hl_lines=9
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ config.title }}</title>
</head>
<body>
  {% include "partials/header.html" %}
  <main>
    {% block content %} {% endblock content %}
  </main>
</body>
</html>
```

We include our partial with the `include` keyword.

Now, you need to update the `config.toml` file to specify the navigation menu links:

```toml
[extra.header]
links = [
    { name = "Home", url = "/" },
    { name = "Posts", url = "/posts" },
    { name = "Search", url = "/search" },
]
```

You should see in every page of your blog a navigation menu. The search page is not yet implemented but we will add it later.

### Styling the blog

Right now, the blog is using the default styles provided by your browser. Zola supports [SCSS](https://sass-lang.com), which is a preprocessor language that extends CSS out of the box. Make sure that `compile_sass = true` is set in your `config.toml` file.

To add some styling, we can create a new SCSS file in the `sass` directory called `styles.scss`:

```scss
body {
    margin: 0;
    background-color: royalblue;
}
```

All SCSS files will be compiled into a single CSS file that will be included in the HTML page.

To include the CSS file in the HTML page, we need to add a link tag in the `templates/base.html` file:

```html
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>{{ config.title }}</title>
  <link rel="stylesheet" href="/styles.css" />
</head>
```

You should see the background color of the page changed to blue. You should take some time to customize the styles to your liking by adding some classes to the HTML elements and styling them.

### Adding search

Zola makes it easy to add a search feature to your blog. It can build a search index from your content and provide a javascript search library called `elasticlunr`. We only need to add a search page and some javascript to use the search feature.

First we need to tell Zola in `config.toml` a to create an index of our posts that will be use in the search script:

```toml
build_search_index = true

[search]
index_format = "elasticlunr_json"
```

Next, we will create a script that will use the `elasticlunr` library to search our posts in `static/js/search.js` I picked a script from the official Zola website but you can use mine at [thomaspais.com/js/search.js](https://thomaspais.com/js/search.js).

Now we will just import this javascript in the `base.html` file:
 
```html,hl_lines=5
<body>
  <main>
    {% block content %} {% endblock content %}
  </main>
  {% if page.extra.load_search or section.extra.load_search %}
  <script type="text/javascript" src="{{/* get_url(path="elasticlunr.min.js") */}}">
  </script>
  <script type="text/javascript" src="{{/* get_url(path="js/search.js") */}}">
  </script>
  {% endif %}
</body>
```

I have added a condition to only load the javascript in the search page to prevent unnecessary load time in the other pages.

Now we can create a template for the search page in `templates/search.html`:

```html
{% extends "base.html" %} 
{% block content %}
<h1 class="title">{{ page.title }}</h1>
<input type="text" id="search-input" placeholder="Search..." />
<div class="search-results">
  <ul class="search-results__items"></ul>
</div>
{% endblock content %}
```

Finally, we need to create a search page in `content/search.md`:

```md
+++
title = "Search"
template = "search.html"
in_search_index = false
generate_feeds = false
[extra]
load_search = true
+++
```

You should now be able to go to the search page using the navigation menu and search your blog posts using the search page.

## Conclusion

I hope this post helped you get started with Zola. Now you can expend your blog website to your liking by adding more pages like a contact page, an about page or anything else you can think of.
